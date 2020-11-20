package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.entities.CreditEntity;
import com.CSCI4050.TermProject.CovidWebsite.entities.RequestEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;
import com.CSCI4050.TermProject.CovidWebsite.repository.RequestRepository;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;
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

    @RequestMapping(value = "/donate/{userNameParameter}/{id}", method = RequestMethod.GET)
    public String donateMoney(@PathVariable("id") Long id, @PathVariable("userNameParameter") String userName, Model model) {
        RequestEntity requestForm = requestRepo.findById(id);
        AccountEntity accountInstance = accountRepo.findByUserName(userName);


        model.addAttribute("requestForm", requestForm);
        model.addAttribute("creditCardForm", new CreditEntity());
        model.addAttribute("account", accountInstance);

        return "checkout";
    }

    @RequestMapping(value = "/donate/{userNameParameter}/{id}", method = RequestMethod.POST)
    public String saveCreditCard(@ModelAttribute("creditCardForm")CreditEntity creditForm, @PathVariable("id") Long id, @PathVariable("userNameParameter") String userName, Model model) {
        AccountEntity accountInstance = accountRepo.findByUserName(userName);
        RequestEntity request = requestRepo.findById(id);


        int saltLength = 16; // salt length in bytes
        int hashLength = 32; // hash length in bytes
        int parallelism = 1; // currently not supported by Spring Security
        int memory = 4096; // memory costs
        int iterations = 3;

        Argon2PasswordEncoder argon2PasswordEncoder = new Argon2PasswordEncoder(saltLength, hashLength, parallelism,
                memory, iterations);

        String encodeCC_Number = argon2PasswordEncoder.encode(creditForm.getCcNumber());
        String encodeCC_CVC = argon2PasswordEncoder.encode((creditForm.getCc_CVC()));

        accountInstance.setCreditCard(creditForm);
        accountInstance.getCreditCard().setCcNumber(encodeCC_Number);
        accountInstance.getCreditCard().setCc_CVC(encodeCC_CVC);
        request.setActive(false);

        accountRepo.save(accountInstance);
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
