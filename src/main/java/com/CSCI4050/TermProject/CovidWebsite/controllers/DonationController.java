package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.entities.CreditEntity;
import com.CSCI4050.TermProject.CovidWebsite.entities.RequestEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;
import com.CSCI4050.TermProject.CovidWebsite.repository.RequestRepository;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
public class DonationController {

    @Autowired
    RequestRepository requestRepo;

    @Autowired
    AccountRepository accountRepo;

    @RequestMapping(value = "/donation", method = RequestMethod.GET)
    public String showDonationData(ModelMap model) {
        model.addAttribute("requestForm", requestRepo.findAll());
        return "donation";
    }

    @RequestMapping(value = "/donate/{id}", method = RequestMethod.GET)
    public String donateMoney(@PathVariable("id") Long id, Model model) {
        RequestEntity requestForm = requestRepo.findById(id);
        AccountEntity account = accountRepo.findByUserName(requestForm.getAccount().getUserName());

        model.addAttribute("requestForm", requestForm);
        model.addAttribute("accountForm", account);

        return "checkout";
    }

    @RequestMapping(value = "/donate/{id}", method = RequestMethod.POST)
    public String saveCreditCard(@ModelAttribute("creditCardForm")CreditEntity creditForm, Model model) {
        


        return "redirect:/donation";
    }

    // Both methods work for deleting a user out of the database

    // @RequestMapping(value = "/userData/delete/{email}", method =
    // RequestMethod.GET)
    // public String deleteUserData(@PathVariable("email") String email, Model
    // model) {
    // AccountEntity accountForm = accountRepo.findByEmail(email);

    // accountRepo.delete(accountForm);
    // model.addAttribute("accountForm", accountRepo.findAll());
    // return "userData";
    // }
}
