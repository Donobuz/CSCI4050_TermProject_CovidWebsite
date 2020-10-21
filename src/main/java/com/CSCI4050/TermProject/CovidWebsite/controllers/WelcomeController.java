package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {

    @Autowired
    AccountRepository accountRepo;

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String showWelcomePage() {
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
    public Object enterEditUserData(@ModelAttribute("login") AccountEntity accountForm, @PathVariable("emailParameter") String email) {

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
        accountInstance.setPassword(encodePassword);


        accountInstance.setEmail(accountForm.getEmail().toLowerCase());
        accountInstance.setFirstName(accountForm.getFirstName());
        accountInstance.setLastName(accountForm.getLastName());
        accountInstance.setAge(accountForm.getAge());
        accountInstance.setUserName(accountForm.getUserName());

        if (emailChecker != null || userNameChecker != null) {
            System.out.println("Email or Username already exists");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        } else if (accountForm.getPassword().isEmpty()) {
            System.out.println("Password Cant be emtpy");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        } else {
            accountRepo.save(accountInstance);
            return "redirect:/login";
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
