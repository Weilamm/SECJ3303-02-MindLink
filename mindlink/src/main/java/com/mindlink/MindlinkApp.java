package com.mindlink;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication // <--- This annotation turns on the magic!
public class MindlinkApp extends SpringBootServletInitializer {

    public static void main(String[] args) {
        // This starts the Tomcat web server and scans for your Controllers
        SpringApplication.run(MindlinkApp.class, args);
    }
}
