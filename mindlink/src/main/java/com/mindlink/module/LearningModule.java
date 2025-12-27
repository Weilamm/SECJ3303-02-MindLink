package com.mindlink.module;

import java.util.UUID;

public class LearningModule {
    private String id;
    private String title;
    private String description;
    private String imagePath; // e.g., "mental-health-intro.png"

    // Constructor for creating new modules
    public LearningModule(String title, String description, String imagePath) {
        this.id = UUID.randomUUID().toString(); // Auto-generate ID
        this.title = title;
        this.description = description;
        this.imagePath = imagePath;
    }

    // Constructor for updating existing modules
    public LearningModule(String id, String title, String description, String imagePath) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imagePath = imagePath;
    }

    public String getId() { return id; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getImagePath() { return imagePath; }
    
    // Setters needed for form binding
    public void setId(String id) { this.id = id; }
    public void setTitle(String title) { this.title = title; }
    public void setDescription(String description) { this.description = description; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}