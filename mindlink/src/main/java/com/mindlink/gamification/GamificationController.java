package com.mindlink.gamification;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gamification")
public class GamificationController {

    // 1. Gamification Dashboard (The page in your screenshot)
    @GetMapping("")
    public String showDashboard() {
        return "gamification/dashboard"; // Looks for WEB-INF/gamification/dashboard.jsp
    }

    // Placeholders for the buttons
    @GetMapping("/achievements")
    public String showAchievements() {
        return "gamification/achievements";
    }

    @GetMapping("/activities")
    public String showActivities() {
        return "gamification/activities";
    }
}