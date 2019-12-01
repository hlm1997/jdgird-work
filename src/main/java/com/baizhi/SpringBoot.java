package com.baizhi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.baizhi.dao")
@SpringBootApplication
public class SpringBoot {
    public static void main(String[] args) {
        SpringApplication.run(SpringBoot.class, args);
        System.out.println();
        System.out.println("123");
    }
}
