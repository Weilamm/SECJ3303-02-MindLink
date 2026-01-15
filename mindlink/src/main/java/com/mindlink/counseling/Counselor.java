package com.mindlink.counseling;

public class Counselor {
    private String id;
    private String name;
    private String password; // <--- The field exists...
    private String location;
    private String education;
    private String university;
    private String languages;
    private String email;
    private String bio;
    private String quote;
    private String imageUrl;
    private String status;

    // --- 1. Empty Constructor (Required for Login to work) ---
    public Counselor() {
    }

    // --- 2. Full Constructor ---
    public Counselor(String id, String name, String password, String location, String education, String university, String languages, String email, String bio, String quote, String imageUrl) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.location = location;
        this.education = education;
        this.university = university;
        this.languages = languages;
        this.email = email;
        this.bio = bio;
        this.quote = quote;
        this.imageUrl = imageUrl;
    }

    // --- 3. GETTERS AND SETTERS (The Missing Piece) ---
    
    // Add these specifically to fix your error:
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    // Ensure all other getters/setters exist too:
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getEducation() { return education; }
    public void setEducation(String education) { this.education = education; }

    public String getUniversity() { return university; }
    public void setUniversity(String university) { this.university = university; }

    public String getLanguages() { return languages; }
    public void setLanguages(String languages) { this.languages = languages; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }

    public String getQuote() { return quote; }
    public void setQuote(String quote) { this.quote = quote; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}