package com.mindlink.student;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudentController {

    // This matches the href="${pageContext.request.contextPath}/home" in your JSP
    @GetMapping("/home")
    public String showStudentHome() {
        // Look for file in WEB-INF/student/home.jsp
        return "student/home";
    }
}
