package com.mindlink.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * Separate Admin Login Controller
 * Admin login is separate from user login for security and best practices
 */
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

    // Handle Admin Login Logic (Database Authentication)
    @PostMapping("/submit")
    public String processAdminLogin(@RequestParam("username") String username,
                                   @RequestParam("password") String password,
                                   Model model) {

        // Check admin table in database
        String sql = "SELECT admin_id, name, email FROM admin WHERE (admin_id = ? OR email = ?) AND password = ?";
        List<Map<String, Object>> admins = jdbcTemplate.queryForList(sql, username, username, password);
        
        if (!admins.isEmpty()) {
            // Login successful - redirect to admin home
            return "redirect:/admin/home";
        } else {
            model.addAttribute("error", "Invalid admin credentials. Please check your admin ID/email and password.");
            return "auth/admin_login";
        }
    }
}

