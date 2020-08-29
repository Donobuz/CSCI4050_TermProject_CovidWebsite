package com.CSCI4050.TermProject.CovidWebsite.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("name")
public class MainController {

        @RequestMapping(value="/index", method = RequestMethod.GET)
        public String showIndexPage(ModelMap model){
            return "index";
        }

        @RequestMapping(value="/registration", method = RequestMethod.GET)
        public String showRegPage(ModelMap model){
            return "registration";
        }
}

