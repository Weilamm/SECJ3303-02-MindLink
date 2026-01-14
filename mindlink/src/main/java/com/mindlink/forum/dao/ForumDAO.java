package com.mindlink.forum.dao;

import com.mindlink.forum.model.Forum;
import java.util.List;

/**
 * Data Access Object (DAO) Interface for Forum
 * Handles all database operations for Forum entity
 */
public interface ForumDAO {
    
    /**
     * Get all active forums
     * @return List of active forums
     */
    List<Forum> findAll();
    
    /**
     * Get all forums including closed and archived
     * @return List of all forums
     */
    List<Forum> findAllIncludingClosed();
    
    /**
     * Find forum by ID
     * @param id Forum ID
     * @return Forum object or null if not found
     */
    Forum findById(int id);
    
    /**
     * Create a new forum
     * @param forum Forum object to create
     * @return Number of rows affected
     */
    int create(Forum forum);
    
    /**
     * Create a new forum with parameters
     * @param title Forum title
     * @param description Forum description
     * @param createdBy Admin ID who created the forum
     * @return Number of rows affected
     */
    int create(String title, String description, String createdBy);
    
    /**
     * Update an existing forum
     * @param forum Forum object to update
     * @return Number of rows affected
     */
    int update(Forum forum);
    
    /**
     * Update forum by ID
     * @param id Forum ID
     * @param title New title
     * @param description New description
     * @return Number of rows affected
     */
    int update(int id, String title, String description);
    
    /**
     * Delete a forum (soft delete by setting status to archived)
     * @param id Forum ID
     * @return Number of rows affected
     */
    int delete(int id);
    
    /**
     * Hard delete a forum from database
     * @param id Forum ID
     * @return Number of rows affected
     */
    int hardDelete(int id);
}

