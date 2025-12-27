package com.mindlink.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

    //Admin Home Page
    @GetMapping("/home")
    public String showAdminHome() {
        return "admin/home"; // Looks for WEB-INF/admin/home.jsp
    }

    // Admin Profile Page
    @GetMapping("/profile")
    public String showAdminProfile(Model model) {
        AdminProfile profile = new AdminProfile(
            "Admin", 
            "S23CS0123", 
            36, 
            "admin@graduate.utm.my", 
            "+60123456789", 
            "Faculty of Computing"
        );
        
        model.addAttribute("p", profile);
        return "admin/profile"; // Looks for WEB-INF/admin/profile.jsp
    }

    @Autowired
    private FeedbackService feedbackService; // <--- The Service holds the REAL data

    // READ
    @GetMapping("/feedback")
    public String showFeedbackPage(Model model) {
        model.addAttribute("feedbackList", feedbackService.getAllFeedback());
        
        // Stats
        model.addAttribute("pendingCount", 6);
        model.addAttribute("criticalCount", 3);
        model.addAttribute("avgRating", 4.8);
        
        return "admin/feedback_review";
    }

    // UPDATE
    @PostMapping("/feedback/save")
    public String saveReview(@RequestParam("id") String id, 
                             @RequestParam("response") String response) {
        
        // Debugging
        System.out.println("DEBUG: Request to update ID: " + id);
        
        feedbackService.reviewFeedback(id, response);
        return "redirect:/admin/feedback";
    }

    // DELETE
    @GetMapping("/feedback/delete")
    public String deleteFeedback(@RequestParam("id") String id) {
        feedbackService.deleteFeedback(id);
        return "redirect:/admin/feedback";
    }
    
    // ANALYTICS (Keep this as is)
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

    @Autowired
    private ForumReportService forumReportService;

    // Show Forum Reports Page
    @GetMapping("/forum/reports")
    public String showForumReports(Model model) {
        model.addAttribute("reports", forumReportService.getAllReports());
        return "admin/forum_reports"; // Looks for WEB-INF/admin/forum_reports.jsp
    }

    // Delete Reported Post
    @GetMapping("/forum/reports/delete")
    public String deleteReportedPost(@RequestParam("id") String id) {
        forumReportService.deletePost(id);
        return "redirect:/admin/forum/reports";
    }
    
    // Dismiss Report (Mark as safe)
    @GetMapping("/forum/reports/dismiss")
    public String dismissReport(@RequestParam("id") String id) {
        forumReportService.dismissReport(id);
        return "redirect:/admin/forum/reports";
    }
}