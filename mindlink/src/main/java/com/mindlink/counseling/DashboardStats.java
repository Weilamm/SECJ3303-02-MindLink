package com.mindlink.counseling;

public class DashboardStats {
    private int totalCompletions;
    private double avgCompletionRate;
    private int feedbackReceived;
    private int activeUsers;

    public DashboardStats(int totalCompletions, double avgCompletionRate, int feedbackReceived, int activeUsers) {
        this.totalCompletions = totalCompletions;
        this.avgCompletionRate = avgCompletionRate;
        this.feedbackReceived = feedbackReceived;
        this.activeUsers = activeUsers;
    }

    // Getters
    public int getTotalCompletions() { return totalCompletions; }
    public double getAvgCompletionRate() { return avgCompletionRate; }
    public int getFeedbackReceived() { return feedbackReceived; }
    public int getActiveUsers() { return activeUsers; }
}