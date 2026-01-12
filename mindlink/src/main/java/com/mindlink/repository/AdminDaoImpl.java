package com.mindlink.repository;

import com.mindlink.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<Admin> rowMapper = new RowMapper<Admin>() {
        @Override
        public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
            Admin admin = new Admin();
            admin.setAdminId(rs.getString("admin_id"));
            admin.setName(rs.getString("name"));
            admin.setEmail(rs.getString("email"));
            admin.setPassword(rs.getString("password"));
            admin.setPhone(rs.getString("phone"));
            admin.setDepartment(rs.getString("department"));
            admin.setRole(rs.getString("role"));

            Timestamp createdAt = rs.getTimestamp("created_at");
            if (createdAt != null)
                admin.setCreatedAt(createdAt.toLocalDateTime());

            Timestamp updatedAt = rs.getTimestamp("updated_at");
            if (updatedAt != null)
                admin.setUpdatedAt(updatedAt.toLocalDateTime());

            return admin;
        }
    };

    @Override
    public List<Admin> findAll() {
        String sql = "SELECT * FROM admin";
        return jdbcTemplate.query(sql, rowMapper);
    }

    @Override
    public Optional<Admin> findById(String id) {
        String sql = "SELECT * FROM admin WHERE admin_id = ?";
        List<Admin> admins = jdbcTemplate.query(sql, rowMapper, id);
        return admins.stream().findFirst();
    }

    @Override
    public void save(Admin admin) {
        String sql = "INSERT INTO admin (admin_id, name, email, password, phone, department, role, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                admin.getAdminId(),
                admin.getName(),
                admin.getEmail(),
                admin.getPassword(),
                admin.getPhone(),
                admin.getDepartment(),
                admin.getRole(),
                admin.getCreatedAt(),
                admin.getUpdatedAt());
    }

    @Override
    public void update(Admin admin) {
        String sql = "UPDATE admin SET name=?, email=?, password=?, phone=?, department=?, role=?, updated_at=? WHERE admin_id=?";
        jdbcTemplate.update(sql,
                admin.getName(),
                admin.getEmail(),
                admin.getPassword(),
                admin.getPhone(),
                admin.getDepartment(),
                admin.getRole(),
                admin.getUpdatedAt(),
                admin.getAdminId());
    }

    @Override
    public void deleteById(String id) {
        String sql = "DELETE FROM admin WHERE admin_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
