package com.mindlink;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Home Controller
 */
@Controller
public class HomeController {

    // URL: /
    // JSP: WEB-INF/views/index.jsp
    @GetMapping("/")
    public String showIndex() {
        return "index";
    }

    // URL: /home
    // JSP: WEB-INF/views/home.jsp
    @GetMapping("/home")
    public String showHome() {
        return "home";
    }
}
