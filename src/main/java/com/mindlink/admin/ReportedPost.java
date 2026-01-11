package com.mindlink.admin;

public class ReportedPost {
    private String id;
    private String date;
    private String author;     // Who wrote the bad post
    private String content;    // The post text
    private String reason;     // Why it was reported (e.g., "Spam", "Bullying")
    private String status;     // "Pending", "Resolved"

    public ReportedPost(String id, String date, String author, String content, String reason, String status) {
        this.id = id;
        this.date = date;
        this.author = author;
        this.content = content;
        this.reason = reason;
        this.status = status;
    }

    public String getId() { return id; }
    public String getDate() { return date; }
    public String getAuthor() { return author; }
    public String getContent() { return content; }
    public String getReason() { return reason; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}