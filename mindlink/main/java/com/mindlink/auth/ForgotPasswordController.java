package com.mindlink.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ForgotPasswordController {

    // 1. Show the Forgot Password Page
    @GetMapping("/forgot-password")
    public String showForgotPasswordPage() {
        return "auth/forgot_password"; // Looks for WEB-INF/auth/forgot_password.jsp
    }

    // 2. Handle the Form Submission
    @PostMapping("/forgot-password/submit")
    public String processForgotPassword(@RequestParam("email") String email, 
                                        RedirectAttributes redirectAttributes) {
        
        // --- MOCK EMAIL LOGIC ---
        // In a real app, you would generate a token and send an email here.
        System.out.println("Reset password requested for: " + email);
        System.out.println("Sending email...");
        
        // Redirect back to Login with a success message
        redirectAttributes.addFlashAttribute("success", "Reset link sent! Please check your email.");
        return "redirect:/login"; 
    }
}