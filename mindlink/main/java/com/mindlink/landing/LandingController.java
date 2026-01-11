package com.mindlink.landing;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LandingController {

    @GetMapping("/")
    public String showLandingPage() {
        // The path relative to WEB-INF
        // Folder: landing, File: landing.jsp
        return "landing/landing"; 
    }
}
