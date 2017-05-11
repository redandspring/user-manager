package ru.redandspring.usermanager.controller;

import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(final Model model)
    {
        model.addAttribute("titlePage", "Main Page");
        return "main";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(final Model model)
    {
        model.addAttribute("titlePage", "Main Page");
        model.addAttribute("includeView", "login");
        return "main";
    }
}
