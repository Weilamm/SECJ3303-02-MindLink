package com.mindlink.admin;

public class AdminProfile {
    private String adminId;    // Matches DB column: admin_id
    private String name;       // Matches DB column: name
    private String email;      // Matches DB column: email
    private String password;   // Matches DB column: password
    private String phone;      // Matches DB column: phone
    private String department; // Matches DB column: department (was 'faculty')
    private String role;       // Matches DB column: role

    // Default Constructor (Needed for Spring)
    public AdminProfile() {}

    // Constructor with fields
    public AdminProfile(String adminId, String name, String email, String password, String phone, String department, String role) {
        this.adminId = adminId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.department = department;
        this.role = role;
    }

    // --- Getters and Setters ---
    
    public String getAdminId() { return adminId; }
    public void setAdminId(String adminId) { this.adminId = adminId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}