package com.mindlink.auth;

import com.mindlink.counseling.Counselor; 
import com.mindlink.usermanagement.model.Student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

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
            
            try {
                Student student = jdbcTemplate.queryForObject(
                        sql, 
                        new BeanPropertyRowMapper<>(Student.class), 
                        username, username, password
                );

                if (student != null) {
                    String status = student.getStatus(); 

                    if ("PENDING".equalsIgnoreCase(status)) {
                        model.addAttribute("error", "Account pending approval. Please wait for administrator review.");
                        return "auth/login";
                    }

                    if ("REJECTED".equalsIgnoreCase(status)) {
                        model.addAttribute("error", "Your account has been rejected. Please contact support.");
                        return "auth/login";
                    }

                    session.setAttribute("loggedInStudent", student);
                    return "redirect:/home";
                }

            } catch (EmptyResultDataAccessException e) {
                model.addAttribute("error", "Invalid student credentials.");
                return "auth/login";
            }
        }

        else if (role.equals("counselor")) {
            String sql = "SELECT * FROM counselor WHERE (id = ? OR email = ?) AND password = ?";

            try {
                Counselor counselor = jdbcTemplate.queryForObject(
                        sql,
                        new BeanPropertyRowMapper<>(Counselor.class),
                        username, username, password);

                if (counselor != null) {
                    String status = counselor.getStatus();
                    if (status == null || status.isEmpty() || !status.equals("approved")) {
                        if ("pending".equals(status)) {
                            model.addAttribute("error", "Your counselor application is pending approval.");
                        } else if ("rejected".equals(status)) {
                            model.addAttribute("error", "Your counselor application has been rejected.");
                        } else {
                            model.addAttribute("error", "Your counselor application is pending approval.");
                        }
                        return "auth/login";
                    }

                    session.setAttribute("loggedInCounselor", counselor);
                    return "redirect:/counselor/dashboard";
                }

            } catch (EmptyResultDataAccessException e) {
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