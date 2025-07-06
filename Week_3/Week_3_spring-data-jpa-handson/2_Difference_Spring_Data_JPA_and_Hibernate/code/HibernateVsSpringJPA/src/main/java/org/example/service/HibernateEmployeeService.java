package org.example.service;


import org.example.model.Employee;
import org.example.repository.HibernateEmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HibernateEmployeeService {

    @Autowired
    private HibernateEmployeeRepository hibernateEmployeeRepository;

    public void save(Employee emp) {
        hibernateEmployeeRepository.save(emp);
    }

    public List<Employee> getAll() {
        return hibernateEmployeeRepository.getAll();
    }
}

