package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class LoginController {

    @Autowired
    private AccountRepository accountRepo;

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String showLoginPage(ModelMap model){
        model.addAttribute("login", new AccountEntity());
        return "login";
    }

    @RequestMapping(value="/login", method = RequestMethod.POST)
    public Object submitLoginIn(@ModelAttribute("login") AccountEntity accountForm){

        AccountEntity accountInstance = accountRepo.findByEmail(accountForm.getEmail());

        // Password Verifier using Argon2
        Argon2PasswordEncoder argon2PasswordEncoder = new Argon2PasswordEncoder();
        boolean passwordMatch = argon2PasswordEncoder.matches(accountForm.getPassword(), accountInstance.getPassword());


        //issue where if i use caps email, throws null pointer exception
        if(accountInstance == null || !passwordMatch)
        {
            System.out.println("Invalid Email or Password");
            //return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
            return "login";
        }
        else if(accountInstance.isEnabled() == false)
        {
            System.out.println("Cant login cause not verified");
            return "login";
        }
        else {
            System.out.println("account exist");
            return "redirect:welcome"; //Change later
        }

    }
}
