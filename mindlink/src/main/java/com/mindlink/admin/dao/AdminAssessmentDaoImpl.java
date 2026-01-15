package com.mindlink.admin.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mindlink.admin.AdminAssessment;
import com.mindlink.admin.AdminAssessment.Option; 

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

@Repository
public class AdminAssessmentDaoImpl implements AdminAssessmentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<AdminAssessment> findByModuleId(int moduleId) {
        String sql = "SELECT * FROM assessment WHERE module_id = ?";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            AdminAssessment a = new AdminAssessment();
            a.setId(rs.getInt("assessment_id"));
            a.setModuleId(rs.getInt("module_id")); 
            a.setTitle(rs.getString("assessment_title")); 
            a.setQuestionText(rs.getString("question_text")); 
            a.setOptions(getOptionsForAssessment(a.getId()));
            return a;
        }, moduleId);
    }

    @Override
    public AdminAssessment findById(int id) {
        String sql = "SELECT * FROM assessment WHERE assessment_id = ?";
        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
            AdminAssessment a = new AdminAssessment();
            a.setId(rs.getInt("assessment_id"));
            a.setModuleId(rs.getInt("module_id"));
            a.setTitle(rs.getString("assessment_title"));
            a.setQuestionText(rs.getString("question_text"));
            a.setOptions(getOptionsForAssessment(id));
            return a;
        }, id);
    }

    @Override
    @Transactional
    public void save(AdminAssessment a) {
        String sql = "INSERT INTO assessment (module_id, assessment_title, question_text) VALUES (?, ?, ?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, a.getModuleId());
            ps.setString(2, a.getTitle());
            ps.setString(3, a.getQuestionText());
            return ps;
        }, keyHolder);

        if (keyHolder.getKey() != null) {
            saveOptions(keyHolder.getKey().intValue(), a.getOptions());
        }
    }

    @Override
    @Transactional
    public void update(AdminAssessment a) {
        jdbcTemplate.update("UPDATE assessment SET assessment_title = ?, question_text = ? WHERE assessment_id = ?",
                a.getTitle(), a.getQuestionText(), a.getId());
        jdbcTemplate.update("DELETE FROM ass_question WHERE assessment_id = ?", a.getId());
        saveOptions(a.getId(), a.getOptions());
    }

    @Override
    public void delete(int id) {
        jdbcTemplate.update("DELETE FROM ass_question WHERE assessment_id = ?", id);
        jdbcTemplate.update("DELETE FROM assessment WHERE assessment_id = ?", id);
    }

    private void saveOptions(int assessmentId, List<Option> options) {
        if (options != null && !options.isEmpty()) {
            String sql = "INSERT INTO ass_question (assessment_id, option_text, score_value) VALUES (?, ?, ?)";
            for (Option opt : options) {
                jdbcTemplate.update(sql, assessmentId, opt.getOptionText(), opt.getScoreValue());
            }
        }
    }

    private List<Option> getOptionsForAssessment(int assessmentId) {
        return jdbcTemplate.query("SELECT * FROM ass_question WHERE assessment_id = ?", (rs, rowNum) -> { 
            Option o = new Option();
            o.setOptionId(rs.getInt("option_id")); 
            o.setOptionText(rs.getString("option_text")); 
            o.setScoreValue(rs.getInt("score_value")); 
            o.setAssessmentId(assessmentId);
            return o;
        }, assessmentId);
    }
}