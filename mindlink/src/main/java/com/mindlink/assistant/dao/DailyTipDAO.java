package com.mindlink.assistant.dao;

import com.mindlink.assistant.model.DailyTip;
import java.util.List;

/**
 * Data Access Object (DAO) Interface for DailyTip
 * Handles all database operations for DailyTip entity
 */
public interface DailyTipDAO {
    
    /**
     * Get a random tip
     * @return Random DailyTip object
     */
    DailyTip findRandom();
    
    /**
     * Get three random tips
     * @return List of 3 random DailyTip objects
     */
    List<DailyTip> findThreeRandom();
    
    /**
     * Get all tips ordered by creation date
     * @return List of all DailyTip objects
     */
    List<DailyTip> findAll();
    
    /**
     * Find tip by ID
     * @param id Tip ID
     * @return DailyTip object or null if not found
     */
    DailyTip findById(int id);
    
    /**
     * Create a new tip
     * @param tip DailyTip object to create
     * @return Number of rows affected
     */
    int create(DailyTip tip);
    
    /**
     * Create a new tip with parameters
     * @param title Tip title
     * @param content Tip content
     * @return Number of rows affected
     */
    int create(String title, String content);
    
    /**
     * Update an existing tip
     * @param tip DailyTip object to update
     * @return Number of rows affected
     */
    int update(DailyTip tip);
    
    /**
     * Update tip by ID
     * @param id Tip ID
     * @param title New title
     * @param content New content
     * @return Number of rows affected
     */
    int update(int id, String title, String content);
    
    /**
     * Delete a tip
     * @param id Tip ID
     * @return Number of rows affected
     */
    int delete(int id);
}

