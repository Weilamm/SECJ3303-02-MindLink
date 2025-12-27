package com.mindlink.learning;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LearningController {

    // This listens for the "/learning" URL from your Home Page
    @GetMapping("/learning")
    public String showLearningHub() {
        // 2. This opens the file at src/main/webapp/WEB-INF/learning/hub.jsp
        return "learning/hub"; 
    }

    @GetMapping("/learning/modules")
    public String showModuleList() {
        return "module/home"; // Looks for WEB-INF/module/home.jsp
    }
    
    // Introduction to Mental Health Module Page
    @GetMapping("/learning/modules/intro")
    public String showIntroModule() {
        return "module/intro"; // Looks for WEB-INF/module/intro.jsp
    }
}