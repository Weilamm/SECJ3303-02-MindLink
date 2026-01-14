package com.mindlink.counselor;

import com.mindlink.counseling.Appointment;
import com.mindlink.counseling.AppointmentService; 
import com.mindlink.counseling.CounselorService; 
import com.mindlink.counseling.Counselor; 
import com.mindlink.counseling.SessionFeedbackService;
import com.mindlink.counseling.Feedback;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

    @Autowired
    private SessionFeedbackService sessionFeedbackService;

    @Qualifier("counselingFeedbackService")

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

    // --- 5. VIEW APPOINTMENT DETAILS ---
    @GetMapping("/appointment")
    public String showAppointmentDetails(@RequestParam("id") String id, HttpSession session, Model model) {
    if (session.getAttribute("loggedInCounselor") == null) {
        return "redirect:/login";
    }

    Appointment appointment = appointmentService.getAppointmentById(id);
    if (appointment == null) {
        return "redirect:/counselor/appointments";
    }

    model.addAttribute("appointment", appointment);

    Feedback feedback = sessionFeedbackService.getFeedbackByAppointmentId(id);
    model.addAttribute("feedback", feedback);

    return "counselor/appointment_details"; 
    }

    // --- 6. ADD NOTES & COMPLETING SESSION ---
    @PostMapping("/appointment/update")
    public String updateAppointmentNotes(
            @RequestParam("id") String id,
            @RequestParam("notes") String notes,
            @RequestParam(value = "action", required = false) String action,
            RedirectAttributes redirectAttributes) {
        
        boolean isComplete = "complete".equals(action);
        
        appointmentService.updateSessionNotes(id, notes, isComplete);
        
        if (isComplete) {
            redirectAttributes.addFlashAttribute("message", "Session completed successfully!");
            return "redirect:/counselor/appointments"; // Go back to list
        } else {
            redirectAttributes.addFlashAttribute("message", "Notes saved successfully.");
            return "redirect:/counselor/appointment?id=" + id; // Stay on the same page
        }
    }
}