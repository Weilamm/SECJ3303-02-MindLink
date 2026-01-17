package com.mindlink.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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

    public void bookAppointment(Appointment appt) {
        String newId = generateNextBookingId();
        appt.setId(newId);
        
        String sql = "INSERT INTO appointment (id, student_id, counselor_name, date, time, type, venue, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                      
        jdbcTemplate.update(sql, 
            appt.getId(), 
            appt.getStudentId(), 
            appt.getCounselorName(), 
            appt.getDate(), 
            appt.getTime(), 
            appt.getType(), 
            appt.getVenue(), 
            "Booked" 
        );
    }

    public List<Appointment> getAppointmentsByStudentId(String studentId) {
        String sql = "SELECT * FROM appointment WHERE student_id = ? ORDER BY date ASC, time ASC";
        return jdbcTemplate.query(sql, new AppointmentRowMapper(), studentId);
    }

    public void rescheduleAppointment(Appointment appt) {
        String sql = "UPDATE appointment SET date = ?, time = ?, type = ?, venue = ?, status = 'Rescheduled' WHERE id = ?";
        
        jdbcTemplate.update(sql, 
            appt.getDate(), 
            appt.getTime(), 
            appt.getType(), 
            appt.getVenue(), 
            appt.getId()
        );
    }

    private String generateNextBookingId() {
        String sql = "SELECT id FROM appointment ORDER BY id DESC LIMIT 1";
        try {
            String lastId = jdbcTemplate.queryForObject(sql, String.class);
            if (lastId == null || !lastId.startsWith("BK")) {
                return "BK001"; 
            }
            String numberPart = lastId.substring(2); 
            int nextId = Integer.parseInt(numberPart) + 1;
            return String.format("BK%03d", nextId);
        } catch (Exception e) {
            return "BK001";
        }
    }

    public List<Appointment> getAllAppointments() {
        String sql = "SELECT a.*, s.name AS student_name FROM appointment a " +
                     "LEFT JOIN student s ON a.student_id = s.student_id";
        return jdbcTemplate.query(sql, new AppointmentRowMapper());
    }

    public Appointment getAppointmentById(String id) {
        String sql = "SELECT a.*, s.name AS student_name FROM appointment a " +
                     "LEFT JOIN student s ON a.student_id = s.student_id " +
                     "WHERE a.id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new AppointmentRowMapper(), id);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public List<Appointment> getAppointmentsForCounselor(String counselorName, String search, String status) {
        StringBuilder sql = new StringBuilder(
            "SELECT a.*, s.name AS student_name " +
            "FROM appointment a " +
            "LEFT JOIN student s ON a.student_id = s.student_id " +
            "WHERE a.counselor_name = ?"
        );
        
        List<Object> params = new ArrayList<>();
        params.add(counselorName);

        if (search != null && !search.trim().isEmpty()) {
            sql.append(" AND (a.student_id LIKE ? OR a.date LIKE ? OR s.name LIKE ?)"); 
            params.add("%" + search + "%");
            params.add("%" + search + "%");
            params.add("%" + search + "%");
        }

        if (status != null && !status.trim().isEmpty() && !status.equals("All")) {
            sql.append(" AND a.status = ?");
            params.add(status);
        }

        sql.append(" ORDER BY a.date DESC, a.time ASC"); 

        return jdbcTemplate.query(sql.toString(), new AppointmentRowMapper(), params.toArray());
    }

    public void deleteAppointment(String id) {
        String sql = "DELETE FROM appointment WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

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
            } catch (Exception e) { }
        }
        return pastAppointments;
    }

    public List<Appointment> getUpcomingAppointments() {
        List<Appointment> allAppointments = getAllAppointments();
        List<Appointment> upcoming = new ArrayList<>();

        for (Appointment app : allAppointments) {
            if (app.isUpcoming()) {
                upcoming.add(app);
            }
        }
        
        upcoming.sort((a1, a2) -> {
            int dateCompare = a1.getDate().compareTo(a2.getDate());
            if (dateCompare != 0) return dateCompare;
            return a1.getTime().compareTo(a2.getTime());
        });
        
        return upcoming;
    }

    public void updateSessionNotes(String id, String notes, boolean markCompleted) {
        String sql;
        if (markCompleted) {
            sql = "UPDATE appointment SET notes = ?, status = 'Completed' WHERE id = ?";
            jdbcTemplate.update(sql, notes, id);
        } else {
            sql = "UPDATE appointment SET notes = ? WHERE id = ?";
            jdbcTemplate.update(sql, notes, id);
        }
    }

    private static class AppointmentRowMapper implements RowMapper<Appointment> {
        @Override
        public Appointment mapRow(ResultSet rs, int rowNum) throws SQLException {
            Appointment appt = new Appointment();
            
            appt.setId(rs.getString("id"));
            appt.setCounselorName(rs.getString("counselor_name"));
            appt.setDate(rs.getString("date"));
            appt.setTime(rs.getString("time"));
            appt.setType(rs.getString("type"));
            appt.setVenue(rs.getString("venue"));
            appt.setStatus(rs.getString("status"));
            appt.setStudentId(rs.getString("student_id"));
            
            try {
                appt.setNotes(rs.getString("notes")); 
            } catch (SQLException e) { }

            try {
                appt.setStudentName(rs.getString("student_name")); 
            } catch (SQLException e) { }
            
            return appt;
        }
    }
}