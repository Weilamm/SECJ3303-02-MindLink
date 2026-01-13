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
    // Mapping both /home and /dashboard so your links work
    @GetMapping({"/home", "/dashboard"})
    public String showDashboard(HttpSession session, Model model) {
        if (session.getAttribute("loggedInCounselor") == null) {
            return "redirect:/login";
        }

        // Fetch all appointments
        model.addAttribute("appointments", appointmentService.getAllAppointments());

        // Returns counselor/home.jsp (or dashboard.jsp if you renamed it)
        return "counselor/home"; 
    }

    // --- 2. VIEW PROFILE PAGE ---
    @GetMapping("/profile")
    public String showProfile(HttpSession session) {
        // Security Check
        if (session.getAttribute("loggedInCounselor") == null) {
            return "redirect:/login";
        }
        // Return the JSP page for editing profile
        return "counselor/profile"; 
    }

    // --- 3. HANDLE UPDATE FORM SUBMISSION ---
    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute Counselor updatedCounselor, 
                                HttpSession session, 
                                RedirectAttributes redirectAttributes) {
        
        // Security Check
        Counselor currentSessionUser = (Counselor) session.getAttribute("loggedInCounselor");
        if (currentSessionUser == null) {
            return "redirect:/login";
        }

        try {
            // 1. Save to Database
            // You need to ensure your Service has an update method
            counselorService.updateCounselor(updatedCounselor);

            // 2. IMPORTANT: Update the Session
            // If we don't do this, the old name/photo will show until they logout & login again
            session.setAttribute("loggedInCounselor", updatedCounselor);

            // 3. Add success message
            redirectAttributes.addFlashAttribute("message", "Profile updated successfully!");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Error updating profile.");
        }

        // Redirect back to profile page to prevent duplicate submissions
        return "redirect:/counselor/profile";
    }
    
    // --- 4. SCHEDULE (Placeholder for the link in Navbar) ---
    @GetMapping("/schedule")
    public String showSchedule(HttpSession session, Model model) {
        if (session.getAttribute("loggedInCounselor") == null) { return "redirect:/login"; }
        
        // You can reuse the dashboard for now, or create a specific schedule view
        model.addAttribute("appointments", appointmentService.getAllAppointments());
        return "counselor/home"; 
    }
}