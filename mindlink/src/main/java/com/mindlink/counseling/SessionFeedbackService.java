package com.mindlink.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper; 
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException; 
import java.util.List;

@Service
public class SessionFeedbackService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Student
    public void saveFeedback(Feedback fb) {
        String sql = "INSERT INTO feedback (booking_id, category, subject, message, rating) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, fb.getBookingId(), fb.getCategory(), fb.getSubject(), fb.getMessage(), fb.getRating());
    }

    // Counselor
    public Feedback getFeedbackByAppointmentId(String bookingId) {
        String sql = "SELECT * FROM feedback WHERE booking_id = ?";
        
        try {
            return jdbcTemplate.queryForObject(sql, new RowMapper<Feedback>() {
                @Override
                public Feedback mapRow(ResultSet rs, int rowNum) throws SQLException {
                    return new Feedback(
                        rs.getString("booking_id"),
                        rs.getString("category"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getInt("rating")
                    );
                }
            }, bookingId);
            
        } catch (Exception e) {
            return null; // Return null if no feedback exists for this session
        }
    }
}