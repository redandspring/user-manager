package ru.redandspring.usermanager.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ru.redandspring.usermanager.dao.UserDao;
import ru.redandspring.usermanager.model.User;

@Service
public class UserServiceImpl implements UserService
{
    @Resource
    private UserDao userDao;

    @Override
    @Transactional
    public List<User> getAll()
    {
        return userDao.findAll();
    }

    @Override
    @Transactional
    public List<User> getListUsers(int offset, int limit)
    {
        return userDao.findAll(offset, limit);
    }

    @Override
    @Transactional
    public List<User> getUsersByName(String name)
    {
        return userDao.findAllByName(name);
    }

    @Override
    @Transactional
    public int count()
    {
        return userDao.count().intValue();
    }

    @Override
    @Transactional
    public User getUser(int id)
    {
        return userDao.findAllById(id);
    }

    @Override
    @Transactional
    public void addUser(User user)
    {
        userDao.insert(user);
    }

    @Override
    @Transactional
    public void editUser(User user)
    {
        userDao.update(user);
    }

    @Override
    @Transactional
    public void delete(int id)
    {
        User user = getUser(id);
        if (user != null)
        {
            userDao.delete(user);
        }
    }
}
