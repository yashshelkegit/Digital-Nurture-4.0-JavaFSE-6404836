package org.example.repository;


import org.example.model.Employee;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HibernateEmployeeRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public void save(Employee employee) {
        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
            session.save(employee);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }

    public List<Employee> getAll() {
        Session session = null;
        List<Employee> list = null;
        try {
            session = sessionFactory.openSession();
            list = session.createQuery("FROM Employee", Employee.class).list();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return list;
    }
}

