package ru.redandspring.usermanager.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import ru.redandspring.usermanager.model.User;
import ru.redandspring.usermanager.service.UserService;
import ru.redandspring.usermanager.utils.MiUtil;

@Controller
@RequestMapping(value = "/users")
public class UserController
{
    public static final int PAGE_SIZE = 5;

    @Resource
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value="page", required = false, defaultValue = "1") final int page, final Model model)
    {
        int countAll = userService.count();

        model.addAttribute("users", userService.getListUsers(MiUtil.getOffset(page, PAGE_SIZE), PAGE_SIZE));
        model.addAttribute("page", page);
        model.addAttribute("countAll", countAll);
        model.addAttribute("countPages", (int) Math.ceil( (double) countAll/PAGE_SIZE));
        model.addAttribute("titlePage", "Users List");
        model.addAttribute("includeView", "users");
        return "main";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(final Model model)
    {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("titlePage", "Add New User");
        model.addAttribute("includeView", "user-form");
        return "main";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") final int id, final Model model)
    {
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        model.addAttribute("titlePage", "Edit User " + user.getName());
        model.addAttribute("includeView", "user-form");
        return "main";
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") final int id)
    {
        userService.delete(id);
        return "redirect:/users";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
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

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveUser(@Valid final User user, final BindingResult result, final Model model)
    {
        if (result.hasErrors()) {
            model.addAttribute("titlePage", "Form has Errors");
            model.addAttribute("includeView", "user-form");
            return "main";
        }

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
