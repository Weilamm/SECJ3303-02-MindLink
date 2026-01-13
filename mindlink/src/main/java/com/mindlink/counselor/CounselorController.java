package com.mindlink.counselor;

import com.mindlink.counseling.AppointmentService; 
import com.mindlink.counseling.CounselorService; 
import com.mindlink.counseling.Counselor;
// Import your existing AppointmentService so you can see bookings

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession; 

@Controller
@RequestMapping("/counselor") // Base URL for staff
public class CounselorController {

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private CounselorService counselorService;

    // Counselor Dashboard
    @GetMapping("/home")
    public String showDashboard(HttpSession session, Model model) {
        
        // Security Check: Ensure it is a COUNSELOR logged in
        if (session.getAttribute("loggedInCounselor") == null) {
            return "redirect:/login";
        }

        // Fetch all appointments (In the future, filter by counselor ID)
        model.addAttribute("appointments", appointmentService.getAllAppointments());

        // This looks for: /WEB-INF/counselor/home.jsp
        return "counselor/home"; 
    }
}