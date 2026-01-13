package com.mindlink.counseling;

public class Appointment {
    private String id;
    private String counselorName;
    private String date;
    private String time;
    private String type;
    private String venue;
    private String studentName;
    private String studentId;
    private String status; 

    // Constructor 1: Used by Controller when booking
    public Appointment(String id, String counselorName, String date, String time, String type, String venue) {
        this.id = id;
        this.counselorName = counselorName;
        this.date = date;
        this.time = time;
        this.type = type;
        this.venue = venue;
        this.status = "Booked"; // Default status
    }

    // Constructor 2: Used by RowMapper (Database reading)
    // We update this to include status and studentId
    public Appointment(String id, String counselorName, String date, String time, String type, String venue, String status, String studentId) {
        this.id = id;
        this.counselorName = counselorName;
        this.date = date;
        this.time = time;
        this.type = type;
        this.venue = venue;
        this.status = status;
        this.studentId = studentId;
    }

    public Appointment() {
    }

    // --- GETTERS AND SETTERS ---

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getCounselorName() { return counselorName; }
    public void setCounselorName(String counselorName) { this.counselorName = counselorName; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getVenue() { return venue; }
    public void setVenue(String venue) { this.venue = venue; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getStudentId() { return studentId; }
    public void setStudentId(String studentId) { this.studentId = studentId; }
}