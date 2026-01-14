package com.mindlink.admin;

public class AdminProfile {
    private String adminId;
    private String name;
    private String email;
    private String phone;
    private String department;
    private String role;

    // Default constructor
    public AdminProfile() {
    }

    // Constructor with all fields
    public AdminProfile(String adminId, String name, String email, String phone, String department, String role) {
        this.adminId = adminId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.department = department;
        this.role = role;
    }

    // Getters and Setters
    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    // Backward compatibility methods for JSP
    public String getFullName() {
        return name;
    }

    public String getStudentId() {
        return adminId;
    }

    public String getPhoneNumber() {
        return phone;
    }

    public String getFaculty() {
        return department;
    }
}