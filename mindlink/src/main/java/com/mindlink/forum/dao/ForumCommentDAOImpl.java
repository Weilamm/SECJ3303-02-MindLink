package com.mindlink.forum.dao;

import com.mindlink.forum.model.ForumComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

/**
 * Data Access Object (DAO) Implementation for ForumComment
 * Implements ForumCommentDAO interface using JdbcTemplate
 */
@Repository
public class ForumCommentDAOImpl implements ForumCommentDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper for ForumComment entity
    private RowMapper<ForumComment> forumCommentRowMapper = new RowMapper<ForumComment>() {
        @Override
        public ForumComment mapRow(ResultSet rs, int rowNum) throws SQLException {
            ForumComment comment = new ForumComment();
            comment.setId(rs.getInt("id"));
            comment.setPostId(rs.getInt("post_id"));
            comment.setUserId(rs.getString("user_id"));
            comment.setUserName(rs.getString("user_name"));
            comment.setContent(rs.getString("content"));
            
            // Read status and report_reason if they exist
            try {
                comment.setStatus(rs.getString("status"));
            } catch (SQLException e) {
                comment.setStatus("normal");
            }
            try {
                comment.setReportReason(rs.getString("report_reason"));
            } catch (SQLException e) {
                comment.setReportReason(null);
            }
            
            Timestamp createdAt = rs.getTimestamp("created_at");
            if (createdAt != null) {
                comment.setCreatedAt(createdAt.toLocalDateTime());
            }
            
            Timestamp updatedAt = rs.getTimestamp("updated_at");
            if (updatedAt != null) {
                comment.setUpdatedAt(updatedAt.toLocalDateTime());
            }
            
            return comment;
        }
    };

    @Override
    public List<ForumComment> findByPostId(int postId) {
        String sql = "SELECT id, post_id, user_id, user_name, content, status, report_reason, created_at, updated_at " +
                     "FROM forum_comment WHERE post_id = ? ORDER BY created_at ASC";
        return jdbcTemplate.query(sql, forumCommentRowMapper, postId);
    }

    @Override
    public ForumComment findById(int id) {
        String sql = "SELECT id, post_id, user_id, user_name, content, status, report_reason, created_at, updated_at " +
                     "FROM forum_comment WHERE id = ?";
        List<ForumComment> comments = jdbcTemplate.query(sql, forumCommentRowMapper, id);
        return comments.isEmpty() ? null : comments.get(0);
    }

    @Override
    public int create(ForumComment comment) {
        String sql = "INSERT INTO forum_comment (post_id, user_id, user_name, content) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, comment.getPostId(), comment.getUserId(), 
                                   comment.getUserName(), comment.getContent());
    }

    @Override
    public int create(int postId, String userId, String userName, String content) {
        String sql = "INSERT INTO forum_comment (post_id, user_id, user_name, content) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, postId, userId, userName, content);
    }

    @Override
    public int update(ForumComment comment) {
        String sql = "UPDATE forum_comment SET content = ? WHERE id = ?";
        return jdbcTemplate.update(sql, comment.getContent(), comment.getId());
    }

    @Override
    public int update(int id, String content) {
        String sql = "UPDATE forum_comment SET content = ? WHERE id = ?";
        return jdbcTemplate.update(sql, content, id);
    }

    @Override
    public int delete(int id) {
        String sql = "DELETE FROM forum_comment WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public int countByPostId(int postId) {
        String sql = "SELECT COUNT(*) FROM forum_comment WHERE post_id = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, postId);
        return count != null ? count : 0;
    }

    public int updateStatusWithReason(int id, String status, String reportReason) {
        String sql = "UPDATE forum_comment SET status = ?, report_reason = ? WHERE id = ?";
        return jdbcTemplate.update(sql, status, reportReason, id);
    }

    public List<ForumComment> findReportedComments() {
        String sql = "SELECT id, post_id, user_id, user_name, content, status, report_reason, created_at, updated_at " +
                     "FROM forum_comment WHERE status = 'reported' ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, forumCommentRowMapper);
    }
}

