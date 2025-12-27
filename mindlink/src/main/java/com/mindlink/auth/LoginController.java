package com.mindlink.auth;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    // 1. Show Login Page
    @GetMapping("/login")
    public String showLoginPage(Model model) {
        return "auth/login";
    }

    // 2. Handle Login Logic (Mock Authentication)
    @PostMapping("/login/submit")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               @RequestParam("role") String role,
                               Model model) {

        // --- MOCK VALIDATION ---
        // In a real app, you would check the database here.
        
        if (role.equals("admin")) {
            // Hardcoded Admin Check
            if (username.equalsIgnoreCase("admin") && password.equals("admin123")) {
                return "redirect:/admin/home"; // Go to Admin Dashboard
            }
        } 
        else if (role.equals("student")) {
            // Allow any student to login for testing
            return "redirect:/home"; // Go to Student Portal
        }

        // If login fails:
        model.addAttribute("error", "Invalid Credentials. Try 'admin' / 'admin123'");
        return "auth/login";
    }
    
    // 3. Logout
    @GetMapping("/logout")
    public String logout() {
        return "redirect:/"; // Go back to landing page
    }
}