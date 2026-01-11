package com.mindlink.admin;

import com.mindlink.forum.model.Forum;
import com.mindlink.forum.model.ForumPost;
import com.mindlink.forum.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

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

    @Autowired
    private ForumService forumService;

    // Admin Forum Management - View all forums
    @GetMapping("/forum/manage")
    public String manageForums(Model model) {
        model.addAttribute("forums", forumService.getAllForumsIncludingClosed());
        return "admin/forum_manage";
    }

    // Show form to create a new forum
    @GetMapping("/forum/create-form")
    public String showCreateForumForm(Model model) {
        return "admin/forum_form";
    }

    // Create Forum (Admin only - forums are created by admins with IDs like A001, A002, etc.)
    @PostMapping("/forum/create")
    public String createForum(@RequestParam("title") String title,
                             @RequestParam("description") String description,
                             @RequestParam(value = "createdBy", defaultValue = "A001") String createdBy) {
        // Ensure createdBy starts with 'A' for admin
        if (!createdBy.startsWith("A")) {
            createdBy = "A001"; // Default to A001 if not admin ID
        }
        forumService.createForum(title, description, createdBy);
        return "redirect:/admin/forum/manage";
    }

    // Show form to edit a forum
    @GetMapping("/forum/edit-form")
    public String showEditForumForm(@RequestParam("id") int id, Model model) {
        Forum forum = forumService.getForumById(id);
        if (forum != null) {
            model.addAttribute("forum", forum);
        }
        return "admin/forum_form";
    }

    // Update Forum
    @PostMapping("/forum/update")
    public String updateForum(@RequestParam("id") int id,
                              @RequestParam("title") String title,
                              @RequestParam("description") String description) {
        forumService.updateForum(id, title, description);
        return "redirect:/admin/forum/manage";
    }

    // View Forum Detail (Admin view)
    @GetMapping("/forum/detail")
    public String viewForumDetail(@RequestParam("id") int id, Model model) {
        Forum forum = forumService.getForumById(id);
        if (forum != null) {
            model.addAttribute("forum", forum);
            model.addAttribute("posts", forumService.getPostsByForumId(id));
            model.addAttribute("postCount", forumService.getPostCount(id));
        }
        return "admin/forum_detail";
    }

    // View all forum posts (Admin can see all posts and delete them)
    @GetMapping("/forum/posts")
    public String viewAllPosts(@RequestParam(value = "forumId", required = false) Integer forumId, Model model) {
        if (forumId != null) {
            // Show posts for a specific forum
            model.addAttribute("forum", forumService.getForumById(forumId));
            model.addAttribute("posts", forumService.getPostsByForumId(forumId));
            model.addAttribute("forums", forumService.getAllForums());
        } else {
            // Show all posts from all forums
            model.addAttribute("forums", forumService.getAllForums());
            // Get all posts from all forums
            List<ForumPost> allPosts = new ArrayList<>();
            for (Forum forum : forumService.getAllForums()) {
                allPosts.addAll(forumService.getPostsByForumId(forum.getId()));
            }
            model.addAttribute("posts", allPosts);
        }
        return "admin/forum_posts";
    }

    // Delete a forum post (Admin only)
    @GetMapping("/forum/posts/delete")
    public String deletePost(@RequestParam("id") int postId,
                            @RequestParam(value = "forumId", required = false) Integer forumId) {
        forumService.deletePost(postId);
        if (forumId != null) {
            return "redirect:/admin/forum/posts?forumId=" + forumId;
        }
        return "redirect:/admin/forum/posts";
    }
}