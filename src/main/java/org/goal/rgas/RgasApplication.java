package org.goal.rgas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"org.goal.rgas"})
public class RgasApplication {
	public static void main(String[] args) {
		SpringApplication.run(RgasApplication.class, args);
	}
}
