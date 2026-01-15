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
        int modCount = getCount(
            "SELECT COUNT(DISTINCT assessment_id) FROM user_module_progress WHERE student_id = ?", 
            studentId
        );
        Achievement ach1 = new Achievement("Mind Explorer", "Completed 1st mental health assessment", "badge3.png", false, modCount, 1);
        attachDateAndStatus(ach1, studentId, "MIND_EXPLORER", modCount > 0);
        list.add(ach1);

        // 2. Wellness Warrior
        int sessCount = getCount(
            "SELECT COUNT(*) FROM appointment WHERE student_id = ? AND status = 'Confirmed'", 
            studentId
        );
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

        // SORTING: Unlocked (true) items go to the bottom, Locked (false) stay at the top
        Collections.sort(list, Comparator.comparing(Achievement::isUnlocked));

        return list;
    }

    /**
     * Safely executes a count query to avoid EmptyResultDataAccessException.
     */
    private int getCount(String sql, String studentId) {
        try {
            List<Integer> results = jdbcTemplate.queryForList(sql, Integer.class, studentId);
            return (results.isEmpty() || results.get(0) == null) ? 0 : results.get(0);
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * Checks database for a specific achievement record and updates the Achievement object.
     */
    private void attachDateAndStatus(Achievement ach, String studentId, String type, boolean dynamicCondition) {
        try {
            // Check if the achievement exists in the manual unlock table
            List<Timestamp> dates = jdbcTemplate.queryForList(
                "SELECT unlocked_at FROM student_achievements WHERE student_id = ? AND achievement_type = ? AND unlocked_at IS NOT NULL", 
                Timestamp.class, studentId, type);
            
            if (!dates.isEmpty() && dates.get(0) != null) {
                ach.setUnlocked(true);
                ach.setUnlockedDate(new SimpleDateFormat("dd MMM yyyy").format(dates.get(0)));
                // Set progress to max if it is already unlocked in DB
                ach.setCurrentProgress(ach.getTargetValue());
            } else if (dynamicCondition) {
                // If not in DB but meets live criteria, show as unlocked
                ach.setUnlocked(true);
                ach.setCurrentProgress(ach.getTargetValue());
            }
        } catch (Exception e) {
            // Fallback to dynamic condition if query fails
            if (dynamicCondition) {
                ach.setUnlocked(true);
                ach.setCurrentProgress(ach.getTargetValue());
            }
        }
    }
}