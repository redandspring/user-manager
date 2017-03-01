package ru.redandspring.usermanager.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import ru.redandspring.usermanager.model.User;

@Repository
public class UserDaoImpl implements UserDao
{

    @Resource
    private SessionFactory sessionFactory;

    private Session getSession()
    {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<User> findAll()
    {
        List<User> result = getSession()
                .createCriteria(User.class)
                .list();
        return result;
    }

    @Override
    public List<User> findAll(int offset, int limit)
    {
        return getSession()
                .createCriteria(User.class)
                .setFirstResult(offset)
                .setMaxResults(limit)
                .list();
    }

    @Override
    public List<User> findAllByName(String name)
    {
        Criteria userCriteria = getSession().createCriteria(User.class);
        userCriteria.add(Restrictions.like("name", "%" + name + "%"));
        List<User> result = userCriteria.list();
        return result;
    }

    @Override
    public User findAllById(int id)
    {
        User user = (User) getSession().get(User.class, id);
        return user;
    }

    @Override
    public void insert(User user)
    {
        getSession().persist(user);
    }

    @Override
    public void update(User user)
    {
        getSession().update(user);
    }

    @Override
    public void delete(User user)
    {
        getSession().delete(user);
    }

    @Override
    public Long count()
    {
        return (Long) getSession()
                .createCriteria(User.class)
                .setProjection(Projections.rowCount())
                .uniqueResult();
    }

}
