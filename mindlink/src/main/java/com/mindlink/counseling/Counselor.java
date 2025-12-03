package com.mindlink.counseling;

public class Counselor {
    private String id; // Unique ID for links
    private String name;
    private String location;
    private String education;
    private String university;
    private String languages;
    private String email;
    private String bio;
    private String quote;
    private String imageUrl; // Placeholder for now

    public Counselor(String id, String name, String location, String education, String university, 
                     String languages, String email, String bio, String quote, String imageUrl) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.education = education;
        this.university = university;
        this.languages = languages;
        this.email = email;
        this.bio = bio;
        this.quote = quote;
        this.imageUrl = imageUrl;
    }

    // Getters
    public String getId() { return id; }
    public String getName() { return name; }
    public String getLocation() { return location; }
    public String getEducation() { return education; }
    public String getUniversity() { return university; }
    public String getLanguages() { return languages; }
    public String getEmail() { return email; }
    public String getBio() { return bio; }
    public String getQuote() { return quote; }
    public String getImageUrl() { return imageUrl; }
}