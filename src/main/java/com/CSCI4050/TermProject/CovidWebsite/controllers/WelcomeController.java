package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {

    AccountRepository accountRepo;

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String showWelcmPage(Model model) {
        return "welcome";
    }

    @RequestMapping(value = "welcome/edit/{email}", method = RequestMethod.GET)
    public String getEditUserData(@PathVariable("email") String email, Model model, AccountEntity accountForm) {

        model.addAttribute("accountEmail", email);
        return "editProfile";
    }

    @RequestMapping(value = "editProfile", method = RequestMethod.GET)
    public String showEditProfilePage(Model model, AccountEntity accountForm) {
        model.addAttribute("email", accountForm.getEmail());
        model.addAttribute("password", accountForm.getPassword());
        return "editProfile";
    }

    @RequestMapping(value = "editProfile", method = RequestMethod.POST)
    public String sendEditProfilePage(@ModelAttribute("accountForm") AccountEntity accountForm, Model model) {
        AccountEntity accountInstance = accountRepo.findByEmail(accountForm.getEmail());

        accountInstance.setEmail(accountForm.getEmail());
        accountInstance.setPassword(accountForm.getPassword());

        accountRepo.save(accountForm);

        return "editProfile";
    }

    // @RequestMapping(value = "editProfile/{email}", method = RequestMethod.GET)
    // public String Data(@PathVariable("email") String email, Model model) {
    // AccountEntity accountInstance = accountRepo.findByEmail(email);

    // model.addAttribute("accountForm", accountInstance);
    // return "editProfile";
    // }
}
