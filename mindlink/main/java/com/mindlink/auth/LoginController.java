package com.mindlink.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 1. Show Login Page
    @GetMapping("/login")
    public String showLoginPage(Model model) {
        return "auth/login";
    }

    // 2. Handle User Login Logic (Student and Counselor - Database Authentication)
    @PostMapping("/login/submit")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               @RequestParam("role") String role,
                               Model model) {

        if (role.equals("student")) {
            // Check student table in database
            String sql = "SELECT student_id, name, email FROM student WHERE (student_id = ? OR email = ?) AND password = ?";
            List<Map<String, Object>> students = jdbcTemplate.queryForList(sql, username, username, password);
            
            if (!students.isEmpty()) {
                // Login successful - redirect to student home
                return "redirect:/home";
            } else {
                model.addAttribute("error", "Invalid student credentials. Please check your student ID/email and password.");
                return "auth/login";
            }
        } 
        else if (role.equals("counselor")) {
            // Check counselor table in database
            String sql = "SELECT counselor_id, name, email FROM counselor WHERE (counselor_id = ? OR email = ?) AND password = ?";
            List<Map<String, Object>> counselors = jdbcTemplate.queryForList(sql, username, username, password);
            
            if (!counselors.isEmpty()) {
                // Login successful - redirect to counselor home (you may need to create this)
                return "redirect:/counseling/home";
            } else {
                model.addAttribute("error", "Invalid counselor credentials. Please check your counselor ID/email and password.");
                return "auth/login";
            }
        }

        // If role is invalid:
        model.addAttribute("error", "Invalid role selected.");
        return "auth/login";
    }
    
    // 3. Logout
    @GetMapping("/logout")
    public String logout() {
        return "redirect:/"; // Go back to landing page
    }
}