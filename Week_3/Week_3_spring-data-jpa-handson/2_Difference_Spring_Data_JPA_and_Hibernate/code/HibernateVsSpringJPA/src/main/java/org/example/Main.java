package org.example;

import org.example.model.Employee;
import org.example.service.HibernateEmployeeService;
import org.example.service.EmployeeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import java.util.List;

@SpringBootApplication
public class Main {
    private static final Logger LOGGER = LoggerFactory.getLogger(Main.class);

    @Autowired
    private EmployeeService jpaService;

    @Autowired
    private HibernateEmployeeService hibernateService;

    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(Main.class, args);
        Main app = context.getBean(Main.class);
        app.testJpa();
        app.testHibernate();
    }

    private void testJpa() {
        LOGGER.info("------ JPA Test ------");
        jpaService.addEmployee(new Employee(1, "Yash"));
        jpaService.addEmployee(new Employee(2, "Raj"));
        List<Employee> employees = jpaService.getAllEmployees();
        employees.forEach(e -> LOGGER.info("JPA: {}", e));
    }

    private void testHibernate() {
        LOGGER.info("------ Hibernate Test ------");
        hibernateService.save(new Employee(3, "Devi"));
        hibernateService.save(new Employee(4, "Karan"));
        List<Employee> employees = hibernateService.getAll();
        employees.forEach(e -> LOGGER.info("Hibernate: {}", e));
    }
}