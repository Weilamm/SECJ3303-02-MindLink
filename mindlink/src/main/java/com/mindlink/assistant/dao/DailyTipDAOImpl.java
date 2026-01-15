package com.mindlink.assistant.dao;

import com.mindlink.assistant.model.DailyTip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Data Access Object (DAO) Implementation for DailyTip
 * Implements DailyTipDAO interface using JdbcTemplate
 */
@Repository
public class DailyTipDAOImpl implements DailyTipDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper for DailyTip entity
    private RowMapper<DailyTip> dailyTipRowMapper = new RowMapper<DailyTip>() {
        @Override
        public DailyTip mapRow(ResultSet rs, int rowNum) throws SQLException {
            DailyTip tip = new DailyTip();
            tip.setId(rs.getInt("id"));
            tip.setTitle(rs.getString("title"));
            tip.setContent(rs.getString("content"));
            return tip;
        }
    };

    @Override
    public DailyTip findRandom() {
        String sql = "SELECT id, title, content FROM daily_tips ORDER BY RAND() LIMIT 1";
        List<DailyTip> tips = jdbcTemplate.query(sql, dailyTipRowMapper);
        if (tips.isEmpty()) {
            return new DailyTip(0, "General Wellness", "Remember to take care of your mental health today!");
        }
        return tips.get(0);
    }

    @Override
    public List<DailyTip> findThreeRandom() {
        String sql = "SELECT id, title, content FROM daily_tips ORDER BY RAND() LIMIT 3";
        return jdbcTemplate.query(sql, dailyTipRowMapper);
    }

    @Override
    public List<DailyTip> findAll() {
        String sql = "SELECT id, title, content FROM daily_tips ORDER BY id ASC";
        return jdbcTemplate.query(sql, dailyTipRowMapper);
    }

    @Override
    public DailyTip findById(int id) {
        String sql = "SELECT id, title, content FROM daily_tips WHERE id = ?";
        List<DailyTip> tips = jdbcTemplate.query(sql, dailyTipRowMapper, id);
        return tips.isEmpty() ? null : tips.get(0);
    }

    @Override
    public int create(DailyTip tip) {
        String sql = "INSERT INTO daily_tips (title, content) VALUES (?, ?)";
        return jdbcTemplate.update(sql, tip.getTitle(), tip.getContent());
    }

    @Override
    public int create(String title, String content) {
        String sql = "INSERT INTO daily_tips (title, content) VALUES (?, ?)";
        return jdbcTemplate.update(sql, title, content);
    }

    @Override
    public int update(DailyTip tip) {
        String sql = "UPDATE daily_tips SET title = ?, content = ? WHERE id = ?";
        return jdbcTemplate.update(sql, tip.getTitle(), tip.getContent(), tip.getId());
    }

    @Override
    public int update(int id, String title, String content) {
        String sql = "UPDATE daily_tips SET title = ?, content = ? WHERE id = ?";
        return jdbcTemplate.update(sql, title, content, id);
    }

    @Override
    public int delete(int id) {
        String sql = "DELETE FROM daily_tips WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}

