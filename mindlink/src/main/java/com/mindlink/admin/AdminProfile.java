package com.mindlink.admin;

public class AdminProfile {
    private String fullName;
    private String studentId; // Or 'Admin ID'
    private int age;
    private String email;
    private String phoneNumber;
    private String faculty;

    public AdminProfile(String fullName, String studentId, int age, String email, String phoneNumber, String faculty) {
        this.fullName = fullName;
        this.studentId = studentId;
        this.age = age;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.faculty = faculty;
    }

    // Getters
    public String getFullName() { return fullName; }
    public String getStudentId() { return studentId; }
    public int getAge() { return age; }
    public String getEmail() { return email; }
    public String getPhoneNumber() { return phoneNumber; }
    public String getFaculty() { return faculty; }
}