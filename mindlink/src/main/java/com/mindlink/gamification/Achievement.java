package com.mindlink.gamification;

public class Achievement {
    private String title;
    private String description;
    private String iconPath;
    private boolean isUnlocked;
    private int currentProgress;
    private int targetValue;
    private String unlockedDate;

    public Achievement(String title, String description, String iconPath, 
                      boolean isUnlocked, int currentProgress, int targetValue) {
        this.title = title;
        this.description = description;
        this.iconPath = iconPath;
        this.isUnlocked = isUnlocked;
        this.currentProgress = currentProgress;
        this.targetValue = targetValue;
    }

    // Getters and Setters
    public String getUnlockedDate() { return unlockedDate; }
    public void setUnlockedDate(String unlockedDate) { this.unlockedDate = unlockedDate; }

    public boolean isUnlocked() { return isUnlocked; }
    public void setUnlocked(boolean unlocked) { this.isUnlocked = unlocked; } // Added this

    public void setCurrentProgress(int currentProgress) { this.currentProgress = currentProgress; } // Added this

    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getIconPath() { return iconPath; }
    public int getCurrentProgress() { return currentProgress; }
    public int getTargetValue() { return targetValue; }
    
    public int getProgressPercent() { 
        if (targetValue <= 0) return 0;
        return Math.min(100, (int) ((double) currentProgress / targetValue * 100)); 
    }
}