package com.mindlink.admin;

import com.mindlink.forum.model.Forum;
import com.mindlink.forum.model.ForumPost;
import com.mindlink.forum.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
        return "admin/home"; // Looks for WEB-INF/admin/home.jsp
    }

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Admin Profile Page
    @GetMapping("/profile")
    public String showAdminProfile(Model model, HttpSession session) {
        // Get admin_id from session (set during login)
        String adminId = (String) session.getAttribute("adminId");
        
        // If not in session, redirect to login page
        if (adminId == null || adminId.isEmpty()) {
            return "redirect:/admin/login";
        }

        // Fetch admin data from database using the logged-in admin's ID
        String sql = "SELECT admin_id, name, email, phone, department, role FROM admin WHERE admin_id = ?";
        List<Map<String, Object>> admins = jdbcTemplate.queryForList(sql, adminId);

        AdminProfile profile;
        if (!admins.isEmpty()) {
            Map<String, Object> adminData = admins.get(0);
            profile = new AdminProfile(
                (String) adminData.get("admin_id"),
                (String) adminData.get("name"),
                (String) adminData.get("email"),
                adminData.get("phone") != null ? (String) adminData.get("phone") : "",
                adminData.get("department") != null ? (String) adminData.get("department") : "",
                adminData.get("role") != null ? (String) adminData.get("role") : "admin"
            );
        } else {
            // Admin not found in database - this shouldn't happen if login worked
            model.addAttribute("error", "Admin profile not found. Please contact support.");
            return "admin/profile";
        }
        
        model.addAttribute("p", profile);
        return "admin/profile"; // Looks for WEB-INF/admin/profile.jsp
    }

    // Show Edit Profile Form
    @GetMapping("/profile/edit")
    public String showEditProfileForm(Model model, HttpSession session) {
        // Get admin_id from session (must be logged in)
        String adminId = (String) session.getAttribute("adminId");
        
        if (adminId == null || adminId.isEmpty()) {
            return "redirect:/admin/login";
        }

        // Fetch admin data from database using the logged-in admin's ID
        String sql = "SELECT admin_id, name, email, phone, department, role FROM admin WHERE admin_id = ?";
        List<Map<String, Object>> admins = jdbcTemplate.queryForList(sql, adminId);

        AdminProfile profile;
        if (!admins.isEmpty()) {
            Map<String, Object> adminData = admins.get(0);
            profile = new AdminProfile(
                (String) adminData.get("admin_id"),
                (String) adminData.get("name"),
                (String) adminData.get("email"),
                adminData.get("phone") != null ? (String) adminData.get("phone") : "",
                adminData.get("department") != null ? (String) adminData.get("department") : "",
                adminData.get("role") != null ? (String) adminData.get("role") : "admin"
            );
        } else {
            // Admin not found - redirect to profile page with error
            return "redirect:/admin/profile?error=Admin profile not found";
        }
        
        model.addAttribute("p", profile);
        return "admin/profile_edit";
    }

    // Save Profile Changes
    @PostMapping("/profile/update")
    public String updateAdminProfile(@ModelAttribute AdminProfile profile, 
                                     RedirectAttributes redirectAttributes, 
                                     HttpSession session) {
        // Get admin_id from session (must be logged in) - use session ID for security
        String adminId = (String) session.getAttribute("adminId");
        
        if (adminId == null || adminId.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "You must be logged in to update your profile.");
            return "redirect:/admin/login";
        }
        
        // Ensure we're updating the logged-in admin's profile (security check)
        // Don't trust the adminId from the form - use the session adminId
        try {
            // Update admin in database using session adminId
            String sql = "UPDATE admin SET name = ?, email = ?, phone = ?, department = ?, updated_at = CURRENT_TIMESTAMP WHERE admin_id = ?";
            int rowsUpdated = jdbcTemplate.update(sql, 
                                                profile.getName(), 
                                                profile.getEmail(), 
                                                profile.getPhone() != null ? profile.getPhone() : "", 
                                                profile.getDepartment() != null ? profile.getDepartment() : "", 
                                                adminId);
            
            if (rowsUpdated > 0) {
                // Update session name if it changed
                session.setAttribute("adminName", profile.getName());
                redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully!");
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Failed to update profile. Admin not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating profile: " + e.getMessage());
        }
        
        return "redirect:/admin/profile";
    }

    @Autowired
    private FeedbackService feedbackService; // <--- The Service holds the REAL data

    // READ
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