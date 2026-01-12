package com.mindlink.auth;

import com.mindlink.admin.AdminProfile; // Import your updated AdminProfile class
import jakarta.servlet.http.HttpSession; // Use 'javax.servlet...' if on older Spring Boot

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/login")
public class AdminLoginController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Show Admin Login Page
    @GetMapping("")
    public String showAdminLoginPage(Model model) {
        return "auth/admin_login";
    }

    // Handle Admin Login Logic
    @PostMapping("/submit")
    public String processAdminLogin(@RequestParam("username") String username,
                                    @RequestParam("password") String password,
                                    Model model,
                                    HttpSession session) { // <--- 1. Added Session

        try {
            // 2. Changed to SELECT * so we get phone, department, etc. for the profile
            String sql = "SELECT * FROM admin WHERE (admin_id = ? OR email = ?) AND password = ?";
            
            // 3. Automatically maps DB columns (admin_id) to Java fields (adminId)
            AdminProfile admin = jdbcTemplate.queryForObject(
                sql, 
                new BeanPropertyRowMapper<>(AdminProfile.class), 
                username, username, password
            );

            // 4. SAVE TO SESSION (Crucial step!)
            session.setAttribute("loggedInAdmin", admin);

            return "redirect:/admin/home";

        } catch (EmptyResultDataAccessException e) {
            // Login failed
            model.addAttribute("error", "Invalid admin credentials. Please check your ID/Email and Password.");
            return "auth/admin_login";
        }
    }
}