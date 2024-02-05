package com.nmurray.vismafurniture;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@ComponentScan(basePackages = {"com.nmurray.vismafurniture.*"})
@EntityScan("com.nmurray.vismafurniture.Models")
@EnableJpaRepositories("com.nmurray.vismafurniture.Repositories")
@SpringBootApplication
public class VismaFurnitureApplication {

	public static void main(String[] args) {
		SpringApplication.run(VismaFurnitureApplication.class, args);
	}

}
