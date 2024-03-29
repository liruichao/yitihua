package com.extjs.dao.impl;

import com.extjs.dao.UserRoleKeyDao;
import com.extjs.model.UserRoleKey;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Type;

@Scope("prototype")
@Repository
public class UserRoleKeyDaoImpl implements UserRoleKeyDao {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public void addUserRole(UserRoleKey userRoleKey) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(userRoleKey);
        session.flush();
    }
}
