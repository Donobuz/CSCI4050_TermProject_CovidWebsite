package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.entities.RequestEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;

import com.CSCI4050.TermProject.CovidWebsite.servlets.Utility;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Controller
public class WelcomeController {

    @Autowired
    AccountRepository accountRepo;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String showWelcomePage() {
        return "welcome";
    }

    @RequestMapping(value = "/welcome/{userNameParameter}", method = RequestMethod.GET)
    public String showWelcomePage2(@PathVariable("userNameParameter") String userName, Model model) {
        AccountEntity accountInstance = accountRepo.findByUserName(userName);

        model.addAttribute("account", accountInstance);

        return "welcome";
    }


    @RequestMapping(value = "edit/{emailParameter}", method = RequestMethod.GET)
    public String getEditUserData(@PathVariable("emailParameter") String email, Model model) {

        AccountEntity accountInstance = accountRepo.findByEmail(email);
        model.addAttribute("editProfile", new AccountEntity());
        model.addAttribute("accountInstance", accountInstance);

        return "editProfile";
    }


    @RequestMapping(value = "edit/{emailParameter}", method = RequestMethod.POST)
    public Object enterEditUserData(@ModelAttribute("editProfile") AccountEntity accountForm, @PathVariable("emailParameter") String email, Model model, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {

        AccountEntity accountInstance = accountRepo.findByEmail(email); // Grabs the instance of the email specified (gets all information associated with email)

        AccountEntity userNameChecker = accountRepo.findByUserName(accountForm.getUserName());
        AccountEntity emailChecker = accountRepo.findByEmail(accountForm.getEmail());



        // Password encoder called when registration happens
        int saltLength = 16; // salt length in bytes
        int hashLength = 32; // hash length in bytes
        int parallelism = 1; // currently not supported by Spring Security
        int memory = 4096; // memory costs
        int iterations = 3;

        Argon2PasswordEncoder argon2PasswordEncoder = new Argon2PasswordEncoder(saltLength, hashLength, parallelism,
                memory, iterations);
        String encodePassword = argon2PasswordEncoder.encode(accountForm.getPassword());



        // Need to fix these conditional statements
        if (emailChecker != null || userNameChecker != null) {
            System.out.println("Email or Username already exists");
            model.addAttribute("editProfile", new AccountEntity());
            model.addAttribute("accountInstance", accountInstance);
            model.addAttribute("emailUsernameExists", "The Email or Username already exists");

        }

        if (accountForm.getPassword().isEmpty()) {
            System.out.println("Password Cant be empty");
            model.addAttribute("editProfile", new AccountEntity());
            model.addAttribute("accountInstance", accountInstance);
            model.addAttribute("passwordEmpty", "Password cannot be empty");
            return "editProfile";
        }

        if (!(emailChecker != null || userNameChecker != null) && !(accountForm.getPassword().isEmpty())) {
            String siteURL = Utility.getSiteURL(request);
            accountInstance.setPassword(encodePassword);
            accountInstance.setEmail(accountForm.getEmail().toLowerCase());
            accountInstance.setFirstName(accountForm.getFirstName());
            accountInstance.setLastName(accountForm.getLastName());
            accountInstance.setAge(accountForm.getAge());
            accountInstance.setUserName(accountForm.getUserName());
            accountInstance.setEnabled(false);
            accountRepo.save(accountInstance);
            VerificationEmail(accountInstance, siteURL);
            return "editProfileSuccess";
        }
        return "editProfile";

    }


    @GetMapping("/verifyEditedEmail")
    public String verifyEditedEmail(@Param("code") String code, Model model) {
        boolean verified = verify(code);
        String pageTitle = verified ? "Verification Succeeded!" : "Verification Failed";
        model.addAttribute("pageTitle", pageTitle);
        return verified ? "verifySuccess" : "verifyFail";
    }

    private void VerificationEmail(AccountEntity accountForm, String siteURL)
            throws UnsupportedEncodingException, MessagingException {
        String subject = "Please verify your registration";
        String senderName = "DawgsvsCovid";
        String mailContent = "<p>Dear " + accountForm.getFirstName() + ", </p>";
        mailContent += "<p> Please click the link below to verify your email address</p>";
        String verifyURL = siteURL + "/verify?code=" + accountForm.getVerificationCode();
        mailContent += "<h3><a href=\"" + verifyURL + "\"> VERIFY </a></h3>";
        mailContent += "<p>Thank you<br> The DawgsVsCovid Team</p>";
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setFrom("DawgsvsCovid@gmail.com", senderName);
        helper.setTo(accountForm.getEmail());
        helper.setSubject(subject);
        helper.setText(mailContent, true);
        mailSender.send(message);

    }

    public boolean verify(String verificationCode) {
        AccountEntity accountInstance = accountRepo.findByVerificationCode(verificationCode);
        if (accountInstance == null || accountInstance.isEnabled()) {
            return false;
        } else {
            accountInstance.setEnabled(true);
            accountRepo.save(accountInstance);
            return true;
        }
    }


//    @RequestMapping(value = "editProfile", method = RequestMethod.GET)
//    public String showEditProfilePage(Model model, AccountEntity accountForm) {
//        model.addAttribute("editProfile", new AccountEntity());
//        return "editProfile";
//    }
//
//
//    @RequestMapping(value = "editProfile", method = RequestMethod.POST)
//    public String sendEditProfilePage(@ModelAttribute("account") AccountEntity accountForm, Model model) {
//
//        accountForm.setEmail(accountForm.getEmail());
//
//        accountRepo.save(accountForm);
//
//        return "editProfile";
//    }

    // @RequestMapping(value = "editProfile/{email}", method = RequestMethod.GET)
    // public String Data(@PathVariable("email") String email, Model model) {
    // AccountEntity accountInstance = accountRepo.findByEmail(email);

    // model.addAttribute("accountForm", accountInstance);
    // return "editProfile";
    // }
}
