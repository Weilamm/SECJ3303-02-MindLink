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

    @Autowired
    private FeedbackService feedbackService; // <--- The Service holds the REAL data

    // READ
    @GetMapping("/feedback")
    public String showFeedbackPage(Model model) {
        // ERROR WAS HERE: You were creating a 'new ArrayList' here. I removed it.
        // Now we ONLY use the service, so the IDs are stable.
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
        
        // Debugging: Watch your VS Code Terminal when you click save!
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
}