package ru.redandspring.usermanager.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import ru.redandspring.usermanager.model.User;
import ru.redandspring.usermanager.service.UserService;

@Controller
public class UserController
{
    private static final int PAGE_SIZE = 5;

    @Resource
    private UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(final Model model)
    {
        model.addAttribute("titlePage", "Main Page");
        return "main";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String list(@RequestParam(value="page", required = false, defaultValue = "1") final int page, final Model model)
    {
        int countAll = userService.count();
        List<User> users = userService.getListUsers(PAGE_SIZE * (page - 1), PAGE_SIZE);
        model.addAttribute("users", users);
        model.addAttribute("page", page);
        model.addAttribute("countAll", countAll);
        model.addAttribute("countPages", (int) Math.ceil( (double) countAll/PAGE_SIZE));
        model.addAttribute("titlePage", "Users List");
        model.addAttribute("includeView", "users");
        return "main";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String add(final Model model)
    {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("titlePage", "Add New User");
        model.addAttribute("includeView", "user-form");
        return "main";
    }

    @RequestMapping(value = "/users/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") final int id, final Model model)
    {
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        model.addAttribute("titlePage", "Edit User " + user.getName());
        model.addAttribute("includeView", "user-form");
        return "main";
    }

    @RequestMapping(value = "/users/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") final int id)
    {
        userService.delete(id);
        return "redirect:/users";
    }

    @RequestMapping(value = "/users/search", method = RequestMethod.POST)
    public String search(@RequestParam(value="query", required = true) final String query, final Model model)
    {
        List<User> users = userService.getUsersByName(query);
        int usersCount = (users != null) ? users.size() : 0;
        model.addAttribute("users", users);
        model.addAttribute("usersCount", usersCount);
        model.addAttribute("titlePage", "Search by name: " + query);
        model.addAttribute("includeView", "users");
        return "main";
    }

    @RequestMapping(value = "/users/save", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("user") final User user)
    {
        if (user.getId() == 0)
        {
            userService.addUser(user);
        }
        else
        {
            user.setCreatedDate(userService.getUser(user.getId()).getCreatedDate());
            userService.editUser(user);
        }
        return "redirect:/users";
    }

}
