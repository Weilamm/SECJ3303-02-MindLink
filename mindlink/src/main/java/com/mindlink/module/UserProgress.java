package com.mindlink.module;

import java.time.LocalDateTime;

public class UserProgress {
    private int progressId;
    private String studentId;
    private int moduleId;
    private int questionId;
    private LocalDateTime completedAt;

    public UserProgress() {
    }

    public UserProgress(String studentId, int moduleId, int questionId) {
        this.studentId = studentId;
        this.moduleId = moduleId;
        this.questionId = questionId;
        this.completedAt = LocalDateTime.now();
    }

    // Getters and Setters
    public int getProgressId() {
        return progressId;
    }

    public void setProgressId(int progressId) {
        this.progressId = progressId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getModuleId() {
        return moduleId;
    }

    public void setModuleId(int moduleId) {
        this.moduleId = moduleId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public LocalDateTime getCompletedAt() {
        return completedAt;
    }

    public void setCompletedAt(LocalDateTime completedAt) {
        this.completedAt = completedAt;
    }
}
