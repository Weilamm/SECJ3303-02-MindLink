package com.mindlink.assistant.dao;

import com.mindlink.assistant.model.Chatbot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Data Access Object (DAO) Implementation for Chatbot
 * Implements ChatbotDAO interface using JdbcTemplate
 */
@Repository
public class ChatbotDAOImpl implements ChatbotDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper for Chatbot entity
    private RowMapper<Chatbot> chatbotRowMapper = new RowMapper<Chatbot>() {
        @Override
        public Chatbot mapRow(ResultSet rs, int rowNum) throws SQLException {
            Chatbot chatbot = new Chatbot();
            chatbot.setId(rs.getInt("id"));
            chatbot.setKeyword(rs.getString("keyword"));
            chatbot.setResponse(rs.getString("response"));
            return chatbot;
        }
    };

    @Override
    public List<Chatbot> findAll() {
        String sql = "SELECT id, keyword, response FROM chatbot ORDER BY keyword";
        return jdbcTemplate.query(sql, chatbotRowMapper);
    }

    @Override
    public List<Chatbot> findAllByKeywordLength() {
        String sql = "SELECT id, keyword, response FROM chatbot";
        List<Chatbot> rules = jdbcTemplate.query(sql, chatbotRowMapper);
        // Sort by keyword length (descending) - longer keywords matched first
        return rules.stream()
                .sorted(Comparator.comparingInt((Chatbot rule) -> rule.getKeyword().length()).reversed())
                .collect(Collectors.toList());
    }

    @Override
    public Chatbot findById(int id) {
        String sql = "SELECT id, keyword, response FROM chatbot WHERE id = ?";
        List<Chatbot> rules = jdbcTemplate.query(sql, chatbotRowMapper, id);
        return rules.isEmpty() ? null : rules.get(0);
    }

    @Override
    public int create(Chatbot chatbot) {
        String sql = "INSERT INTO chatbot (keyword, response) VALUES (?, ?)";
        return jdbcTemplate.update(sql, chatbot.getKeyword(), chatbot.getResponse());
    }

    @Override
    public int create(String keyword, String response) {
        String sql = "INSERT INTO chatbot (keyword, response) VALUES (?, ?)";
        return jdbcTemplate.update(sql, keyword, response);
    }

    @Override
    public int update(Chatbot chatbot) {
        String sql = "UPDATE chatbot SET keyword = ?, response = ? WHERE id = ?";
        return jdbcTemplate.update(sql, chatbot.getKeyword(), chatbot.getResponse(), chatbot.getId());
    }

    @Override
    public int update(int id, String keyword, String response) {
        String sql = "UPDATE chatbot SET keyword = ?, response = ? WHERE id = ?";
        return jdbcTemplate.update(sql, keyword, response, id);
    }

    @Override
    public int delete(int id) {
        String sql = "DELETE FROM chatbot WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}

