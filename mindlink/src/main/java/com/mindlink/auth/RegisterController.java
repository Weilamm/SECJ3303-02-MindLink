package com.mindlink.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {

    // 1. Show the Registration Form
    @GetMapping("/register")
    public String showRegisterPage() {
        return "auth/register"; // Looks for WEB-INF/auth/register.jsp
    }

    // 2. Handle the Form Submission
    @PostMapping("/register/submit")
    public String processRegister(@RequestParam("fullname") String fullname,
                                  @RequestParam("username") String username,
                                  @RequestParam("password") String password) {
        
        // --- MOCK DATABASE SAVE ---
        System.out.println("New User Registered:");
        System.out.println("Name: " + fullname);
        System.out.println("User: " + username);
        
        // Redirect to Login page with a success signal
        return "redirect:/login?registered=true"; 
    }
}