package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.entities.RequestEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class DonationController {

    @Autowired
    RequestRepository requestRepo;

    @RequestMapping(value = "/donation", method = RequestMethod.GET)
    public String showDonationData(ModelMap model) {
        model.addAttribute("requestForm", requestRepo.findAll());
        return "donation";
    }

    @RequestMapping(value = "/donate", method = RequestMethod.GET)
    public String donateMoney(@RequestParam("id") Long id, Model model) {
        Optional<RequestEntity> requestForm = requestRepo.findById(id);

        model.addAttribute("accountForm", requestRepo.findAll());
        requestForm.get().setActive(false);
        requestRepo.save(requestForm.get());
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
