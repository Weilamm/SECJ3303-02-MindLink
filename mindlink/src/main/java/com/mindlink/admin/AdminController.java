package com.mindlink.admin;

import com.mindlink.admin.AdminProfile;// Ensure this class exists or remove if using Map
import com.mindlink.counseling.SessionFeedbackService; 
import com.mindlink.counseling.DashboardStats; 
import com.mindlink.counseling.Feedback;
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

    // --- SERVICES ---
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private SessionFeedbackService feedbackService; 

    @Autowired
    private ForumReportService forumReportService;
    
    @Autowired
    private ForumService forumService;

    // Admin Home Page
    @GetMapping("/home")
    public String showAdminHome() {
        return "admin/home"; 
    }

    // --- ADMIN PROFILE SECTION ---
    @GetMapping("/profile")
    public String showAdminProfile(Model model, HttpSession session) {
        String adminId = (String) session.getAttribute("adminId");
        if (adminId == null || adminId.isEmpty()) return "redirect:/admin/login";

        String sql = "SELECT admin_id, name, email, phone, department, role FROM admin WHERE admin_id = ?";
        List<Map<String, Object>> admins = jdbcTemplate.queryForList(sql, adminId);

        if (!admins.isEmpty()) {
            Map<String, Object> data = admins.get(0);
            AdminProfile profile = new AdminProfile(
                (String) data.get("admin_id"),
                (String) data.get("name"),
                (String) data.get("email"),
                data.get("phone") != null ? (String) data.get("phone") : "",
                data.get("department") != null ? (String) data.get("department") : "",
                data.get("role") != null ? (String) data.get("role") : "admin"
            );
            model.addAttribute("p", profile);
        }
        return "admin/profile";
    }

    @GetMapping("/profile/edit")
    public String showEditProfileForm(Model model, HttpSession session) {
        String adminId = (String) session.getAttribute("adminId");
        if (adminId == null) return "redirect:/admin/login";

        String sql = "SELECT admin_id, name, email, phone, department, role FROM admin WHERE admin_id = ?";
        List<Map<String, Object>> admins = jdbcTemplate.queryForList(sql, adminId);

        if (!admins.isEmpty()) {
            Map<String, Object> data = admins.get(0);
            AdminProfile profile = new AdminProfile(
                (String) data.get("admin_id"),
                (String) data.get("name"),
                (String) data.get("email"),
                data.get("phone") != null ? (String) data.get("phone") : "",
                data.get("department") != null ? (String) data.get("department") : "",
                data.get("role") != null ? (String) data.get("role") : "admin"
            );
            model.addAttribute("p", profile);
        }
        return "admin/profile_edit";
    }

    @PostMapping("/profile/update")
    public String updateAdminProfile(@ModelAttribute AdminProfile profile, 
                                     RedirectAttributes redirectAttributes, 
                                     HttpSession session) {
        String adminId = (String) session.getAttribute("adminId");
        if (adminId == null) return "redirect:/admin/login";
        
        try {
            String sql = "UPDATE admin SET name = ?, email = ?, phone = ?, department = ?, updated_at = CURRENT_TIMESTAMP WHERE admin_id = ?";
            jdbcTemplate.update(sql, profile.getName(), profile.getEmail(), profile.getPhone(), profile.getDepartment(), adminId);
            session.setAttribute("adminName", profile.getName());
            redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating profile.");
        }
        return "redirect:/admin/profile";
    }

    // --- FEEDBACK SECTION ---

    // 1. READ ALL FEEDBACK (Split into Pending vs Completed)
    @GetMapping("/feedback")
    public String showFeedbackPage(Model model) {
        // Get all data from service
        List<Feedback> allFeedback = feedbackService.getAllFeedback();
        
        // Create separate lists
        List<Feedback> pendingList = new ArrayList<>();
        List<Feedback> completedList = new ArrayList<>();

        for (Feedback fb : allFeedback) {
            // 🟢 Now this works because we imported the correct Feedback class
            if (fb.getAdminReply() == null || fb.getAdminReply().trim().isEmpty()) {
                pendingList.add(fb);
            } else {
                completedList.add(fb);
            }
        }

        // Pass lists to JSP
        model.addAttribute("pendingList", pendingList);
        model.addAttribute("completedList", completedList);
        
        return "admin/feedback_dashboard";
    }

    // 2. SAVE REPLY
    @PostMapping("/feedback/reply")
    public String saveReview(@RequestParam("id") String id, 
                             @RequestParam("reply") String reply) {
        feedbackService.saveAdminReply(id, reply);
        return "redirect:/admin/feedback";
    }

    // 3. DELETE FEEDBACK
    @GetMapping("/feedback/delete")
    public String deleteFeedback(@RequestParam("id") String id) {
        feedbackService.deleteFeedback(id);
        return "redirect:/admin/feedback";
    }

    // --- ANALYTICS & FORUM SECTIONS ---

    @GetMapping("/analytics")
    public String showAnalyticsPage(Model model) {
        DashboardStats stats = new DashboardStats(1250, 68.5, 8234, 342);
        model.addAttribute("stats", stats); 
        return "admin/analytics"; 
    }

    @GetMapping("/forum/reports")
    public String showForumReports(Model model) {
        model.addAttribute("reports", forumReportService.getAllReports());
        return "admin/forum_reports"; 
    }

    @GetMapping("/forum/reports/delete")
    public String deleteReportedPost(@RequestParam("id") String id) {
        forumReportService.deletePost(id);
        return "redirect:/admin/forum/reports";
    }
    
    @GetMapping("/forum/reports/dismiss")
    public String dismissReport(@RequestParam("id") String id) {
        forumReportService.dismissReport(id);
        return "redirect:/admin/forum/reports";
    }

    @GetMapping("/forum/manage")
    public String manageForums(Model model) {
        model.addAttribute("forums", forumService.getAllForumsIncludingClosed());
        return "admin/forum_manage";
    }

    @GetMapping("/forum/create-form")
    public String showCreateForumForm(Model model) {
        return "admin/forum_form";
    }

    @PostMapping("/forum/create")
    public String createForum(@RequestParam("title") String title,
                             @RequestParam("description") String description,
                             @RequestParam(value = "createdBy", defaultValue = "A001") String createdBy) {
        forumService.createForum(title, description, createdBy);
        return "redirect:/admin/forum/manage";
    }

    @GetMapping("/forum/edit-form")
    public String showEditForumForm(@RequestParam("id") int id, Model model) {
        Forum forum = forumService.getForumById(id);
        model.addAttribute("forum", forum);
        return "admin/forum_form";
    }

    @PostMapping("/forum/update")
    public String updateForum(@RequestParam("id") int id,
                              @RequestParam("title") String title,
                              @RequestParam("description") String description) {
        forumService.updateForum(id, title, description);
        return "redirect:/admin/forum/manage";
    }

    @GetMapping("/forum/detail")
    public String viewForumDetail(@RequestParam("id") int id, Model model) {
        Forum forum = forumService.getForumById(id);
        model.addAttribute("forum", forum);
        model.addAttribute("posts", forumService.getPostsByForumId(id));
        model.addAttribute("postCount", forumService.getPostCount(id));
        return "admin/forum_detail";
    }

    @GetMapping("/forum/posts")
    public String viewAllPosts(@RequestParam(value = "forumId", required = false) Integer forumId, Model model) {
        if (forumId != null) {
            model.addAttribute("posts", forumService.getPostsByForumId(forumId));
        } else {
            List<ForumPost> allPosts = new ArrayList<>();
            for (Forum forum : forumService.getAllForums()) {
                allPosts.addAll(forumService.getPostsByForumId(forum.getId()));
            }
            model.addAttribute("posts", allPosts);
        }
        model.addAttribute("forums", forumService.getAllForums());
        return "admin/forum_posts";
    }

    @GetMapping("/forum/posts/delete")
    public String deletePost(@RequestParam("id") int postId) {
        forumService.deletePost(postId);
        return "redirect:/admin/forum/posts";
    }
}