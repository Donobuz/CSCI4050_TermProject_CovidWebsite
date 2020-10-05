package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserDataController {

    @Autowired
    AccountRepository accountRepo;

    @RequestMapping(value="/userData", method = RequestMethod.GET)
    public String showUserData(ModelMap model){
        model.addAttribute("accountForm", accountRepo.findAll());
        return "userData";
    }
}
