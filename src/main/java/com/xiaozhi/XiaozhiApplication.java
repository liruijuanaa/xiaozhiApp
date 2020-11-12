package com.xiaozhi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@MapperScan("com.xiaozhi.dao")
public class XiaozhiApplication {

    public static void main(String[] args) {
        SpringApplication.run(XiaozhiApplication.class, args);
    }

}
