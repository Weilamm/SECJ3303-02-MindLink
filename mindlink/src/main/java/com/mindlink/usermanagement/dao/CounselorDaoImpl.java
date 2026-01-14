package com.mindlink.usermanagement.dao;

import com.mindlink.usermanagement.model.Counselor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Repository
public class CounselorDaoImpl implements CounselorDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<Counselor> rowMapper = new RowMapper<Counselor>() {
        @Override
        public Counselor mapRow(ResultSet rs, int rowNum) throws SQLException {
            Counselor counselor = new Counselor();
            
            // Matches the database column name
            counselor.setCounselorId(rs.getString("id")); 
            
            counselor.setName(rs.getString("name"));
            counselor.setEmail(rs.getString("email"));
            counselor.setPassword(rs.getString("password"));
            counselor.setPhone(rs.getString("phone_number"));
            counselor.setLocation(rs.getString("location"));
            counselor.setEducation(rs.getString("education"));
            counselor.setUniversity(rs.getString("university"));
            counselor.setLanguages(rs.getString("languages"));
            counselor.setSpecialization(rs.getString("specialization"));
            return counselor;
        }
    };

    @Override
    public List<Counselor> findAll() {
        String sql = "SELECT * FROM counselor";
        return jdbcTemplate.query(sql, rowMapper);
    }

    @Override
    public Optional<Counselor> findById(String id) {
        // --- FIX 2: Change WHERE clause to use 'id' ---
        String sql = "SELECT * FROM counselor WHERE id = ?";
        List<Counselor> counselors = jdbcTemplate.query(sql, rowMapper, id);
        return counselors.stream().findFirst();
    }

    @Override
    public void save(Counselor counselor) {
        // --- FIX 3: Change INSERT column to 'id' ---
        String sql = "INSERT INTO counselor (id, name, email, password, phone, location, education, university, languages, specialization) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                counselor.getCounselorId(),
                counselor.getName(),
                counselor.getEmail(),
                counselor.getPassword(),
                counselor.getPhone(),
                counselor.getLocation(),
                counselor.getEducation(),
                counselor.getUniversity(),
                counselor.getLanguages(),
                counselor.getSpecialization());
    }

    @Override
    public void update(Counselor counselor) {
        // --- FIX 4: Change WHERE clause to use 'id' ---
        String sql = "UPDATE counselor SET name=?, email=?, password=?, phone=?, location=?, education=?, university=?, languages=?, specialization=? WHERE id=?";
        jdbcTemplate.update(sql,
                counselor.getName(),
                counselor.getEmail(),
                counselor.getPassword(),
                counselor.getPhone(),
                counselor.getLocation(),
                counselor.getEducation(),
                counselor.getUniversity(),
                counselor.getLanguages(),
                counselor.getSpecialization(),
                counselor.getCounselorId());
    }

    @Override
    public void deleteById(String id) {
        // --- FIX 5: Change WHERE clause to use 'id' ---
        String sql = "DELETE FROM counselor WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public List<Counselor> findByNameOrLocation(String keyword) {
        String sql = "SELECT * FROM counselor WHERE LOWER(name) LIKE ? OR LOWER(location) LIKE ?";
        String term = "%" + keyword.toLowerCase() + "%";
        return jdbcTemplate.query(sql, rowMapper, term, term);
    }
}