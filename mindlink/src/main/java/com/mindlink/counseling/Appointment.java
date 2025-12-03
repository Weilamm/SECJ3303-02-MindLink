package com.mindlink.counseling;

public class Appointment {
    private String id;
    private String counselorName;
    private String date;
    private String time;
    private String type; // Online or Physical
    private String venue;

    public Appointment(String id, String counselorName, String date, String time, String type, String venue) {
        this.id = id;
        this.counselorName = counselorName;
        this.date = date;
        this.time = time;
        this.type = type;
        this.venue = venue;
    }

    // Getters
    public String getId() { return id; }
    public String getCounselorName() { return counselorName; }
    public String getDate() { return date; }
    public String getTime() { return time; }
    public String getType() { return type; }
    public String getVenue() { return venue; }
}