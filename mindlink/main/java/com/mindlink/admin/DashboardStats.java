package com.mindlink.admin;

public class DashboardStats {
    // The 4 cards at the top
    private int activeUsers;
    private double avgCompletionRate;
    private int totalCompletions;
    private int feedbackReceived;

    // You can add constructors, getters, and setters
    public DashboardStats(int activeUsers, double avgCompletionRate, int totalCompletions, int feedbackReceived) {
        this.activeUsers = activeUsers;
        this.avgCompletionRate = avgCompletionRate;
        this.totalCompletions = totalCompletions;
        this.feedbackReceived = feedbackReceived;
    }

    // --- GETTERS (Required for JSP to read the data) ---
    public int getActiveUsers() { return activeUsers; }
    public double getAvgCompletionRate() { return avgCompletionRate; }
    public int getTotalCompletions() { return totalCompletions; }
    public int getFeedbackReceived() { return feedbackReceived; }
}
