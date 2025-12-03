package com.mindlink.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/counseling")
public class CounselingController {

    @Autowired
    private AppointmentService appointmentService;
    private CounselorService counselorService;

    // Home Page
    @GetMapping("")
    public String showCounselingHome(Model model) {
        model.addAttribute("appointments", appointmentService.getAllAppointments()); //List of appointments
        return "counseling/home"; 
    }

    // Booking Page
    @GetMapping("/booking")
    public String showBookingPage() {
        return "counseling/booking";
    }

    // Handle Booking Submission
    @PostMapping("/booking/submit")
    public String processBooking(@RequestParam(value = "mode", defaultValue = "Online") String mode, 
                                 Model model) {
        
        // 1. Generate a RANDOM Unique ID (so we can target it for deletion later)
        String id = "BK-" + java.util.UUID.randomUUID().toString().substring(0, 6).toUpperCase();
        
        String counselor = "Ms Nur Alya";
        String date = "Saturday, 10 June 2025";
        String time = "12.30PM";
        String type = mode.substring(0, 1).toUpperCase() + mode.substring(1);
        String venue = mode.equalsIgnoreCase("physical") ? "Block B Room 314" : "Google Meet Link";

        Appointment newApp = new Appointment(id, counselor, date, time, type, venue);
        appointmentService.addAppointment(newApp);

        model.addAttribute("bookingId", id);
        model.addAttribute("counselorName", counselor);
        model.addAttribute("sessionType", type);
        model.addAttribute("venue", venue);
        model.addAttribute("date", date);
        model.addAttribute("time", time);

        return "counseling/booking_success";
    }

    // Handle Deletion of Appointment
    @GetMapping("/booking/cancel")
    public String cancelBooking(@RequestParam("id") String id) {
        // Remove the appointment we just created
        appointmentService.deleteAppointment(id);
        
        // Go back to the Counseling Home Page
        return "redirect:/counseling";
    }

    // Browse Counselors Page
    @GetMapping("/browse")
    public String showBrowsePage(@RequestParam(value = "search", required = false) String search, 
                                 Model model) {
        // If there is a search term, filter the list. Otherwise, show all.
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
        
        // Safety check: if ID is wrong, go back to browse
        if (c == null) return "redirect:/counseling/browse";
        
        model.addAttribute("c", c);
        return "counseling/profile";
    }

    //Appointment History Page
    @GetMapping("/history")
    public String showHistoryPage(Model model) {
        model.addAttribute("appointments", appointmentService.getAllAppointments());
        return "counseling/history";
    }

    //View Appointment History Details Page
    @GetMapping("/history/view")
    public String viewAppointment(@RequestParam("id") String id, Model model) {
        
        // 1. Find the appointment from the service
        Appointment app = appointmentService.getAppointmentById(id);
        
        // Safety check
        if (app == null) return "redirect:/counseling/history";

        // 2. Pass data to the view
        model.addAttribute("app", app);
        
        return "counseling/appointment_details";
    }

    //Show Feedback Page
    @GetMapping("/history/feedback")
    public String showFeedbackForm(@RequestParam("id") String id, Model model) {
        // We pass the ID to the form so we know which booking we are rating
        model.addAttribute("bookingId", id);
        return "counseling/submit_feedback";
    }

    // Handle Feedback Submission
    @PostMapping("/history/feedback/submit")
    public String processFeedback(@RequestParam("bookingId") String id,
                                  @RequestParam("category") String category,
                                  @RequestParam("message") String message,
                                  Model model) {
        
        // Logic to save feedback would go here...
        System.out.println("Feedback received for: " + id);

        // Instead of redirecting, we stay on the page and send a "Success" flag
        model.addAttribute("success", true);
        model.addAttribute("bookingId", id); // Keep the ID so the form doesn't break
        
        return "counseling/submit_feedback";
    }
}