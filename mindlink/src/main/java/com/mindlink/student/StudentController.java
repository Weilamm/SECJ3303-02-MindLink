package com.mindlink.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mindlink.usermanagement.model.Student;
import com.mindlink.usermanagement.service.StudentService;

import java.util.Optional;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    // Helper to simulate session
    private String getStudentId() {
        return "S001";
    }

    @GetMapping("/home")
    public String showStudentHome() {
        return "student/home";
    }

    // Profile Page
    @GetMapping("/profile")
    public String showProfile(Model model) {
        String id = getStudentId();
        Optional<Student> studentOpt = studentService.getStudentById(id);

        if (studentOpt.isPresent()) {
            model.addAttribute("student", studentOpt.get());
        } else {
            // Handle case where user not found
            model.addAttribute("error", "Student not found");
        }

        return "student/profile";
    }

    @GetMapping("/profile/edit")
    public String showEditProfile(Model model) {
        String id = getStudentId();
        Optional<Student> studentOpt = studentService.getStudentById(id);

        if (studentOpt.isPresent()) {
            model.addAttribute("student", studentOpt.get());
        }
        return "student/profile-edit";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@RequestParam("email") String email,
            @RequestParam("phone") String phone) {
        String id = getStudentId();
        Optional<Student> studentOpt = studentService.getStudentById(id);

        if (studentOpt.isPresent()) {
            Student student = studentOpt.get();
            // Only allow updating email and phone
            student.setEmail(email);
            student.setPhone(phone);
            studentService.saveStudent(student);
        }

        return "redirect:/profile";
    }
}