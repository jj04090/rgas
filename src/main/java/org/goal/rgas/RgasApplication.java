package org.goal.rgas;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@MapperScan(basePackages = {"org.goal.rgas"})
@SpringBootApplication
@ComponentScan(basePackages = {"org.goal.rgas"})
public class RgasApplication {

	public static void main(String[] args) {
		SpringApplication.run(RgasApplication.class, args);
	}

}
