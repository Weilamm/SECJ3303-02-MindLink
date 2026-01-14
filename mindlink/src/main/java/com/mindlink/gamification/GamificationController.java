package com.mindlink.gamification;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequestMapping("/gamification") 
public class GamificationController {

    @Autowired
    private AchievementService achievementService;

    // 1. Main Gamification Landing Page (dashboard.jsp)
    @GetMapping("")
    public String showDashboard() {
        return "gamification/dashboard"; 
    }

    // 2. Updated Achievement Dashboard (achievement_dashboard.jsp)
    @GetMapping("/achievements")
    public String showAchievements(HttpSession session, Model model) {
        String studentId = (String) session.getAttribute("student_id");
        
        if (studentId == null) {
            return "redirect:/login";
        }

        // Fetch dynamic list of achievements from the service
        List<Achievement> achievements = achievementService.getStudentAchievements(studentId);
        model.addAttribute("achievements", achievements);
        
        // This should point to your new JSP file location
        return "gamification/achievement_dashboard"; 
    }

    @GetMapping("/activities")
    public String showActivities(HttpSession session, Model model) {
        String studentId = (String) session.getAttribute("student_id");
        
        if (studentId == null) {
            return "redirect:/login";
        }
        
        List<Achievement> achievements = achievementService.getStudentAchievements(studentId);
        model.addAttribute("achievements", achievements);
        
        return "gamification/activities";
    }
}