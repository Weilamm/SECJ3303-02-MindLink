package com.mindlink.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mindlink.usermanagement.model.Student;
import com.mindlink.usermanagement.service.StudentService;
import com.mindlink.counseling.AppointmentService;
import com.mindlink.counseling.Appointment;

import jakarta.servlet.http.HttpSession; 
import java.util.List;
import java.util.Optional;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private AppointmentService appointmentService;

    @GetMapping("/home")
    public String showStudentHome(Model model, HttpSession session) {
        Student loggedInStudent = (Student) session.getAttribute("loggedInStudent");

        if (loggedInStudent == null) {
            return "redirect:/login";
        }

        String id = loggedInStudent.getStudentId();

        List<Appointment> myAppointments = appointmentService.getAppointmentsByStudentId(id);
        
        model.addAttribute("appointments", myAppointments);

        return "student/home";
    }

    @GetMapping("/profile")
    public String showProfile(Model model, HttpSession session) {
        Student loggedInStudent = (Student) session.getAttribute("loggedInStudent");
        
        if (loggedInStudent == null) {
            return "redirect:/login";
        }

        // Fetch latest data from DB (in case they updated it recently)
        Optional<Student> studentOpt = studentService.getStudentById(loggedInStudent.getStudentId());

        if (studentOpt.isPresent()) {
            model.addAttribute("student", studentOpt.get());
        } else {
            model.addAttribute("error", "Student not found");
        }

        return "student/profile";
    }

    @GetMapping("/profile/edit")
    public String showEditProfile(Model model, HttpSession session) {
        Student loggedInStudent = (Student) session.getAttribute("loggedInStudent");
        
        if (loggedInStudent == null) {
            return "redirect:/login";
        }

        Optional<Student> studentOpt = studentService.getStudentById(loggedInStudent.getStudentId());

        if (studentOpt.isPresent()) {
            model.addAttribute("student", studentOpt.get());
        }
        return "student/profile-edit";
    }

    @PostMapping("/profile/update")
    public String updateProfile(
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            HttpSession session) {
        
        Student loggedInStudent = (Student) session.getAttribute("loggedInStudent");
        
        if (loggedInStudent == null) {
            return "redirect:/login";
        }

        String id = loggedInStudent.getStudentId(); 
        Optional<Student> studentOpt = studentService.getStudentById(id);

        if (studentOpt.isPresent()) {
            Student student = studentOpt.get();
            student.setEmail(email);
            student.setPhone(phone);
            
            studentService.saveStudent(student);
            
            session.setAttribute("loggedInStudent", student);
        }

        return "redirect:/profile";
    }
}