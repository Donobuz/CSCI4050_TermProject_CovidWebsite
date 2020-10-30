package com.CSCI4050.TermProject.CovidWebsite.controllers;

import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.entities.RequestEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

import java.time.LocalDate;

@Controller
public class RequestController {
    @Autowired
    private RequestRepository requestRepo;

    public RequestController(RequestRepository requestRepo) {
        this.requestRepo = requestRepo;
    }

    @RequestMapping(value = "/requestForm", method = RequestMethod.GET)
    public String showRequestFormPage(ModelMap model) {
        model.addAttribute("requestForm",new RequestEntity());
        return "requestForm";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public Object requestInstance(@ModelAttribute("RequestForm") RequestEntity RequestForm, AccountEntity Account, BindingResult bindingResult,
                                  Model model, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {
        model.addAttribute("userName", Account.getUserName());
        model.addAttribute("amount",RequestForm.getAmount());
        model.addAttribute("reason", RequestForm.getReason());
        model.addAttribute("date",LocalDate.now());
    }
}
