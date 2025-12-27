package com.mindlink.student;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudentController {

    @GetMapping("/home")
    public String showStudentHome() {
        return "student/home";
    }

    //Profile Page
    @GetMapping("/profile")
    public String showProfile(Model model) {
        // Mock data matching your screenshot
        StudentProfile profile = new StudentProfile(
            "Karen Voon", 
            "A23CS0111", 
            21, 
            "a@graduate.utm.my", 
            "+60123456789", 
            "Faculty of Computing"
        );
        
        model.addAttribute("p", profile);
        return "student/profile"; // Looks for WEB-INF/student/profile.jsp
    }
}