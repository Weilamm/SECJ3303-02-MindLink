package com.mindlink.gamification;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import com.mindlink.usermanagement.model.Student;

@Controller
@RequestMapping("/gamification")
public class GamificationController {

    @Autowired
    private AchievementService achievementService;

    @GetMapping("")
    public String showDashboard() {
        return "gamification/dashboard";
    }

    // Placeholders for buttons
    @GetMapping("/achievements")
    public String showAchievements(HttpSession session, Model model) {
        Object studentObj = session.getAttribute("loggedInStudent");
        if (!(studentObj instanceof Student)) {
            return "redirect:/login";
        }

        Student student = (Student) studentObj;
        String studentId = student.getStudentId();

        List<Achievement> achievements = achievementService.getStudentAchievements(studentId);
        model.addAttribute("achievements", achievements);

        return "gamification/achievements";
    }

    @GetMapping("/activities")
    public String showActivities(HttpSession session, Model model) {
        Object studentObj = session.getAttribute("loggedInStudent");
        if (!(studentObj instanceof Student)) {
            return "redirect:/login";
        }

        Student student = (Student) studentObj;
        String studentId = student.getStudentId();

        List<Achievement> achievements = achievementService.getStudentAchievements(studentId);

        // Sort: Locked on top, Unlocked at bottom
        achievements.sort((a1, a2) -> Boolean.compare(a1.isUnlocked(), a2.isUnlocked()));

        model.addAttribute("achievements", achievements);
        model.addAttribute("totalPoints", achievementService.calculatePoints(studentId));
        model.addAttribute("achievedCount", achievementService.getAchievedTasksCount(studentId));

        return "gamification/activities";
    }
}