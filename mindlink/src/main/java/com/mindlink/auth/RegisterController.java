package com.mindlink.auth;

import com.mindlink.usermanagement.model.Student;
import com.mindlink.usermanagement.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegisterController {

    @Autowired
    private StudentService studentService;

    // 1. Show the Registration Form
    @GetMapping("/register")
    public String showRegisterPage() {
        return "auth/register"; // Looks for WEB-INF/auth/register.jsp
    }

    // 2. Handle the Form Submission
    @PostMapping("/register/submit")
    public String processRegister(@RequestParam("studentId") String studentId,
            @RequestParam("fullname") String fullname,
            @RequestParam("email") String email,
            @RequestParam("username") String username, // Assuming username is NOT the ID but maybe a nickname?
            // Actually schema says student_id is PK, name, email. There is no 'username'
            // column in schema.sql.
            // The register.jsp has 'username'. Let's assume username input might not be
            // needed if ID is used, or mapped to something else.
            // Looking at the schema: student_id, name, email, password, phone, faculty,
            // year.
            // The register form prompts: Full Name, Email, Username, Password.
            // Let's assume we map 'studentId' (new field) -> student_id.
            // We map 'username' -> we might not store it if there's no column?
            // Wait, previous code printed "User: " + username.
            // Schema does NOT have username.
            // I will use 'studentId' as the primary identifier.
            @RequestParam("password") String password,
            RedirectAttributes redirectAttributes) {

        try {
            Student student = new Student();
            student.setStudentId(studentId);
            student.setName(fullname); // name
            student.setEmail(email);
            student.setPassword(password);
            student.setStatus("PENDING");

            // Validate ID format maybe?

            studentService.saveStudent(student);

            redirectAttributes.addFlashAttribute("success", "Registration successful. Please wait for admin approval.");
            return "redirect:/login";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Registration failed: " + e.getMessage());
            return "redirect:/register";
        }
    }
}