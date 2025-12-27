package com.mindlink.forum;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Community Support - Forum Controller (UC12)
 * Simple navigation mapping - just shows JSP files
 */
@Controller
@RequestMapping("/forum")
public class ForumController {

    // URL: /forum/welcome
    // JSP: WEB-INF/views/CommunitySupport/uc12_forum_welcome.jsp
    @GetMapping("/welcome")
    public String showWelcome() {
        return "CommunitySupport/uc12_forum_welcome";
    }

    // URL: /forum/available
    // JSP: WEB-INF/views/CommunitySupport/uc12_forum_available.jsp
    @GetMapping("/available")
    public String showAvailable() {
        return "CommunitySupport/uc12_forum_available";
    }

    // URL: /forum/joined
    // JSP: WEB-INF/views/CommunitySupport/uc12_forum_joined.jsp
    @GetMapping("/joined")
    public String showJoined() {
        return "CommunitySupport/uc12_forum_joined";
    }

    // URL: /forum/detail
    // JSP: WEB-INF/views/CommunitySupport/uc12_forum_detail.jsp
    @GetMapping("/detail")
    public String showDetail() {
        return "CommunitySupport/uc12_forum_detail";
    }

    // URL: /forum/create
    // JSP: WEB-INF/views/CommunitySupport/uc12_create_discussion.jsp
    @GetMapping("/create")
    public String showCreate() {
        return "CommunitySupport/uc12_create_discussion";
    }
}