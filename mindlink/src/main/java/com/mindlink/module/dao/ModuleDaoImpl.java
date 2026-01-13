package com.mindlink.module.dao;

import com.mindlink.module.LearningModule;
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
public class ModuleDaoImpl implements ModuleDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<LearningModule> rowMapper = new RowMapper<LearningModule>() {
        @Override
        public LearningModule mapRow(ResultSet rs, int rowNum) throws SQLException {
            LearningModule module = new LearningModule();
            module.setModuleId(rs.getInt("module_id"));
            module.setTitle(rs.getString("title"));
            module.setDescription(rs.getString("description"));
            module.setImagePath(rs.getString("image_path"));

            Timestamp createdAt = rs.getTimestamp("created_at");
            if (createdAt != null)
                module.setCreatedAt(createdAt.toLocalDateTime());

            Timestamp updatedAt = rs.getTimestamp("updated_at");
            if (updatedAt != null)
                module.setUpdatedAt(updatedAt.toLocalDateTime());

            return module;
        }
    };

    @Override
    public List<LearningModule> findAll() {
        String sql = "SELECT * FROM module ORDER BY module_id";
        return jdbcTemplate.query(sql, rowMapper);
    }

    @Override
    public Optional<LearningModule> findById(int id) {
        String sql = "SELECT * FROM module WHERE module_id = ?";
        List<LearningModule> modules = jdbcTemplate.query(sql, rowMapper, id);
        return modules.stream().findFirst();
    }

    @Override
    public void save(LearningModule module) {
        String sql = "INSERT INTO module (title, description, image_path, created_at, updated_at) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                module.getTitle(),
                module.getDescription(),
                module.getImagePath(),
                module.getCreatedAt(),
                module.getUpdatedAt());
    }

    @Override
    public void update(LearningModule module) {
        String sql = "UPDATE module SET title=?, description=?, image_path=?, updated_at=? WHERE module_id=?";
        jdbcTemplate.update(sql,
                module.getTitle(),
                module.getDescription(),
                module.getImagePath(),
                module.getUpdatedAt(),
                module.getModuleId());
    }

    @Override
    public void deleteById(int id) {
        String sql = "DELETE FROM module WHERE module_id = ?";
        jdbcTemplate.update(sql, id);
    }
}


