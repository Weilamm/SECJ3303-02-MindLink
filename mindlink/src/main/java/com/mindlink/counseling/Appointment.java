package com.mindlink.counseling;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

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
    private String notes;

    public Appointment(String id, String counselorName, String date, String time, String type, String venue) {
        this.id = id;
        this.counselorName = counselorName;
        this.date = date;
        this.time = time;
        this.type = type;
        this.venue = venue;
        this.status = "Booked"; // Default status
    }

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

    public boolean isUpcoming() {
        if (this.date == null || this.time == null) return false;
        
        if ("Cancelled".equalsIgnoreCase(this.status)) return false;
        if ("Completed".equalsIgnoreCase(this.status)) return false;

        try {

            LocalDate appDate = LocalDate.parse(this.date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));

            LocalTime appTime;
            try {
                appTime = LocalTime.parse(this.time, DateTimeFormatter.ofPattern("HH:mm"));
            } catch (DateTimeParseException e) {
                appTime = LocalTime.parse(this.time, DateTimeFormatter.ofPattern("hh:mm a"));
            }

            LocalDateTime appDateTime = LocalDateTime.of(appDate, appTime);
            return appDateTime.isAfter(LocalDateTime.now());

        } catch (Exception e) {
            try {
                LocalDate appDate = LocalDate.parse(this.date);
                return !appDate.isBefore(LocalDate.now());
            } catch (Exception ex) {
                return false;
            }
        }
    }

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

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}