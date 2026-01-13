package com.mindlink.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession; // Use 'javax.servlet...' if on older Spring

@Controller
@RequestMapping("/counseling")
public class CounselingController {

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private CounselorService counselorService;

    @Autowired
    private FeedbackService feedbackService;

    // Home Page 
    @GetMapping("/home") 
    public String showCounselingHome(Model model, HttpSession session) { 
        model.addAttribute("appointments", appointmentService.getUpcomingAppointments());        return "counseling/home"; 
    }

    // Booking Page
    @GetMapping("/booking")
    public String showBookingPage(
            @RequestParam(value = "preselected", required = false) String preselected,
            @RequestParam(value = "rescheduleId", required = false) String rescheduleId,
            Model model) {
        
        model.addAttribute("counselors", counselorService.getAllCounselors());

        model.addAttribute("bookedAppointments", appointmentService.getAllAppointments());
        
        if (rescheduleId != null && !rescheduleId.isEmpty()) {
            model.addAttribute("rescheduleId", rescheduleId);
            
            // Optional: Auto-select the counselor if editing
            Appointment existing = appointmentService.getAppointmentById(rescheduleId);
            if (existing != null) {
                model.addAttribute("preselectedName", existing.getCounselorName());
            }
        } else {
            // Normal booking
            model.addAttribute("preselectedName", preselected); 
        }
        
        return "counseling/booking";
    }

    // --- UPDATED: Handle Booking Submission (REAL DATABASE SAVE) ---
    @PostMapping("/booking/submit")
    public String processBooking(
            @RequestParam(value = "existingId", required = false) String existingId,
            @RequestParam("date") String date,
            @RequestParam("time") String time,
            @RequestParam("counselor") String counselor,
            @RequestParam(value = "mode", defaultValue = "Online") String mode, 
            HttpSession session, 
            Model model) {
        
        String studentId = "S23CS0123"; 
        String id;
        boolean isUpdate = (existingId != null && !existingId.isEmpty());

        if (isUpdate) {
            id = existingId; 
        } else {
            id = "BK-" + java.util.UUID.randomUUID().toString().substring(0, 6).toUpperCase(); 
        }
        
        String venue;
        if (mode.equalsIgnoreCase("Physical")) {
            venue = "Block B Room 314";
        } else {
            String cleanName = counselor.toLowerCase().replace(" ", "").replace(".", "");
            venue = "https://utm.webex.com/utm/" + cleanName;
        }

        Appointment app = new Appointment(id, counselor, date, time, mode, venue);
        app.setStudentId(studentId);
        app.setStatus("Booked"); 

        if (isUpdate) {
            appointmentService.updateAppointment(app);
        } else {
            appointmentService.saveAppointment(app);
        }

        model.addAttribute("bookingId", id);
        model.addAttribute("counselorName", counselor);
        model.addAttribute("sessionType", mode);
        model.addAttribute("venue", venue);
        model.addAttribute("date", date);
        model.addAttribute("time", time);

        return "counseling/booking_success";
    }

    // Handle Deletion of Appointment
    @GetMapping("/booking/cancel")
    public String cancelBooking(@RequestParam("id") String id) {
        appointmentService.deleteAppointment(id);
        return "redirect:/counseling/home"; 
    }

    // Browse Counselors Page
    @GetMapping("/browse")
    public String showBrowsePage(@RequestParam(value = "search", required = false) String search, 
                                 Model model) {
        if (search != null && !search.isEmpty()) {
            model.addAttribute("counselors", counselorService.searchCounselors(search));
        } else {
            model.addAttribute("counselors", counselorService.getAllCounselors());
        }
        return "counseling/browse";
    }

    // Counselor Profile Page
    @GetMapping("/counselor")
    public String showCounselorProfile(@RequestParam("id") String id, Model model) {
        Counselor c = counselorService.getCounselorById(id);
        if (c == null) return "redirect:/counseling/browse";
        model.addAttribute("c", c);
        return "counseling/profile";
    }

    // Appointment History Page
    @GetMapping("/history")
    public String showHistoryPage(Model model) {
        model.addAttribute("appointments", appointmentService.getPastAppointments());
        return "counseling/history";
    }

    // View Appointment History Details Page
    @GetMapping("/history/view")
    public String viewAppointment(@RequestParam("id") String id, Model model) {
        Appointment app = appointmentService.getAppointmentById(id);
        if (app == null) return "redirect:/counseling/history";
        model.addAttribute("app", app);
        return "counseling/appointment_details";
    }

    // Show Feedback Page
    @GetMapping("/history/feedback")
    public String showFeedbackForm(@RequestParam("id") String id, Model model) {
        model.addAttribute("bookingId", id);
        return "counseling/submit_feedback";
    }

    // Handle Feedback Submission
    @PostMapping("/history/feedback/submit")
    public String processFeedback(@RequestParam("bookingId") String id,
                                  @RequestParam("category") String category,
                                  @RequestParam("subject") String subject,
                                  @RequestParam("message") String message,
                                  @RequestParam("rating") int rating,
                                  Model model) {
        
        Feedback fb = new Feedback(id, category, subject, message, rating);
        
        feedbackService.saveFeedback(fb);

        model.addAttribute("success", true);
        model.addAttribute("bookingId", id);
        
        return "counseling/submit_feedback";
    }

    // View Existing Appointment Details (Reusing the Success Page)
    @GetMapping("/view")
    public String viewAppointmentDetails(@RequestParam("id") String id, Model model) {
        
        // 1. Fetch the specific appointment
        Appointment app = appointmentService.getAppointmentById(id);
        
        // Safety check: If not found, go back home
        if (app == null) return "redirect:/counseling/home";

        // 2. Map the data to the variable names your JSP expects
        model.addAttribute("bookingId", app.getId());
        model.addAttribute("counselorName", app.getCounselorName());
        model.addAttribute("sessionType", app.getType()); // 'type' maps to 'sessionType'
        model.addAttribute("venue", app.getVenue());
        model.addAttribute("date", app.getDate());
        model.addAttribute("time", app.getTime());

        // 3. Send to the Booking Success page
        return "counseling/booking_success";
    }
}