package com.mindlink.admin;

import java.util.UUID;

public class Feedback {
    private String id;
    private String date;
    private String userId;
    private String module;
    private int rating;
    private String comment;
    private String status; // "pending" or "reviewed"
    private String adminResponse;

    public Feedback(String date, String userId, String module, int rating, String comment, String status) {
        this.id = UUID.randomUUID().toString();
        this.date = date;
        this.userId = userId;
        this.module = module;
        this.rating = rating;
        this.comment = comment;
        this.status = status;
        this.adminResponse = "";
    }

    // Getters&Setters
    public String getId() { return id; }
    public String getDate() { return date; }
    public String getUserId() { return userId; }
    public String getModule() { return module; }
    public int getRating() { return rating; }
    public String getComment() { return comment; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; } // Setter needed for Update
    public String getAdminResponse() { return adminResponse; }
    public void setAdminResponse(String adminResponse) { this.adminResponse = adminResponse; } // Setter needed for Update
}
