package com.mindlink.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession; // <--- 1. IMPORT THIS
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

    // 2. Handle Login Logic
    @PostMapping("/login/submit")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               @RequestParam("role") String role,
                               Model model,
                               HttpSession session) { // <--- 2. ADD SESSION HERE

        if (role.equals("student")) {
            String sql = "SELECT * FROM student WHERE (student_id = ? OR email = ?) AND password = ?";
            List<Map<String, Object>> students = jdbcTemplate.queryForList(sql, username, username, password);
            
            if (!students.isEmpty()) {
                // 3. SAVE TO SESSION (Student)
                session.setAttribute("loggedInStudent", students.get(0)); 
                return "redirect:/home";
            } else {
                model.addAttribute("error", "Invalid student credentials.");
                return "auth/login";
            }
        } 
        else if (role.equals("counselor")) {
            String sql = "SELECT * FROM counselor WHERE (id = ? OR email = ?) AND password = ?";
            List<Map<String, Object>> counselors = jdbcTemplate.queryForList(sql, username, username, password);
            
            if (!counselors.isEmpty()) {
                // 4. SAVE TO SESSION (Counselor) - Crucial Fix!
                session.setAttribute("loggedInCounselor", counselors.get(0));
                
                return "redirect:/counselor/home";
            } else {
                model.addAttribute("error", "Invalid counselor credentials.");
                return "auth/login";
            }
        }

        model.addAttribute("error", "Invalid role selected.");
        return "auth/login";
    }

    // 3. Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Clear session on logout
        return "redirect:/login"; 
    }
}