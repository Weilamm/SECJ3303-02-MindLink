package com.mindlink.assistant.dao;

import com.mindlink.assistant.model.Chatbot;
import java.util.List;

/**
 * Data Access Object (DAO) Interface for Chatbot
 * Handles all database operations for Chatbot entity
 */
public interface ChatbotDAO {
    
    /**
     * Get all chatbot rules
     * @return List of all chatbot rules
     */
    List<Chatbot> findAll();
    
    /**
     * Get all chatbot rules sorted by keyword length (descending)
     * @return List of chatbot rules sorted by keyword length
     */
    List<Chatbot> findAllByKeywordLength();
    
    /**
     * Find chatbot rule by ID
     * @param id Chatbot rule ID
     * @return Chatbot object or null if not found
     */
    Chatbot findById(int id);
    
    /**
     * Create a new chatbot rule
     * @param chatbot Chatbot object to create
     * @return Number of rows affected
     */
    int create(Chatbot chatbot);
    
    /**
     * Create a new chatbot rule with parameters
     * @param keyword Keyword to match
     * @param response Response text
     * @return Number of rows affected
     */
    int create(String keyword, String response);
    
    /**
     * Update an existing chatbot rule
     * @param chatbot Chatbot object to update
     * @return Number of rows affected
     */
    int update(Chatbot chatbot);
    
    /**
     * Update chatbot rule by ID
     * @param id Rule ID
     * @param keyword New keyword
     * @param response New response
     * @return Number of rows affected
     */
    int update(int id, String keyword, String response);
    
    /**
     * Delete a chatbot rule
     * @param id Rule ID
     * @return Number of rows affected
     */
    int delete(int id);
}

