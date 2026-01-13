package com.mindlink.counseling;

public class Feedback {
    private int id;
    private String bookingId;
    private String category;
    private String subject;
    private String message;
    private int rating;

    // Constructors
    public Feedback() {}

    public Feedback(String bookingId, String category, String subject, String message, int rating) {
        this.bookingId = bookingId;
        this.category = category;
        this.subject = subject;
        this.message = message;
        this.rating = rating;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getBookingId() { return bookingId; }
    public void setBookingId(String bookingId) { this.bookingId = bookingId; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
}