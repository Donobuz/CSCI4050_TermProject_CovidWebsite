package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.servlets.Utility;
import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;

@Controller
public class RegistrationController {

    @Autowired
    private AccountRepository accountRepo;

    @Autowired
    private JavaMailSender mailSender;

    public RegistrationController(AccountRepository accountRepo) {
        this.accountRepo = accountRepo;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String showRegPage(ModelMap model) {
        model.addAttribute("accountForm", new AccountEntity());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("accountForm") AccountEntity accountForm, BindingResult bindingResult,
            Model model, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        // Password encoder called when registration happens
        int saltLength = 16; // salt length in bytes
        int hashLength = 32; // hash length in bytes
        int parallelism = 1; // currently not supported by Spring Security
        int memory = 4096; // memory costs
        int iterations = 3;

        Argon2PasswordEncoder argon2PasswordEncoder = new Argon2PasswordEncoder(saltLength, hashLength, parallelism,
                memory, iterations);
        String encodePassword = argon2PasswordEncoder.encode(accountForm.getPassword());
        accountForm.setPassword(encodePassword);
        accountForm.setEmail(accountForm.getEmail().toLowerCase());

        // Grabs information from view and saves them to attribute to save to database
        model.addAttribute("userName", accountForm.getUserName());
        // model.addAttribute("email", accountForm.getEmail());
        model.addAttribute("firstName", accountForm.getFirstName());
        model.addAttribute("lastName", accountForm.getLastName());
        // model.addAttribute("password", encodePassword);
        model.addAttribute("age", accountForm.getAge());
        // model.addAttribute("gender", accountForm.getGender());

        // Email Verification
        String randomVerificationCode = RandomString.make(64);
        accountForm.setVerificationCode(randomVerificationCode);
        String siteURL = Utility.getSiteURL(request);

        // checks if an email and username are unique;
        // if email or username already exists in database, throws error // might need
        // to change this
        AccountEntity emailChecker = accountRepo.findByEmail(accountForm.getEmail());
        AccountEntity userNameChecker = accountRepo.findByUserName(accountForm.getUserName());

        if (emailChecker != null || userNameChecker != null) {
            System.out.println("The email or username already exists");
            return "redirect:registration";
        } else {
            accountForm.setCreatedDate(new Date());
            accountForm.setEnabled(false);
            accountRepo.save(accountForm);
            sendVerificationEmail(accountForm, siteURL);
            return "redirect:login";
        }

    }

    // ======================================================================================
    // Email Verification

    @GetMapping("/verify")
    public String verifyEmail(@Param("code") String code, Model model) {
        boolean verified = verify(code);
        String pageTitle = verified ? "Verification Succeeded!" : "Verification Failed";
        model.addAttribute("pageTitle", pageTitle);
        return verified ? "verifySuccess" : "verifyFail";
    }

    private void sendVerificationEmail(AccountEntity accountForm, String siteURL)
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

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String showNewsPage(ModelMap model) {
        return "news";
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String showWelcmPage(ModelMap model) {
        return "welcome";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String showProfilePage(ModelMap model) {
        return "profile";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String showProfileVal(ModelMap model) {
        return "profile";
    }
}
