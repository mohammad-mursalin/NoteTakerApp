package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

    public static SessionFactory sessionFactory;

    public static SessionFactory getFactory () {

        if(sessionFactory == null) {

            sessionFactory = new Configuration().configure().buildSessionFactory();
        }
        return sessionFactory;
    }

    public void closeFactory () {

        if(sessionFactory.isOpen()) {

            sessionFactory.close();
        }
    }
}
