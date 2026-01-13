package com.mindlink.counselor;

import com.mindlink.counseling.AppointmentService; 
import com.mindlink.counseling.CounselorService; 
import com.mindlink.counseling.Counselor; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession; 

@Controller
@RequestMapping("/counselor") 
public class CounselorController {

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private CounselorService counselorService;

    // --- 1. DASHBOARD ---
    @GetMapping({"/home", "/dashboard"})
    public String showDashboard(HttpSession session, Model model) {
        Counselor loggedIn = (Counselor) session.getAttribute("loggedInCounselor");
        if (loggedIn == null) {
            return "redirect:/login";
        }

        // Fetch ONLY this counselor's appointments for the dashboard
        // We pass 'null' for filters to get the basic list
        model.addAttribute("appointments", 
            appointmentService.getAppointmentsForCounselor(loggedIn.getName(), null, null));

        return "counselor/home"; 
    }

    // --- 2. APPOINTMENTS PAGE (Replaces Schedule) ---
    // Matches the Navbar link: /counselor/appointments
    @GetMapping("/appointments")
    public String showAppointments(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "status", required = false) String status,
            HttpSession session, 
            Model model) {
        
        Counselor loggedIn = (Counselor) session.getAttribute("loggedInCounselor");
        if (loggedIn == null) {
            return "redirect:/login";
        }

        // Fetch filtered list based on Counselor Name + Search + Status
        model.addAttribute("appointments", 
            appointmentService.getAppointmentsForCounselor(loggedIn.getName(), search, status));

        // Pass current filters back to JSP so inputs remain filled
        model.addAttribute("currentSearch", search);
        model.addAttribute("currentStatus", status);

        return "counselor/appointments"; 
    }

    // --- 3. VIEW PROFILE PAGE ---
    @GetMapping("/profile")
    public String showProfile(HttpSession session) {
        if (session.getAttribute("loggedInCounselor") == null) {
            return "redirect:/login";
        }
        return "counselor/profile"; 
    }

    // --- 4. HANDLE UPDATE PROFILE ---
    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute Counselor updatedCounselor, 
                                HttpSession session, 
                                RedirectAttributes redirectAttributes) {
        
        Counselor currentSessionUser = (Counselor) session.getAttribute("loggedInCounselor");
        if (currentSessionUser == null) {
            return "redirect:/login";
        }

        try {
            counselorService.updateCounselor(updatedCounselor);
            
            // Update Session so new name/photo appears immediately
            session.setAttribute("loggedInCounselor", updatedCounselor);
            
            redirectAttributes.addFlashAttribute("message", "Profile updated successfully!");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Error updating profile.");
        }

        return "redirect:/counselor/profile";
    }
}