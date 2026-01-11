package com.mindlink.assistant.service;

import com.mindlink.assistant.dao.ChatbotDAO;
import com.mindlink.assistant.model.Chatbot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Service Layer for Chatbot Module
 * Uses DAO pattern for data access - delegates to DAO implementations
 */
@Service
public class ChatbotService {

    @Autowired
    private ChatbotDAO chatbotDAO;

    /**
     * Get response based on user input using keyword matching
     * This is a rule-based system - searches for keywords in the database
     * Checks if any keyword from the database appears in the user input
     */
    public String getResponse(String userInput) {
        if (userInput == null || userInput.trim().isEmpty()) {
            return "I'm here to help! Please ask me a question.";
        }

        String input = userInput.toLowerCase().trim();

        // Get all chatbot rules from database, sorted by length (longest first)
        // This prioritizes more specific keyword matches
        List<Chatbot> allRules = chatbotDAO.findAllByKeywordLength();
        
        // Check each keyword to see if it appears in user input
        for (Chatbot rule : allRules) {
            String keyword = rule.getKeyword().toLowerCase().trim();
            if (input.contains(keyword)) {
                return rule.getResponse();
            }
        }

        // Default response if no keyword matches
        return "I understand you're looking for help. Could you rephrase your question? " +
               "You can ask me about stress, anxiety, mental health tips, or counseling services.";
    }

    /**
     * Get all chatbot rules (for admin purposes)
     */
    public List<Chatbot> getAllChatbotRules() {
        return chatbotDAO.findAll();
    }

    /**
     * Get chatbot rule by ID
     */
    public Chatbot getChatbotRuleById(int id) {
        return chatbotDAO.findById(id);
    }

    /**
     * Add a new chatbot rule
     */
    public void addChatbotRule(String keyword, String response) {
        chatbotDAO.create(keyword, response);
    }

    /**
     * Update a chatbot rule
     */
    public void updateChatbotRule(int id, String keyword, String response) {
        chatbotDAO.update(id, keyword, response);
    }

    /**
     * Delete a chatbot rule
     */
    public void deleteChatbotRule(int id) {
        chatbotDAO.delete(id);
    }
}
