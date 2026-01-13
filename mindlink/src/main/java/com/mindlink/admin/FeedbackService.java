package com.mindlink.admin;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service("adminFeedbackService")
public class FeedbackService {
    
    // This list acts as your "Temporary Database"
    private List<Feedback> feedbackList = new ArrayList<>();

    // CONSTRUCTOR: This runs ONCE when the server starts
    public FeedbackService() {
        // We add your specific mock data here. 
        // Because this runs once, the IDs generated here stay the same until you restart.
        
        feedbackList.add(new Feedback("11/7/2025", "STU-2024-1523", "Stress Management", 5, "The breathing exercises really helped during exam week.", "pending"));
        feedbackList.add(new Feedback("11/7/2025", "STU-2024-3421", "Anxiety Support", 4, "Good content overall, but some videos were too long.", "pending"));
        feedbackList.add(new Feedback("11/6/2025", "STU-2024-5672", "Sleep Hygiene", 2, "The app crashed twice while I was in the middle of a module.", "pending"));
        feedbackList.add(new Feedback("11/6/2025", "STU-2024-8934", "Mindfulness", 5, "Absolutely loved the guided meditations! The 5-minute sessions are perfect.", "reviewed"));
        feedbackList.add(new Feedback("11/5/2025", "STU-2024-2156", "Academic Pressure", 3, "Decent content but feels too generic.", "pending"));
    }

    // READ
    public List<Feedback> getAllFeedback() {
        return feedbackList;
    }

    // UPDATE
    public void reviewFeedback(String id, String response) {
        System.out.println("DEBUG: Service is searching for ID: " + id);
        
        for (Feedback f : feedbackList) {
            System.out.println("DEBUG: Checking against Item ID: " + f.getId());
            
            if (f.getId().equals(id)) {
                System.out.println("DEBUG: MATCH FOUND! Updating status to 'reviewed'...");
                f.setAdminResponse(response);
                f.setStatus("reviewed"); // <--- This changes the text/color
                return; 
            }
        }
        System.out.println("DEBUG: NO MATCH FOUND. Nothing was updated.");
    }

    // DELETE
    public void deleteFeedback(String id) {
        feedbackList.removeIf(f -> f.getId().equals(id));
    }
}