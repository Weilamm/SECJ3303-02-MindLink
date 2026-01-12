package com.mindlink.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession; // Ensure this import matches your Spring Boot version (javax vs jakarta)
import com.mindlink.admin.AdminProfile;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private JdbcTemplate jdbcTemplate; // <--- ADDED: Connects to the Database

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private ForumReportService forumReportService;

    // Admin Home Page
    @GetMapping("/home")
    public String showAdminHome() {
        return "admin/home";
    }

    // --- PROFILE SECTION (UPDATED) ---

    // 1. Show Profile (Now fetches Real Data from Session)
    @GetMapping("/profile")
    public String showAdminProfile(Model model, HttpSession session) {
        // Get the logged-in admin from the session (saved during login)
        AdminProfile loggedInUser = (AdminProfile) session.getAttribute("loggedInAdmin");
        
        // Security Check: If no one is logged in, kick them back to login page
        if (loggedInUser == null) {
            return "redirect:/admin/login";
        }

        // Send the session data to the JSP
        model.addAttribute("admin", loggedInUser);
        return "admin/profile"; 
    }

    // 2. Update Profile (Saves changes to Database)
    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute AdminProfile admin, HttpSession session) {
        
        try {
            // Update the Database
            String sql = "UPDATE admin SET name = ?, email = ?, phone = ?, department = ?, password = ? WHERE admin_id = ?";
            jdbcTemplate.update(sql, 
                admin.getName(), 
                admin.getEmail(), 
                admin.getPhone(), 
                admin.getDepartment(),
                admin.getPassword(),
                admin.getAdminId()
            );

            // Update the Session so the new name/details show up immediately without logging out
            session.setAttribute("loggedInAdmin", admin);

            return "redirect:/admin/profile?success"; 

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/admin/profile?error";
        }
    }

    // 3. Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Destroys the session
        return "redirect:auth/admin_login"; // Go back to login page
    }

    // --- END PROFILE SECTION ---


    // READ FEEDBACK
    @GetMapping("/feedback")
    public String showFeedbackPage(Model model) {
        model.addAttribute("feedbackList", feedbackService.getAllFeedback());
        model.addAttribute("pendingCount", 6);
        model.addAttribute("criticalCount", 3);
        model.addAttribute("avgRating", 4.8);
        return "admin/feedback_review";
    }

    // UPDATE FEEDBACK
    @PostMapping("/feedback/save")
    public String saveReview(@RequestParam("id") String id, 
                             @RequestParam("response") String response) {
        feedbackService.reviewFeedback(id, response);
        return "redirect:/admin/feedback";
    }

    // DELETE FEEDBACK
    @GetMapping("/feedback/delete")
    public String deleteFeedback(@RequestParam("id") String id) {
        feedbackService.deleteFeedback(id);
        return "redirect:/admin/feedback";
    }
    
    // ANALYTICS
    @GetMapping("/analytics")
    public String showAnalyticsPage(Model model) {
        DashboardStats stats = new DashboardStats(1250, 68.5, 8234, 342);
        model.addAttribute("stats", stats); 
        model.addAttribute("totalCompletions", stats.getTotalCompletions());
        model.addAttribute("feedbackReceived", stats.getFeedbackReceived());
        model.addAttribute("avgCompletionRate", stats.getAvgCompletionRate());
        model.addAttribute("activeUsers", stats.getActiveUsers());
        return "admin/analytics"; 
    }

    // FORUM REPORTS
    @GetMapping("/forum/reports")
    public String showForumReports(Model model) {
        model.addAttribute("reports", forumReportService.getAllReports());
        return "admin/forum_reports"; 
    }

    // DELETE REPORT
    @GetMapping("/forum/reports/delete")
    public String deleteReportedPost(@RequestParam("id") String id) {
        forumReportService.deletePost(id);
        return "redirect:/admin/forum/reports";
    }
    
    // DISMISS REPORT
    @GetMapping("/forum/reports/dismiss")
    public String dismissReport(@RequestParam("id") String id) {
        forumReportService.dismissReport(id);
        return "redirect:/admin/forum/reports";
    }
}