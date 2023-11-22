package com.finalproject.team4.shouldbe;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.finalproject.team4.shouldbe.mapper")
public class ShouldbeApplication {
	public static void main(String[] args) {
		SpringApplication.run(ShouldbeApplication.class, args);
	}

}