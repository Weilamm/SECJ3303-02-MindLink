package com.mindlink.usermanagement.service;


import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.mindlink.usermanagement.dao.StudentDao;
import com.mindlink.usermanagement.model.Student;

@Service
public class StudentService {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Student> getAllStudents() {
        return studentDao.findAll();
    }

    public Optional<Student> getStudentById(String id) {
        return studentDao.findById(id);
    }

    public void saveStudent(Student student) {
        if (student.getStudentId() != null && !student.getStudentId().isEmpty()) {
            Student existing = studentDao.findById(student.getStudentId()).orElse(null);
            if (existing != null) {
                // Restore creation timestamp
                student.setCreatedAt(existing.getCreatedAt());
                // Update timestamp
                student.setUpdatedAt(LocalDateTime.now());

                // Handle password
                if (student.getPassword() == null || student.getPassword().isEmpty()) {
                    student.setPassword(existing.getPassword());
                }
                studentDao.update(student);
            } else {
                // Should not happen usually, but treat as new
                createStudent(student);
            }
        } else {
            createStudent(student);
        }
    }

    private void createStudent(Student student) {
        // Generate student ID in format S001, S002, etc.
        String newStudentId = generateNextStudentId();
        student.setStudentId(newStudentId);
        student.setCreatedAt(LocalDateTime.now());
        student.setUpdatedAt(LocalDateTime.now());
        // Plain text password
        studentDao.save(student);
    }

    private String generateNextStudentId() {
        // Find the highest student ID that matches pattern S###
        String sql = "SELECT MAX(CAST(SUBSTRING(student_id, 2) AS UNSIGNED)) FROM student WHERE student_id REGEXP '^S[0-9]+$'";
        try {
            Integer maxNum = jdbcTemplate.queryForObject(sql, Integer.class);
            if (maxNum == null) {
                maxNum = 0;
            }
            int nextNum = maxNum + 1;
            return String.format("S%03d", nextNum);
        } catch (Exception e) {
            // Fallback: if query fails, start from S001
            return "S001";
        }
    }

    public void deleteStudent(String id) {
        studentDao.deleteById(id);
    }
}