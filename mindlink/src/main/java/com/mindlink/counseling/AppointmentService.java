package com.mindlink.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@Service
public class AppointmentService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 1. SAVE (Insert into Database)
    public void saveAppointment(Appointment app) {
        String sql = "INSERT INTO appointment (id, student_id, counselor_name, date, time, type, venue, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String status = (app.getStatus() != null) ? app.getStatus() : "Booked";
        
        jdbcTemplate.update(sql, 
            app.getId(),
            app.getStudentId(),
            app.getCounselorName(),
            app.getDate(),
            app.getTime(),
            app.getType(),
            app.getVenue(),
            status
        );
    }

    // 2. READ ALL (Select from Database)
    public List<Appointment> getAllAppointments() {
        // Ensure 'created_at' column exists in DB, or remove ORDER BY if it fails
        String sql = "SELECT * FROM appointment"; 
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

    // 5. Past Appointments
    public List<Appointment> getPastAppointments() {
        List<Appointment> allAppointments = getAllAppointments();
        List<Appointment> pastAppointments = new ArrayList<>();
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        for (Appointment app : allAppointments) {
            try {
                LocalDate appDate = LocalDate.parse(app.getDate(), formatter);
                if (appDate.isBefore(today)) {
                    pastAppointments.add(app);
                }
            } catch (Exception e) {
                System.err.println("Error parsing date: " + e.getMessage());
            }
        }
        return pastAppointments;
    }

    // 6. Upcoming Appointments 
    public List<Appointment> getUpcomingAppointments() {
        List<Appointment> allAppointments = getAllAppointments();
        List<Appointment> upcoming = new ArrayList<>();
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        for (Appointment app : allAppointments) {
            try {
                LocalDate appDate = LocalDate.parse(app.getDate(), formatter);
                if (!appDate.isBefore(today)) {
                    upcoming.add(app);
                }
            } catch (Exception e) {
                System.err.println("Skipping invalid date: " + app.getDate());
            }
        }
        return upcoming;
    }

    // --- HELPER: Maps Database Columns to Java Object ---
    private static class AppointmentRowMapper implements RowMapper<Appointment> {
        @Override
        public Appointment mapRow(ResultSet rs, int rowNum) throws SQLException {
            // 🟢 FIX: Added 'return' keyword here!
            return new Appointment(
                rs.getString("id"),
                rs.getString("counselor_name"),
                rs.getString("date"),
                rs.getString("time"),
                rs.getString("type"),
                rs.getString("venue"),
                rs.getString("status"),
                rs.getString("student_id")
            );
        }
    }
}