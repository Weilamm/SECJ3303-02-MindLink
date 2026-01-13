package com.mindlink.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class CounselorService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 1. READ ALL (For Browse Page)
    public List<Counselor> getAllCounselors() {
        String sql = "SELECT * FROM counselor";
        return jdbcTemplate.query(sql, new CounselorRowMapper());
    }

    // 2. READ ONE (For Profile Page & Edit Page)
    public Counselor getCounselorById(String id) {
        String sql = "SELECT * FROM counselor WHERE id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new CounselorRowMapper(), id);
        } catch (Exception e) {
            return null; // Return null if not found
        }
    }

    // 3. SEARCH (For Search Bar)
    public List<Counselor> searchCounselors(String keyword) {
        if (keyword == null || keyword.isEmpty()) {
            return getAllCounselors();
        }
        // Searches name OR location matching the keyword
        String sql = "SELECT * FROM counselor WHERE LOWER(name) LIKE ? OR LOWER(location) LIKE ?";
        String term = "%" + keyword.toLowerCase() + "%";
        return jdbcTemplate.query(sql, new CounselorRowMapper(), term, term);
    }

    // 4. UPDATE (For Edit Profile - SAVES PERMANENTLY)
    public void updateCounselor(Counselor c) {
        String sql = "UPDATE counselor SET name=?, education=?, university=?, languages=?, location=?, email=?, bio=?, quote=?, image_url=? WHERE id=?";
        
        jdbcTemplate.update(sql,
            c.getName(),
            c.getEducation(),
            c.getUniversity(),
            c.getLanguages(),
            c.getLocation(),
            c.getEmail(),
            c.getBio(),
            c.getQuote(),
            c.getImageUrl(),
            c.getId()
        );
    }

    // --- HELPER: Maps Database Columns to Java Object ---
    private static class CounselorRowMapper implements RowMapper<Counselor> {
        @Override
        public Counselor mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new Counselor(
                rs.getString("id"),
                rs.getString("name"),
                rs.getString("location"),
                rs.getString("education"),
                rs.getString("university"),
                rs.getString("languages"),
                rs.getString("email"),
                rs.getString("bio"),
                rs.getString("quote"),
                rs.getString("image_url")
            );
        }
    }
}