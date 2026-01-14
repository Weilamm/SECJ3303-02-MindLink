package com.mindlink.forum;

import com.mindlink.forum.model.Forum;
import com.mindlink.forum.model.ForumPost;
import com.mindlink.forum.model.ForumComment;
import com.mindlink.forum.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mindlink.counseling.Counselor;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/forum") // Base URL: All links start with /forum
public class ForumController {

    @Autowired
    private ForumService forumService;

    // URL: localhost:8080/forum/welcome 
    @GetMapping("/welcome")
    public String showWelcome() {
        return "forum/forum_welcome";
    }

    // URL: localhost:8080/forum/available
    @GetMapping("/available")
    public String showAvailable(Model model) {
        model.addAttribute("forums", forumService.getAllForums());
        return "forum/forum_available";
    }

    // URL: localhost:8080/forum/detail?id=1
    @GetMapping("/detail")
    public String showDetail(@RequestParam("id") int id, 
                            @RequestParam(value = "search", required = false) String search,
                            Model model) {
        Forum forum = forumService.getForumById(id);
        if (forum == null) {
            // Forum not found, redirect to available forums
            return "redirect:/forum/available";
        }
        
        model.addAttribute("forum", forum);
        List<ForumPost> posts;
        if (search != null && !search.trim().isEmpty()) {
            posts = forumService.searchPostsByContent(id, search);
        } else {
            posts = forumService.getPostsByForumId(id);
        }
        if (posts == null) {
            posts = new ArrayList<>();
        }
        model.addAttribute("posts", posts);
        model.addAttribute("postCount", forumService.getPostCount(id));
        model.addAttribute("searchQuery", search);
        
        // Get comments for each post
        Map<Integer, List<ForumComment>> commentsMap = new HashMap<>();
        for (ForumPost post : posts) {
            List<ForumComment> comments = forumService.getCommentsByPostId(post.getId());
            if (comments != null) {
                commentsMap.put(post.getId(), comments);
            } else {
                commentsMap.put(post.getId(), new ArrayList<>());
            }
        }
        model.addAttribute("commentsMap", commentsMap);
        
        return "forum/forum_details";
    }

    // URL: localhost:8080/forum/create?forumId=1
    // Show form to create a new post/discussion in a forum
    @GetMapping("/create")
    public String showCreate(@RequestParam("forumId") int forumId, Model model, HttpSession session) {
        // Check if user is logged in
        if (session.getAttribute("loggedInStudent") == null && session.getAttribute("loggedInCounselor") == null) {
            return "redirect:/login";
        }
        
        Forum forum = forumService.getForumById(forumId);
        if (forum != null) {
            model.addAttribute("forum", forum);
            model.addAttribute("forumId", forumId);
        }
        return "forum/create_discussion";
    }

    // Handle post creation (not forum creation)
    // Students create posts in forums that were created by admins
    @PostMapping("/create")
    public String createPost(@RequestParam("forumId") int forumId,
                            @RequestParam("content") String content,
                            @RequestParam(value = "anonymous", defaultValue = "false") boolean isAnonymous,
                            HttpSession session) {
        // Check if user is logged in
        Object studentObj = session.getAttribute("loggedInStudent");
        Object counselorObj = session.getAttribute("loggedInCounselor");
        
        if (studentObj == null && counselorObj == null) {
            return "redirect:/login";
        }
        
        // Get user info from session
        String userId;
        String userName;
        
        if (studentObj != null) {
            @SuppressWarnings("unchecked")
            Map<String, Object> studentMap = (Map<String, Object>) studentObj;
            userId = (String) studentMap.get("student_id");
            userName = (String) studentMap.get("name");
        } else {
            // Counselor
            Counselor counselor = (Counselor) counselorObj;
            userId = counselor.getId();
            userName = counselor.getName();
        }
        
        forumService.addPost(forumId, userId, userName, content, isAnonymous);
        return "redirect:/forum/detail?id=" + forumId;
    }

