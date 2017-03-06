package ru.redandspring.usermanager;


import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.ui.ExtendedModelMap;

import ru.redandspring.usermanager.controller.UserController;
import ru.redandspring.usermanager.model.User;
import ru.redandspring.usermanager.service.UserService;

public class UserControllerTest
{
    private final List<User> users = new ArrayList<>();

    @Before
    public void initUsers()
    {
        User user = new User();
        user.setId(30);
        user.setAdmin(false);
        user.setAge(33);
        user.setName("Test listAllUsers");
        users.add(user);
    }

    @Test
    public void listAllUsers() throws Exception
    {
        final int page = 1;

        UserService userService = mock(UserService.class);
        when(userService.getListUsers(UserController.getOffset(page), UserController.PAGE_SIZE)).thenReturn(users);

        UserController userController = new UserController();

        ReflectionTestUtils.setField(userController, "userService", userService);

        ExtendedModelMap modelMap = new ExtendedModelMap();

        String result = userController.list(page, modelMap);

        Assert.assertEquals("main", result);
        List<User> users = (List<User>) modelMap.get("users");
        Assert.assertEquals(1, users.size());
        Assert.assertEquals("Test listAllUsers", users.get(0).getName());

    }

    @Test
    public void saveUser()
    {
        final User newUser = new User();
        newUser.setAdmin(false);
        newUser.setAge(33);
        newUser.setName("Test saveUser");

        UserService userService = mock(UserService.class);
        doAnswer(new Answer()
        {
            @Override
            public Object answer(InvocationOnMock invocationOnMock) throws Throwable
            {
                newUser.setId(31);
                users.add(newUser);
                return null;
            }
        }).when(userService).addUser(newUser);

        UserController userController = new UserController();

        ReflectionTestUtils.setField(userController, "userService", userService);

        String result = userController.saveUser(newUser);

        Assert.assertEquals("redirect:/users", result);
        Assert.assertEquals(31, users.get(1).getId());
    }

}
