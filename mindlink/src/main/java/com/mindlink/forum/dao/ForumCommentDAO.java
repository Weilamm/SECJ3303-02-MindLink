package com.mindlink.forum.dao;

import com.mindlink.forum.model.ForumComment;
import java.util.List;

/**
 * Data Access Object (DAO) Interface for ForumComment
 * Handles all database operations for ForumComment entity
 */
public interface ForumCommentDAO {
    
    /**
     * Get all comments for a specific post
     * @param postId Post ID
     * @return List of comments for the post
     */
    List<ForumComment> findByPostId(int postId);
    
    /**
     * Find comment by ID
     * @param id Comment ID
     * @return ForumComment object or null if not found
     */
    ForumComment findById(int id);
    
    /**
     * Create a new comment
     * @param comment ForumComment object to create
     * @return Number of rows affected
     */
    int create(ForumComment comment);
    
    /**
     * Create a new comment with parameters
     * @param postId Post ID
     * @param userId User ID
     * @param userName User name
     * @param content Comment content
     * @return Number of rows affected
     */
    int create(int postId, String userId, String userName, String content);
    
    /**
     * Update an existing comment
     * @param comment ForumComment object to update
     * @return Number of rows affected
     */
    int update(ForumComment comment);
    
    /**
     * Update comment content by ID
     * @param id Comment ID
     * @param content New content
     * @return Number of rows affected
     */
    int update(int id, String content);
    
    /**
     * Delete a comment
     * @param id Comment ID
     * @return Number of rows affected
     */
    int delete(int id);
    
    /**
     * Get count of comments for a post
     * @param postId Post ID
     * @return Number of comments
     */
    int countByPostId(int postId);
    
    /**
     * Update comment status and report reason
     * @param id Comment ID
     * @param status New status
     * @param reportReason Report reason
     * @return Number of rows affected
     */
    int updateStatusWithReason(int id, String status, String reportReason);
    
    /**
     * Find all reported comments
     * @return List of reported comments
     */
    List<ForumComment> findReportedComments();
}

