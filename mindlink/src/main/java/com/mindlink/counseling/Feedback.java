package com.mindlink.counseling;

import java.sql.Timestamp;

public class Feedback {
    private String id;
    private String bookingId;
    private String category;
    private String subject;
    private String message;
    private int rating;
    private Timestamp createdAt;
    private String adminReply; 

    // Constructor used for saving (no ID/Time/Reply yet)
    public Feedback(String bookingId, String category, String subject, String message, int rating) {
        this.bookingId = bookingId;
        this.category = category;
        this.subject = subject;
        this.message = message;
        this.rating = rating;
    }

    // Constructor used for reading from DB (includes everything)
    public Feedback(String id, String bookingId, String category, String subject, String message, int rating, Timestamp createdAt, String adminReply) {
        this.id = id;
        this.bookingId = bookingId;
        this.category = category;
        this.subject = subject;
        this.message = message;
        this.rating = rating;
        this.createdAt = createdAt;
        this.adminReply = adminReply;
    }

    // Getters and Setters
    public String getId() { return id; }
    public String getBookingId() { return bookingId; }
    public String getCategory() { return category; }
    public String getSubject() { return subject; }
    public String getMessage() { return message; }
    public int getRating() { return rating; }
    public Timestamp getCreatedAt() { return createdAt; }
    public String getAdminReply() { return adminReply; }
    public void setAdminReply(String adminReply) { this.adminReply = adminReply; }
}