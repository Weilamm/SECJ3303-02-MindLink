package com.mindlink.forum.dao;

import com.mindlink.forum.model.Forum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

/**
 * Data Access Object (DAO) Implementation for Forum
 * Implements ForumDAO interface using JdbcTemplate
 */
@Repository
public class ForumDAOImpl implements ForumDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper for Forum entity
    private RowMapper<Forum> forumRowMapper = new RowMapper<Forum>() {
        @Override
        public Forum mapRow(ResultSet rs, int rowNum) throws SQLException {
            Forum forum = new Forum();
            forum.setId(rs.getInt("id"));
            forum.setTitle(rs.getString("title"));
            forum.setDescription(rs.getString("description"));
            forum.setCreatedBy(rs.getString("created_by"));
            
            Timestamp createdAt = rs.getTimestamp("created_at");
            if (createdAt != null) {
                forum.setCreatedAt(createdAt.toLocalDateTime());
            }
            
            Timestamp updatedAt = rs.getTimestamp("updated_at");
            if (updatedAt != null) {
                forum.setUpdatedAt(updatedAt.toLocalDateTime());
            }
            
            forum.setStatus(rs.getString("status"));
            return forum;
        }
    };

    @Override
    public List<Forum> findAll() {
        String sql = "SELECT id, title, description, created_by, created_at, updated_at, status " +
                     "FROM forum WHERE status = 'active' ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, forumRowMapper);
    }

    @Override
    public List<Forum> findAllIncludingClosed() {
        String sql = "SELECT id, title, description, created_by, created_at, updated_at, status " +
                     "FROM forum ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, forumRowMapper);
    }

    @Override
    public Forum findById(int id) {
        String sql = "SELECT id, title, description, created_by, created_at, updated_at, status " +
                     "FROM forum WHERE id = ?";
        List<Forum> forums = jdbcTemplate.query(sql, forumRowMapper, id);
        return forums.isEmpty() ? null : forums.get(0);
    }

    @Override
    public int create(Forum forum) {
        String sql = "INSERT INTO forum (title, description, created_by, status) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, forum.getTitle(), forum.getDescription(), 
                                   forum.getCreatedBy(), forum.getStatus() != null ? forum.getStatus() : "active");
    }

    @Override
    public int create(String title, String description, String createdBy) {
        String sql = "INSERT INTO forum (title, description, created_by, status) VALUES (?, ?, ?, 'active')";
        return jdbcTemplate.update(sql, title, description, createdBy);
    }

    @Override
    public int update(Forum forum) {
        String sql = "UPDATE forum SET title = ?, description = ? WHERE id = ?";
        return jdbcTemplate.update(sql, forum.getTitle(), forum.getDescription(), forum.getId());
    }

    @Override
    public int update(int id, String title, String description) {
        String sql = "UPDATE forum SET title = ?, description = ? WHERE id = ?";
        return jdbcTemplate.update(sql, title, description, id);
    }

    @Override
    public int delete(int id) {
        // Soft delete by setting status to archived
        String sql = "UPDATE forum SET status = 'archived' WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public int hardDelete(int id) {
        String sql = "DELETE FROM forum WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}

