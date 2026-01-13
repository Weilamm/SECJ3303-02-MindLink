package com.mindlink.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class AppointmentService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 1. SAVE (Insert into Database)
    public void saveAppointment(Appointment app) {
        String sql = "INSERT INTO appointment (id, student_id, counselor_name, appointment_date, appointment_time, type, venue, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        jdbcTemplate.update(sql,
            app.getId(),
            app.getStudentId(),    // Ensure your Appointment class has this getter!
            app.getCounselorName(),
            app.getDate(),
            app.getTime(),
            app.getType(),
            app.getVenue(),
            "Confirmed"            // Default status
        );
    }

    // 2. READ ALL (Select from Database)
    public List<Appointment> getAllAppointments() {
        String sql = "SELECT * FROM appointment ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, new AppointmentRowMapper());
    }

    // 3. READ ONE (Find by ID)
    public Appointment getAppointmentById(String id) {
        String sql = "SELECT * FROM appointment WHERE id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new AppointmentRowMapper(), id);
        } catch (Exception e) {
            return null; // Return null if not found
        }
    }

    // 4. DELETE (Remove from Database)
    public void deleteAppointment(String id) {
        String sql = "DELETE FROM appointment WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    // --- HELPER: Maps Database Columns to Java Object ---
    private static class AppointmentRowMapper implements RowMapper<Appointment> {
        @Override
        public Appointment mapRow(ResultSet rs, int rowNum) throws SQLException {
            // Create object using your existing constructor
            Appointment app = new Appointment(
                rs.getString("id"),
                rs.getString("counselor_name"),
                rs.getString("appointment_date"),
                rs.getString("appointment_time"),
                rs.getString("type"),
                rs.getString("venue")
            );
            // Set extra fields if you added them
            if (hasColumn(rs, "student_id")) app.setStudentId(rs.getString("student_id"));
            return app;
        }
        
        // Safety check to avoid crashes if column missing
        private boolean hasColumn(ResultSet rs, String columnName) throws SQLException {
            try {
                rs.findColumn(columnName);
                return true;
            } catch (SQLException e) {
                return false;
            }
        }
    }
}