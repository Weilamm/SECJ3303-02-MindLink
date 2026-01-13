package com.mindlink.assessment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class AssessmentDaoImpl implements AssessmentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<Assessment> assessmentRowMapper = new RowMapper<Assessment>() {
        @Override
        public Assessment mapRow(ResultSet rs, int rowNum) throws SQLException {
            Assessment assessment = new Assessment();
            assessment.setId(rs.getInt("assessment_id"));
            assessment.setTitle(rs.getString("assessment_title"));
            assessment.setQuestionText(rs.getString("question_text"));
            assessment.setQuestionType(rs.getString("question_type"));
            return assessment;
        }
    };

    private final RowMapper<AssessmentOption> optionRowMapper = new RowMapper<AssessmentOption>() {
        @Override
        public AssessmentOption mapRow(ResultSet rs, int rowNum) throws SQLException {
            AssessmentOption option = new AssessmentOption();
            option.setOptionId(rs.getInt("option_id"));
            option.setAssessmentId(rs.getInt("assessment_id"));
            option.setOptionText(rs.getString("option_text"));
            option.setScoreValue(rs.getInt("score_value"));
            return option;
        }
    };

    @Override
    public List<Assessment> findByTitle(String title) {
        String sql = "SELECT * FROM assessment WHERE assessment_title = ?";
        List<Assessment> assessments = jdbcTemplate.query(sql, assessmentRowMapper, title);

        for (Assessment assessment : assessments) {
            String optionSql = "SELECT * FROM ass_question WHERE assessment_id = ?";
            List<AssessmentOption> options = jdbcTemplate.query(optionSql, optionRowMapper, assessment.getId());
            assessment.setOptions(options);
        }

        return assessments;
    }
}
