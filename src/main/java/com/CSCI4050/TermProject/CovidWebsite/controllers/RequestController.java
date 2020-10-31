package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.entities.RequestEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;
import com.CSCI4050.TermProject.CovidWebsite.repository.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

import java.util.Date;

@Controller
public class RequestController {
    @Autowired
    private RequestRepository requestRepo;

    @Autowired
    AccountRepository accountRepo;

    public RequestController(RequestRepository requestRepo) {
        this.requestRepo = requestRepo;
    }

    @RequestMapping(value = "/requestForm", method = RequestMethod.GET)
    public String showRequestFormPage(ModelMap model) {
        model.addAttribute("requestForm",new RequestEntity());
        return "requestForm";
    }

    @RequestMapping(value = "request/{userNameParameter}", method = RequestMethod.GET)
    public String getUserNameData(@PathVariable("userNameParameter") String userName, Model model) {
        AccountEntity accountInstance = accountRepo.findByUserName(userName);

        model.addAttribute("requestNew", new AccountEntity());
        model.addAttribute("reqInstance", accountInstance);

        return "requestForm";
    }

    @RequestMapping(value = "/requestForm", method = RequestMethod.POST)
    public Object requestInstance(@ModelAttribute("requestForm") RequestEntity requestForm,
                                  BindingResult bindingResult,
                                  Model model, HttpServletRequest request)
            throws UnsupportedEncodingException, MessagingException {
        model.addAttribute("amount",requestForm.getAmount());
        model.addAttribute("reason", requestForm.getReason());
        requestForm.setDate(new Date());
        requestRepo.save(requestForm);
        return "requestForm";
    }

}
