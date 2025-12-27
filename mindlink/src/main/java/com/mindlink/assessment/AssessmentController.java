package com.mindlink.assessment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/assessment")
public class AssessmentController {

    // 1. Assessment Landing Page
    @GetMapping("")
    public String showAssessmentDashboard() {
        return "assessment/dashboard";
    }

    // 2. FIRST STEP:  (1 of 10)
    // This is where "Get Started" will link to
    @GetMapping("/start")
    public String question1Page() {
        return "assessment/question1";
    }

    // 3. SECOND STEP: (10 of 10)
    // The Goal page will link here
    @GetMapping("/last")
    public String question10Page() {
        return "assessment/question"; 
    }

    // Show Loading Page
    @PostMapping("/submit")
    public String processAssessment() {
        return "assessment/loading"; // Shows the "Please wait" page
    }

    // Final Result Page
    // The loading page will automatically redirect here after 3 seconds
    @GetMapping("/result")
    public String showResultPage() {
        return "assessment/result"; // You'll create this page next
    }
}