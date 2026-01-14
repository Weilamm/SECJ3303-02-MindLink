package com.mindlink.forum.dao;

import com.mindlink.forum.model.ForumPost;
import java.util.List;

/**
 * Data Access Object (DAO) Interface for ForumPost
 * Handles all database operations for ForumPost entity
 */
public interface ForumPostDAO {
    
    /**
     * Get all posts for a specific forum
     * @param forumId Forum ID
     * @return List of posts in the forum
     */
    List<ForumPost> findByForumId(int forumId);
    
    /**
     * Find post by ID
     * @param id Post ID
     * @return ForumPost object or null if not found
     */
    ForumPost findById(int id);
    
    /**
     * Create a new post
     * @param post ForumPost object to create
     * @return Number of rows affected
     */
    int create(ForumPost post);
    
    /**
     * Create a new post with parameters
     * @param forumId Forum ID
     * @param userId User ID
     * @param userName User name
     * @param content Post content
     * @return Number of rows affected
     */
    int create(int forumId, String userId, String userName, String content);
    
    /**
     * Create a new post with parameters including anonymous flag
     * @param forumId Forum ID
     * @param userId User ID
     * @param userName User name
     * @param content Post content
     * @param isAnonymous Whether the post should be anonymous
     * @return Number of rows affected
     */
    int create(int forumId, String userId, String userName, String content, boolean isAnonymous);
    
    /**
     * Update an existing post
     * @param post ForumPost object to update
     * @return Number of rows affected
     */
    int update(ForumPost post);
    
    /**
     * Update post content by ID
     * @param id Post ID
     * @param content New content
     * @return Number of rows affected
     */
    int update(int id, String content);
    
    /**
     * Delete a post
     * @param id Post ID
     * @return Number of rows affected
     */
    int delete(int id);
    
    /**
     * Get count of posts for a forum
     * @param forumId Forum ID
     * @return Number of posts
     */
    int countByForumId(int forumId);
    
    /**
     * Find all reported posts
     * @return List of reported posts
     */
    List<ForumPost> findReportedPosts();
    
    /**
     * Update post status
     * @param id Post ID
     * @param status New status ('normal' or 'reported')
     * @return Number of rows affected
     */
    int updateStatus(int id, String status);
    
    /**
     * Update post status with report reason
     * @param id Post ID
     * @param status New status ('normal' or 'reported')
     * @param reportReason Reason for reporting
     * @return Number of rows affected
     */
    int updateStatusWithReason(int id, String status, String reportReason);
    
    /**
     * Search posts by content within a forum
     * @param forumId Forum ID
     * @param searchTerm Search term to match against post content
     * @return List of matching posts
     */
    List<ForumPost> searchByContent(int forumId, String searchTerm);
}