    // Handle post creation (alternative endpoint)
    @PostMapping("/post")
    public String createPostAlternative(@RequestParam("forumId") int forumId,
                            @RequestParam("content") String content,
                            @RequestParam(value = "anonymous", defaultValue = "false") boolean isAnonymous,
                            HttpSession session) {
        // Check if user is logged in
        Object studentObj = session.getAttribute("loggedInStudent");
        Object counselorObj = session.getAttribute("loggedInCounselor");
        
        if (studentObj == null && counselorObj == null) {
            return "redirect:/login";
        }
        
        // Get user info from session
        String userId;
        String userName;
        
        if (studentObj != null) {
            @SuppressWarnings("unchecked")
            Map<String, Object> studentMap = (Map<String, Object>) studentObj;
            userId = (String) studentMap.get("student_id");
            userName = (String) studentMap.get("name");
        } else {
            // Counselor
            Counselor counselor = (Counselor) counselorObj;
            userId = counselor.getId();
            userName = counselor.getName();
        }
        
        forumService.addPost(forumId, userId, userName, content, isAnonymous);
        return "redirect:/forum/detail?id=" + forumId;
    }

    // Handle comment creation
    @PostMapping("/comment")
    public String createComment(@RequestParam("postId") int postId,
                                @RequestParam("content") String content,
                                HttpSession session) {
        // Check if user is logged in
        Object studentObj = session.getAttribute("loggedInStudent");
        Object counselorObj = session.getAttribute("loggedInCounselor");
        
        if (studentObj == null && counselorObj == null) {
            return "redirect:/login";
        }
        
        // Get user info from session
        String userId;
        String userName;
        
        if (studentObj != null) {
            @SuppressWarnings("unchecked")
            Map<String, Object> studentMap = (Map<String, Object>) studentObj;
            userId = (String) studentMap.get("student_id");
            userName = (String) studentMap.get("name");
        } else {
            // Counselor
            Counselor counselor = (Counselor) counselorObj;
            userId = counselor.getId();
            userName = counselor.getName();
        }
        
        // Get forum ID from post
        ForumPost post = forumService.getPostById(postId);
        if (post != null) {
            forumService.addComment(postId, userId, userName, content);
            return "redirect:/forum/detail?id=" + post.getForumId();
        }
        return "redirect:/forum/available";
    }

    // Handle post report - change status to "reported"
    @PostMapping("/report")
    public String reportPost(@RequestParam("postId") int postId,
                            @RequestParam(value = "reason", required = false) String reason,
                            HttpSession session) {
        // Check if user is logged in
        if (session.getAttribute("loggedInStudent") == null && session.getAttribute("loggedInCounselor") == null) {
            return "redirect:/login";
        }
        
        // Get forum ID from post
        ForumPost post = forumService.getPostById(postId);
        if (post != null) {
            // Update post status to "reported" with reason
            String reportReason = (reason != null && !reason.trim().isEmpty()) ? reason : "No reason provided";
            forumService.updatePostStatusWithReason(postId, "reported", reportReason);
            return "redirect:/forum/detail?id=" + post.getForumId();
        }
        return "redirect:/forum/available";
    }

    // Handle comment report - change status to "reported"
    @PostMapping("/comment/report")
    public String reportComment(@RequestParam("commentId") int commentId,
                                @RequestParam(value = "reason", required = false) String reason,
                                HttpSession session) {
        // Check if user is logged in
        if (session.getAttribute("loggedInStudent") == null && session.getAttribute("loggedInCounselor") == null) {
            return "redirect:/login";
        }
        
        // Get comment and post info
        ForumComment comment = forumService.getCommentById(commentId);
        if (comment != null) {
            // Update comment status to "reported" with reason
            String reportReason = (reason != null && !reason.trim().isEmpty()) ? reason : "No reason provided";
            forumService.updateCommentStatusWithReason(commentId, "reported", reportReason);
            
            // Get forum ID from post
            ForumPost post = forumService.getPostById(comment.getPostId());
            if (post != null) {
                return "redirect:/forum/detail?id=" + post.getForumId();
            }
        }
        return "redirect:/forum/available";
    }
}