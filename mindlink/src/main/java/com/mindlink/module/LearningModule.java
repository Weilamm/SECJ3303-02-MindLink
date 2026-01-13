package com.mindlink.module;

import java.time.LocalDateTime;
import java.util.List;

public class LearningModule {
    private int moduleId;
    private String title;
    private String description;
    private String imagePath;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private List<ModuleQuestion> questions;

    public LearningModule() {
    }

    // Getters and Setters
    public int getModuleId() {
        return moduleId;
    }

    public void setModuleId(int moduleId) {
        this.moduleId = moduleId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public List<ModuleQuestion> getQuestions() {
        return questions;
    }

    public void setQuestions(List<ModuleQuestion> questions) {
        this.questions = questions;
    }

    // For backward compatibility with existing code
    public String getId() {
        return String.valueOf(moduleId);
    }

    public void setId(String id) {
        try {
            this.moduleId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            // Ignore if not a number
        }
    }
}