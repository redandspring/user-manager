package ru.redandspring.usermanager.service;

import java.util.List;

import ru.redandspring.usermanager.model.User;

public interface UserService
{
    List<User> getAll();
    List<User> getListUsers(int offset, int limit);
    List<User> getUsersByName(String name);
    int count();
    User getUser(int id);
    void addUser(User user);
    void editUser(User user);
    void delete(int id);
}
