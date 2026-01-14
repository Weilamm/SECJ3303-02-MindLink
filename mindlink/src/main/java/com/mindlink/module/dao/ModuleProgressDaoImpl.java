package com.mindlink.module.dao;

import com.mindlink.module.UserProgress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ModuleProgressDaoImpl implements ModuleProgressDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<UserProgress> rowMapper = new RowMapper<UserProgress>() {
        @Override
        public UserProgress mapRow(ResultSet rs, int rowNum) throws SQLException {
            UserProgress progress = new UserProgress();
            progress.setProgressId(rs.getInt("progress_id"));
            progress.setStudentId(rs.getString("student_id"));
            progress.setModuleId(rs.getInt("module_id"));
            progress.setQuestionId(rs.getInt("question_id"));
            if (rs.getTimestamp("completed_at") != null) {
                progress.setCompletedAt(rs.getTimestamp("completed_at").toLocalDateTime());
            }
            return progress;
        }
    };

    @Override
    public void saveProgress(UserProgress progress) {
        String sql = "INSERT INTO user_module_progress (student_id, module_id, question_id, completed_at) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE completed_at = VALUES(completed_at)";
        jdbcTemplate.update(sql,
                progress.getStudentId(),
                progress.getModuleId(),
                progress.getQuestionId(),
                progress.getCompletedAt());
    }

    @Override
    public List<UserProgress> findByStudentAndModule(String studentId, int moduleId) {
        String sql = "SELECT * FROM user_module_progress WHERE student_id = ? AND module_id = ?";
        return jdbcTemplate.query(sql, rowMapper, studentId, moduleId);
    }

    @Override
    public List<UserProgress> findByStudent(String studentId) {
        String sql = "SELECT * FROM user_module_progress WHERE student_id = ?";
        return jdbcTemplate.query(sql, rowMapper, studentId);
    }

    @Override
    public boolean isQuestionCompleted(String studentId, int questionId) {
        String sql = "SELECT COUNT(*) FROM user_module_progress WHERE student_id = ? AND question_id = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, studentId, questionId);
        return count != null && count > 0;
    }
}
