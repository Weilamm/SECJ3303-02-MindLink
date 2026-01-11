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
    public String showDetail(@RequestParam("id") int id, Model model) {
        Forum forum = forumService.getForumById(id);
        if (forum != null) {
            model.addAttribute("forum", forum);
            List<ForumPost> posts = forumService.getPostsByForumId(id);
            model.addAttribute("posts", posts);
            model.addAttribute("postCount", forumService.getPostCount(id));
            
            // Get comments for each post
            Map<Integer, List<ForumComment>> commentsMap = new HashMap<>();
            for (ForumPost post : posts) {
                commentsMap.put(post.getId(), forumService.getCommentsByPostId(post.getId()));
            }
            model.addAttribute("commentsMap", commentsMap);
        }
        return "forum/forum_details";
    }

    // URL: localhost:8080/forum/create?forumId=1
    // Show form to create a new post/discussion in a forum
    @GetMapping("/create")
    public String showCreate(@RequestParam("forumId") int forumId, Model model) {
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
                            @RequestParam(value = "userId", defaultValue = "S001") String userId,
                            @RequestParam(value = "userName", defaultValue = "Student User") String userName) {
        forumService.addPost(forumId, userId, userName, content);
        return "redirect:/forum/detail?id=" + forumId;
    }

    // Handle post creation (alternative endpoint)
    @PostMapping("/post")
    public String createPostAlternative(@RequestParam("forumId") int forumId,
                            @RequestParam("content") String content,
                            @RequestParam(value = "userId", defaultValue = "S001") String userId,
                            @RequestParam(value = "userName", defaultValue = "Student User") String userName) {
        forumService.addPost(forumId, userId, userName, content);
        return "redirect:/forum/detail?id=" + forumId;
    }

    // Handle comment creation
    @PostMapping("/comment")
    public String createComment(@RequestParam("postId") int postId,
                                @RequestParam("content") String content,
                                @RequestParam(value = "userId", defaultValue = "S001") String userId,
                                @RequestParam(value = "userName", defaultValue = "Student User") String userName) {
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
                            @RequestParam(value = "reason", required = false) String reason) {
        // Get forum ID from post
        ForumPost post = forumService.getPostById(postId);
        if (post != null) {
            // Update post status to "reported"
            forumService.updatePostStatus(postId, "reported");
            return "redirect:/forum/detail?id=" + post.getForumId();
        }
        return "redirect:/forum/available";
    }
}