package com.mindlink.forum.dao;

import com.mindlink.forum.model.ForumPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

/**
 * Data Access Object (DAO) Implementation for ForumPost
 * Implements ForumPostDAO interface using JdbcTemplate
 */
@Repository
public class ForumPostDAOImpl implements ForumPostDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper for ForumPost entity
    private RowMapper<ForumPost> forumPostRowMapper = new RowMapper<ForumPost>() {
        @Override
        public ForumPost mapRow(ResultSet rs, int rowNum) throws SQLException {
            ForumPost post = new ForumPost();
            post.setId(rs.getInt("id"));
            post.setForumId(rs.getInt("forum_id"));
            post.setUserId(rs.getString("user_id"));
            post.setUserName(rs.getString("user_name"));
            post.setContent(rs.getString("content"));
            post.setStatus(rs.getString("status") != null ? rs.getString("status") : "normal");
            
            // Handle is_anonymous field (may not exist in old databases)
            try {
                post.setAnonymous(rs.getBoolean("is_anonymous"));
            } catch (SQLException e) {
                post.setAnonymous(false); // Default to false if column doesn't exist
            }
            
            // Handle report_reason field (may not exist in old databases)
            try {
                post.setReportReason(rs.getString("report_reason"));
            } catch (SQLException e) {
                post.setReportReason(null); // Default to null if column doesn't exist
            }
            
            Timestamp createdAt = rs.getTimestamp("created_at");
            if (createdAt != null) {
                post.setCreatedAt(createdAt.toLocalDateTime());
            }
            
            Timestamp updatedAt = rs.getTimestamp("updated_at");
            if (updatedAt != null) {
                post.setUpdatedAt(updatedAt.toLocalDateTime());
            }
            
            return post;
        }
    };

    @Override
    public List<ForumPost> findByForumId(int forumId) {
        String sql = "SELECT id, forum_id, user_id, user_name, content, status, is_anonymous, report_reason, created_at, updated_at " +
                     "FROM forum_post WHERE forum_id = ? ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, forumPostRowMapper, forumId);
    }

    @Override
    public ForumPost findById(int id) {
        String sql = "SELECT id, forum_id, user_id, user_name, content, status, is_anonymous, report_reason, created_at, updated_at " +
                     "FROM forum_post WHERE id = ?";
        List<ForumPost> posts = jdbcTemplate.query(sql, forumPostRowMapper, id);
        return posts.isEmpty() ? null : posts.get(0);
    }
    
    /**
     * Find all reported posts
     */
    public List<ForumPost> findReportedPosts() {
        String sql = "SELECT id, forum_id, user_id, user_name, content, status, is_anonymous, report_reason, created_at, updated_at " +
                     "FROM forum_post WHERE status = 'reported' ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, forumPostRowMapper);
    }
    
    /**
     * Update post status
     */
    public int updateStatus(int id, String status) {
        String sql = "UPDATE forum_post SET status = ? WHERE id = ?";
        return jdbcTemplate.update(sql, status, id);
    }
    
    /**
     * Update post status with report reason
     */
    public int updateStatusWithReason(int id, String status, String reportReason) {
        String sql = "UPDATE forum_post SET status = ?, report_reason = ? WHERE id = ?";
        return jdbcTemplate.update(sql, status, reportReason, id);
    }

    @Override
    public int create(ForumPost post) {
        String sql = "INSERT INTO forum_post (forum_id, user_id, user_name, content, status) VALUES (?, ?, ?, ?, ?)";
        String status = post.getStatus() != null ? post.getStatus() : "normal";
        return jdbcTemplate.update(sql, post.getForumId(), post.getUserId(), 
                                   post.getUserName(), post.getContent(), status);
    }

    @Override
    public int create(int forumId, String userId, String userName, String content) {
        String sql = "INSERT INTO forum_post (forum_id, user_id, user_name, content, status, is_anonymous) VALUES (?, ?, ?, ?, 'normal', FALSE)";
        return jdbcTemplate.update(sql, forumId, userId, userName, content);
    }
    
    /**
     * Create post with anonymous flag
     */
    @Override
    public int create(int forumId, String userId, String userName, String content, boolean isAnonymous) {
        String sql = "INSERT INTO forum_post (forum_id, user_id, user_name, content, status, is_anonymous) VALUES (?, ?, ?, ?, 'normal', ?)";
        return jdbcTemplate.update(sql, forumId, userId, userName, content, isAnonymous);
    }

    @Override
    public int update(ForumPost post) {
        String sql = "UPDATE forum_post SET content = ? WHERE id = ?";
        return jdbcTemplate.update(sql, post.getContent(), post.getId());
    }

    @Override
    public int update(int id, String content) {
        String sql = "UPDATE forum_post SET content = ? WHERE id = ?";
        return jdbcTemplate.update(sql, content, id);
    }

    @Override
    public int delete(int id) {
        String sql = "DELETE FROM forum_post WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public int countByForumId(int forumId) {
        String sql = "SELECT COUNT(*) FROM forum_post WHERE forum_id = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, forumId);
        return count != null ? count : 0;
    }

    @Override
    public List<ForumPost> searchByContent(int forumId, String searchTerm) {
        String sql = "SELECT id, forum_id, user_id, user_name, content, status, is_anonymous, report_reason, created_at, updated_at " +
                     "FROM forum_post WHERE forum_id = ? AND LOWER(content) LIKE ? ORDER BY created_at DESC";
        String term = "%" + searchTerm.toLowerCase() + "%";
        return jdbcTemplate.query(sql, forumPostRowMapper, forumId, term);
    }
}

