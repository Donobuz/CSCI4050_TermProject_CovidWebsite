package com.CSCI4050.TermProject.CovidWebsite.controllers;
import com.CSCI4050.TermProject.CovidWebsite.Servlets.Utility;
import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
@SessionAttributes("name")
public class MainController {

    @Autowired
    private AccountRepository accountRepo;

    @Autowired
    private JavaMailSender mailSender;

    public MainController(AccountRepository accountRepo) {
        this.accountRepo = accountRepo;
    }



        @RequestMapping(value="/userData", method = RequestMethod.GET)
        public String showUserData(ModelMap model){
            model.addAttribute("userForm", accountRepo.findAll());
            return "userData";
        }

        @RequestMapping(value="/registration", method = RequestMethod.GET)
        public String showRegPage(ModelMap model){
            model.addAttribute("accountForm", new AccountEntity());
            return "registration";
        }

        @RequestMapping(value="/registration", method = RequestMethod.POST)
        public Object registerAccount(@ModelAttribute("accountForm") AccountEntity accountForm, BindingResult bindingResult, Model model, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {

            if (bindingResult.hasErrors()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
            }

            //Grabs information from view and saves them to attribute to save to database
            model.addAttribute("userName", accountForm.getUserName());
            model.addAttribute("email", accountForm.getEmail());
            model.addAttribute("firstName", accountForm.getFirstName());
            model.addAttribute("lastName", accountForm.getLastName());
            model.addAttribute("password", accountForm.getPassword());
            model.addAttribute("age", accountForm.getAge());
            //model.addAttribute("gender", accountForm.getGender());

            //Email Verification
            String randomVerificationCode = RandomString.make(64);
            accountForm.setVerificationCode(randomVerificationCode);
            String siteURL = Utility.getSiteURL(request);



            //checks if an email and username are unique;
            //if email or username already exists in database, throws error // might need to change this
            AccountEntity accountChecker = accountRepo.findByEmail(accountForm.getEmail());

            if(accountChecker != null){
                System.out.println("The email or username already exists");
                return "redirect:registration";
            }
            else{
                accountForm.setCreatedDate(new Date());
                accountForm.setEnabled(false);
                accountRepo.save(accountForm);
                sendVerificationEmail(accountForm,siteURL);
                return "redirect:login";
            }

    }

    private void sendVerificationEmail(AccountEntity accountForm, String siteURL) throws UnsupportedEncodingException, MessagingException {
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

    @RequestMapping(value="/login", method = RequestMethod.GET)
        public String showLoginPage(ModelMap model){
        model.addAttribute("login", new AccountEntity());
            return "login";
        }

    @RequestMapping(value="/login", method = RequestMethod.POST)
    public Object submitLoginIn(@ModelAttribute("login") AccountEntity accountForm){

        AccountEntity accountInstance = accountRepo.findByEmail(accountForm.getEmail());

            if(accountInstance == null || !accountInstance.getPassword().equals(accountForm.getPassword()))
            {
                System.out.println("Invalid Email or Password");
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
            }
            else {
                System.out.println("account exist");
                return "redirect:welcome"; //Change later
            }

        }


        @RequestMapping(value="/news", method = RequestMethod.GET)
        public String showNewsPage(ModelMap model){
        return "news";
    }

        @RequestMapping(value="/welcome", method = RequestMethod.GET)
        public String showWelcmPage(ModelMap model){
        return "welcome";
    }
}

