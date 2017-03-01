package ru.redandspring.usermanager.dao;

import java.util.List;

import ru.redandspring.usermanager.model.User;

public interface UserDao
{
    List<User> findAll();
    List<User> findAll(int offset, int limit);
    List<User> findAllByName(String name);
    User findAllById(int id);
    void insert(User user);
    void update(User user);
    void delete(User user);
    Long count();
}
