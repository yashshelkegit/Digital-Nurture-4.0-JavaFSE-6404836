package org.example.service;

import org.example.model.Employee;
import org.example.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository repo;

    @Transactional
    public void addEmployee(Employee e) {
        repo.save(e);
    }

    @Transactional
    public List<Employee> getAllEmployees() {
        return repo.findAll();
    }
}

