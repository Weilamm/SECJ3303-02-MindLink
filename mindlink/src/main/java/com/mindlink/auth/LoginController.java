package com.mindlink.auth;

import com.mindlink.counseling.Counselor; // Import your Counselor Model
// Import Student Model if you have one

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException; // Import this for error handling
import org.springframework.jdbc.core.BeanPropertyRowMapper;    // Import this for object mapping
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/login")
    public String showLoginPage(Model model) {
        return "auth/login";
    }

    @PostMapping("/login/submit")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               @RequestParam("role") String role,
                               Model model,
                               HttpSession session) {

        if (role.equals("student")) {
            String sql = "SELECT * FROM student WHERE (student_id = ? OR email = ?) AND password = ?";
            List<Map<String, Object>> students = jdbcTemplate.queryForList(sql, username, username, password);
            
            if (!students.isEmpty()) {
                Map<String, Object> studentMap = students.get(0);
                
                // Save the full map for general use
                session.setAttribute("loggedInStudent", studentMap); 
                
                // SAVE THIS SPECIFICALLY so GamificationController can find it
                // Ensure "student_id" matches the column name in your MySQL table
                session.setAttribute("student_id", studentMap.get("student_id").toString()); 
                
                return "redirect:/home";
            } else {
                model.addAttribute("error", "Invalid student credentials.");
                return "auth/login";
            }
        }
        
        else if (role.equals("counselor")) {
            String sql = "SELECT * FROM counselor WHERE (id = ? OR email = ?) AND password = ?";
            
            try {
                // 1. Use queryForObject instead of queryForList
                // 2. Use BeanPropertyRowMapper to convert the DB row into a real Counselor object
                Counselor counselor = jdbcTemplate.queryForObject(
                    sql,
                    new BeanPropertyRowMapper<>(Counselor.class),
                    username, username, password
                );

                // 3. Now session contains a real Counselor object, so the Controller won't crash
                session.setAttribute("loggedInCounselor", counselor);
                
                return "redirect:/counselor/dashboard"; // Make sure this matches your Controller mapping

            } catch (EmptyResultDataAccessException e) {
                // This block runs if no user is found
                model.addAttribute("error", "Invalid counselor credentials.");
                return "auth/login";
            }
        }

        model.addAttribute("error", "Invalid role selected.");
        return "auth/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); 
        return "redirect:/login"; 
    }
}