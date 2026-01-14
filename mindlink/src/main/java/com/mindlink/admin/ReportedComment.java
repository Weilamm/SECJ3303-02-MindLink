package com.mindlink.admin;

public class ReportedComment {
    private String id;
    private String date;
    private String author;     // Who wrote the comment
    private String content;    // The comment text
    private String reason;     // Why it was reported
    private String status;     // "Pending", "Resolved"
    private int postId;        // The post this comment belongs to
    private String postContent; // Preview of the post content

    public ReportedComment(String id, String date, String author, String content, String reason, String status, int postId, String postContent) {
        this.id = id;
        this.date = date;
        this.author = author;
        this.content = content;
        this.reason = reason;
        this.status = status;
        this.postId = postId;
        this.postContent = postContent;
    }

    public String getId() { return id; }
    public String getDate() { return date; }
    public String getAuthor() { return author; }
    public String getContent() { return content; }
    public String getReason() { return reason; }
    public String getStatus() { return status; }
    public int getPostId() { return postId; }
    public String getPostContent() { return postContent; }
    public void setStatus(String status) { this.status = status; }
}

