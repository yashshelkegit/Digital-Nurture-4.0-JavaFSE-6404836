package com.cognizant.spring_learn;

import com.cognizant.spring_learn.model.Country;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

@EnableAspectJAutoProxy
@SpringBootApplication
public class SpringLearnApplication {

	private static final Logger LOGGER = LoggerFactory.getLogger(SpringLearnApplication.class);

	public static void displayCountries() {
		LOGGER.debug("START: displayCountries()");

		ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");

		List<Country> countryList = (List<Country>) context.getBean("countryList");

		for (Country country : countryList) {
			LOGGER.debug("Country: {}", country);
		}

		LOGGER.debug("END: displayCountries()");
	}
	public static void main(String[] args) {
		SpringApplication.run(SpringLearnApplication.class, args);
		System.out.println("Running");
		displayCountries();
	}

}
