package com.mindlink.learning;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LearningController {

    // 1. This listens for the "/learning" URL from your Home Page
    @GetMapping("/learning")
    public String showLearningHub() {
        // 2. This opens the file at src/main/webapp/WEB-INF/learning/hub.jsp
        return "learning/hub"; 
    }
}