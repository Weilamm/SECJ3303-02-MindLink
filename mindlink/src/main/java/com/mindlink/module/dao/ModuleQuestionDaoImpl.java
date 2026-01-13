package com.mindlink.module.dao;

import com.mindlink.module.ModuleQuestion;
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
public class ModuleQuestionDaoImpl implements ModuleQuestionDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<ModuleQuestion> rowMapper = new RowMapper<ModuleQuestion>() {
        @Override
        public ModuleQuestion mapRow(ResultSet rs, int rowNum) throws SQLException {
            ModuleQuestion question = new ModuleQuestion();
            question.setQuestionId(rs.getInt("question_id"));
            question.setModuleId(rs.getInt("module_id"));
            question.setChapterNumber(rs.getInt("chapter_number"));
            question.setQuestionNumber(rs.getString("question_number"));
            question.setQuestionText(rs.getString("question_text"));
            question.setQuestionType(rs.getString("question_type"));

            Timestamp createdAt = rs.getTimestamp("created_at");
            if (createdAt != null)
                question.setCreatedAt(createdAt.toLocalDateTime());

            Timestamp updatedAt = rs.getTimestamp("updated_at");
            if (updatedAt != null)
                question.setUpdatedAt(updatedAt.toLocalDateTime());

            return question;
        }
    };

    @Override
    public List<ModuleQuestion> findByModuleId(int moduleId) {
        String sql = "SELECT * FROM module_question WHERE module_id = ? ORDER BY chapter_number, question_number";
        return jdbcTemplate.query(sql, rowMapper, moduleId);
    }

    @Override
    public Optional<ModuleQuestion> findById(int questionId) {
        String sql = "SELECT * FROM module_question WHERE question_id = ?";
        List<ModuleQuestion> questions = jdbcTemplate.query(sql, rowMapper, questionId);
        return questions.stream().findFirst();
    }

    @Override
    public void save(ModuleQuestion question) {
        String sql = "INSERT INTO module_question (module_id, chapter_number, question_number, question_text, question_type, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                question.getModuleId(),
                question.getChapterNumber(),
                question.getQuestionNumber(),
                question.getQuestionText(),
                question.getQuestionType(),
                question.getCreatedAt(),
                question.getUpdatedAt());
    }

    @Override
    public void update(ModuleQuestion question) {
        String sql = "UPDATE module_question SET chapter_number=?, question_number=?, question_text=?, question_type=?, updated_at=? WHERE question_id=?";
        jdbcTemplate.update(sql,
                question.getChapterNumber(),
                question.getQuestionNumber(),
                question.getQuestionText(),
                question.getQuestionType(),
                question.getUpdatedAt(),
                question.getQuestionId());
    }

    @Override
    public void deleteById(int questionId) {
        String sql = "DELETE FROM module_question WHERE question_id = ?";
        jdbcTemplate.update(sql, questionId);
    }

    @Override
    public void deleteByModuleId(int moduleId) {
        String sql = "DELETE FROM module_question WHERE module_id = ?";
        jdbcTemplate.update(sql, moduleId);
    }
}

