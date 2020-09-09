package com.CSCI4050.TermProject.CovidWebsite.controllers;
import com.CSCI4050.TermProject.CovidWebsite.Entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.Repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@SessionAttributes("name")
public class MainController {

    @Autowired
    private AccountRepository accountRepo;

    public MainController(AccountRepository accountRepo) {
        this.accountRepo = accountRepo;
    }

    @RequestMapping(value="/index", method = RequestMethod.GET)
        public String showIndexPage(ModelMap model){
            return "index";
        }

        @RequestMapping(value="/registration", method = RequestMethod.GET)
        public String showRegPage(ModelMap model){
            model.addAttribute("accountForm", new AccountEntity());
            return "registration";
        }

        @RequestMapping(value="/registration", method = RequestMethod.POST)
        public String registerAccount(@ModelAttribute("accountForm") AccountEntity accountForm, BindingResult bindingResult, Model model){

            if (bindingResult.hasErrors()) {
                return "error";
            }


            model.addAttribute("userName", accountForm.getUserName());
            model.addAttribute("email", accountForm.getEmail());
            model.addAttribute("firstName", accountForm.getFirstName());
            model.addAttribute("lastName", accountForm.getLastName());
            model.addAttribute("password", accountForm.getPassword());
            model.addAttribute("age", accountForm.getAge());
            //model.addAttribute("gender", accountForm.getGender());

            //Try and Catch


            accountRepo.save(accountForm);

        return "registration";
    }

        @RequestMapping(value="/login", method = RequestMethod.GET)
        public String showLoginPage(ModelMap model){
            return "login";
        }

        @RequestMapping(value="/news", method = RequestMethod.GET)
        public String showNewsPage(ModelMap model){
        return "news";
    }
}

