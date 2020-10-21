package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;

import org.springframework.beans.factory.annotation.Autowired;
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
    public String enterEditUserData(@ModelAttribute("login") AccountEntity accountForm, @PathVariable("emailParameter") String email) {
        AccountEntity accountInstance = accountRepo.findByEmail(email);
        accountInstance.setEmail(accountForm.getEmail().toLowerCase());
        accountInstance.setFirstName(accountForm.getFirstName());
        accountInstance.setLastName(accountForm.getLastName());
        accountInstance.setAge(accountForm.getAge());
        accountInstance.setUserName(accountForm.getUserName());
        accountRepo.save(accountInstance);

        return "redirect:/login";
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
