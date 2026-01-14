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

    // 1. STUDENT: Save Feedback
    public void saveFeedback(Feedback fb) {
        String sql = "INSERT INTO feedback (booking_id, category, subject, message, rating) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, fb.getBookingId(), fb.getCategory(), fb.getSubject(), fb.getMessage(), fb.getRating());
    }

    // 2. COUNSELOR: Get Feedback for a specific Session
    public Feedback getFeedbackByAppointmentId(String bookingId) {
        String sql = "SELECT * FROM feedback WHERE booking_id = ?";
        try {
            // Updated to use the shared RowMapper below
            return jdbcTemplate.queryForObject(sql, new FeedbackRowMapper(), bookingId);
        } catch (Exception e) {
            return null; 
        }
    }

    // 3. ADMIN: Get ALL Feedback (New method for Admin Dashboard)
    public List<Feedback> getAllFeedback() {
        String sql = "SELECT * FROM feedback ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, new FeedbackRowMapper());
    }

    // 4. ADMIN: Save Reply (New method for Admin responding)
    public void saveAdminReply(String feedbackId, String reply) {
        String sql = "UPDATE feedback SET admin_reply = ? WHERE id = ?";
        jdbcTemplate.update(sql, reply, feedbackId);
    }

    // 5. ADMIN: Delete Feedback
    public void deleteFeedback(String id) {
        String sql = "DELETE FROM feedback WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    // --- HELPER: UPDATED RowMapper ---
    private static class FeedbackRowMapper implements RowMapper<Feedback> {
        @Override
        public Feedback mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new Feedback(
                rs.getString("id"),           
                rs.getString("booking_id"),
                rs.getString("category"),
                rs.getString("subject"),
                rs.getString("message"),
                rs.getInt("rating"),
                rs.getTimestamp("created_at"),
                rs.getString("admin_reply") 
            );
        }
    }
}