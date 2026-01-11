package com.mindlink.forum.model;

import java.time.LocalDateTime;

public class ForumPost {
    private int id;
    private int forumId;
    private String userId;
    private String userName;
    private String content;
    private String status; // 'normal' or 'reported'
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public ForumPost() {
    }

    public ForumPost(int id, int forumId, String userId, String userName, String content, String status, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.forumId = forumId;
        this.userId = userId;
        this.userName = userName;
        this.content = content;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public ForumPost(int forumId, String userId, String userName, String content) {
        this.forumId = forumId;
        this.userId = userId;
        this.userName = userName;
        this.content = content;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getForumId() {
        return forumId;
    }

    public void setForumId(int forumId) {
        this.forumId = forumId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

