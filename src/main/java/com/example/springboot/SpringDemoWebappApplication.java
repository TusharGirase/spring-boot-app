package com.example.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringDemoWebappApplication {

    public static void main(String[] args) {
        System.out.println("Args");
        for (int i = 0; i < args.length; i++) {
            System.out.println(args[i]);
        }
        SpringApplication.run(SpringDemoWebappApplication.class, args);
    }

}
