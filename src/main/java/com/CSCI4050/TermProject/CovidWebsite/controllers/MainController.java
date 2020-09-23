package com.CSCI4050.TermProject.CovidWebsite.controllers;
import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import com.CSCI4050.TermProject.CovidWebsite.repository.AccountRepository;
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

            AccountEntity emailChecker = accountRepo.findByEmail(accountForm.getEmail());
            AccountEntity usernameChecker = accountRepo.findByUserName(accountForm.getUserName());

            if(emailChecker != null || usernameChecker != null){
                System.out.println("the email or username already exists");
                return "redirect:registration";
            }
            else{
                accountRepo.save(accountForm);
                return "redirect:login";
            }
            //Try and Catch

    }

        @RequestMapping(value="/login", method = RequestMethod.GET)
        public String showLoginPage(ModelMap model){
        model.addAttribute("login", new AccountEntity());
            return "login";
        }

    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String submitLoginIn(AccountEntity account){
        AccountEntity accountFormEmail = accountRepo.findByEmail(account.getEmail());
        AccountEntity accountFormPassword = accountRepo.findByPassword(account.getPassword());

        if(account.getEmail() == null || account.getPassword() == null){
            return "redirect:login";

        }
        else{
            if(accountFormEmail == null || accountFormPassword == null)
            {
                return "redirect:login";
            }
            else {
                return "redirect:registration"; //Change later
            }

        }

    }

        @RequestMapping(value="/news", method = RequestMethod.GET)
        public String showNewsPage(ModelMap model){
        return "news";
    }

        @RequestMapping(value="/welcome", method = RequestMethod.GET)
        public String showWelcmPage(ModelMap model){
        return "Welcome";
    }
}

