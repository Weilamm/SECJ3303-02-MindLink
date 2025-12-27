package com.mindlink.forum;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/forum") // 1. Base URL: All links start with /forum
public class ForumController {

    // URL: localhost:8080/forum/welcome 
    // (Matches the link in your header)
    @GetMapping("/welcome")
    public String showWelcome() {
        return "forum/forum_welcome";
    }

    // URL: localhost:8080/forum/available
    @GetMapping("/available")
    public String showAvailable() {
        return "forum/forum_available";
    }

    // URL: localhost:8080/forum/joined
    @GetMapping("/joined")
    public String showJoined() {
        return "forum/forum_joined";
    }

    // URL: localhost:8080/forum/detail
    // (Fixed from /joined/detail to keep it consistent)
    @GetMapping("/detail")
    public String showDetail() {
        return "forum/forum_details";
    }

    // URL: localhost:8080/forum/create
    @GetMapping("/create")
    public String showCreate() {
        return "forum/create_discussion";
    }
}