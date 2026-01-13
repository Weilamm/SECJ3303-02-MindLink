package com.mindlink.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service("counselingFeedbackService")
public class FeedbackService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void saveFeedback(Feedback fb) {
        String sql = "INSERT INTO feedback (booking_id, category, subject, message, rating) VALUES (?, ?, ?, ?, ?)";
        
        jdbcTemplate.update(sql, 
            fb.getBookingId(),
            fb.getCategory(),
            fb.getSubject(),
            fb.getMessage(),
            fb.getRating()
        );
    }
}