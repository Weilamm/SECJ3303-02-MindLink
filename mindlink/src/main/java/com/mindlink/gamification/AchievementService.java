package com.mindlink.gamification;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.util.*;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;

@Service
public class AchievementService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Achievement> getStudentAchievements(String studentId) {
        List<Achievement> list = new ArrayList<>();

        // 1. Mind Explorer
        Integer modules = jdbcTemplate.queryForObject("SELECT COUNT(DISTINCT assessment_id) FROM user_module_progress WHERE student_id = ?", Integer.class, studentId);
        int modCount = (modules != null) ? modules : 0;
        Achievement ach1 = new Achievement("Mind Explorer", "Completed 1st mental health assessment", "badge3.png", false, modCount, 1);
        attachDateAndStatus(ach1, studentId, "MIND_EXPLORER", modCount > 0);
        list.add(ach1);

        // 2. Wellness Warrior
        Integer sessions = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM appointment WHERE student_id = ? AND status = 'Confirmed'", Integer.class, studentId);
        int sessCount = (sessions != null) ? sessions : 0;
        Achievement ach2 = new Achievement("Wellness Warrior", "Completed 5 sessions with a counselor", "badge1.png", false, sessCount, 5);
        attachDateAndStatus(ach2, studentId, "WELLNESS_WARRIOR", sessCount >= 5);
        list.add(ach2);

        // 3. Inner Peace
        int points = (modCount * 100) + (sessCount * 50);
        Achievement ach3 = new Achievement("Inner Peace", "Achieved 2000 points", "badge5.png", false, points, 2000);
        attachDateAndStatus(ach3, studentId, "INNER_PEACE", points >= 2000);
        list.add(ach3);

        // 4-15. Milestone Loop
        String[] types = {"BALANCED_MIND", "RESILIENCE_BUILDER", "TINY_TRIUMPH", "STEADY_START", "FIRST_STEP_FORWARD", "FORUM_MASTER", "KNOWLEDGE_SEEKER", "CONSISTENT_CALM", "DAILY_ZEN", "COMMUNITY_STAR", "FEEDBACK_HERO", "MINDFUL_MEMBER"};
        String[] names = {"Balanced Mind", "Resilience Builder", "Tiny Triumph", "Steady Start", "First Step Forward", "Forum Master", "Knowledge Seeker", "Consistent Calm", "Daily Zen", "Community Star", "Feedback Hero", "Mindful Member"};
        String[] icons = {"badge2.png", "badge4.png", "badge7.png", "badge8.png", "badge6.png", "badge1.png", "badge2.png", "badge3.png", "badge4.png", "badge5.png", "badge6.png", "badge7.png"};

        for (int i = 0; i < types.length; i++) {
            Achievement ach = new Achievement(names[i], "Special milestone achievement", icons[i], false, 0, 1);
            attachDateAndStatus(ach, studentId, types[i], false);
            list.add(ach);
        }

        // SORTING: Locked (false) at Top, Unlocked (true) at Bottom
        Collections.sort(list, Comparator.comparing(Achievement::isUnlocked));

        return list;
    }

    private void attachDateAndStatus(Achievement ach, String studentId, String type, boolean dynamicCondition) {
        try {
            List<Timestamp> dates = jdbcTemplate.queryForList(
                "SELECT unlocked_at FROM student_achievements WHERE student_id = ? AND achievement_type = ? AND unlocked_at IS NOT NULL", 
                Timestamp.class, studentId, type);
            
            if (!dates.isEmpty()) {
                ach.setUnlocked(true);
                ach.setUnlockedDate(new SimpleDateFormat("dd MMM yyyy").format(dates.get(0)));
                // CRITICAL: Set progress to full if unlocked in database
                ach.setCurrentProgress(ach.getTargetValue());
            } else if (dynamicCondition) {
                ach.setUnlocked(true);
                ach.setCurrentProgress(ach.getTargetValue());
            }
        } catch (Exception e) {
            if (dynamicCondition) {
                ach.setUnlocked(true);
                ach.setCurrentProgress(ach.getTargetValue());
            }
        }
    }
}