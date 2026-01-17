package com.mindlink.counseling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mindlink.usermanagement.model.Student; // Import Student Model

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/counseling")
public class CounselingController {

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private CounselorService counselorService;

    @Autowired
    private SessionFeedbackService sessionFeedbackService;

    @GetMapping("/home") 
    public String showCounselingHome(Model model, HttpSession session) { 
        // 1. Get Logged-in Student
        Object studentObj = session.getAttribute("loggedInStudent");
        if (studentObj == null) return "redirect:/login";

        String studentId = getStudentId(studentObj);

        List<Appointment> myApps = appointmentService.getAppointmentsByStudentId(studentId);

        List<Appointment> upcoming = new ArrayList<>();
        for (Appointment app : myApps) {
            if (app.isUpcoming()) {
                upcoming.add(app);
            }
        }

        model.addAttribute("appointments", upcoming);
        return "counseling/home"; 
    }

    @GetMapping("/booking")
    public String showBookingPage(
            @RequestParam(value = "preselected", required = false) String preselected,
            @RequestParam(value = "rescheduleId", required = false) String rescheduleId,
            Model model) {
        
        model.addAttribute("counselors", counselorService.getAllCounselors());
        
        model.addAttribute("bookedAppointments", appointmentService.getAllAppointments());
        
        if (rescheduleId != null && !rescheduleId.isEmpty()) {
            model.addAttribute("rescheduleId", rescheduleId);
            Appointment existing = appointmentService.getAppointmentById(rescheduleId);
            if (existing != null) {
                model.addAttribute("preselectedName", existing.getCounselorName());
            }
        } else {
            model.addAttribute("preselectedName", preselected); 
        }
        
        return "counseling/booking";
    }

    @SuppressWarnings("unchecked") 
    @PostMapping("/booking/submit")
    public String processBooking(
            @RequestParam(value = "existingId", required = false) String existingId,
            @RequestParam("date") String date,
            @RequestParam("time") String time,
            @RequestParam("counselor") String counselorName,
            @RequestParam(value = "mode", defaultValue = "Online") String mode,
            HttpSession session,
            Model model) {
        
        Object studentObj = session.getAttribute("loggedInStudent");
        if (studentObj == null) return "redirect:/login";
        
        String studentId = getStudentId(studentObj);

        String venue;
        if (mode.equalsIgnoreCase("Physical")) {
            venue = "Block B Room 314";
        } else {
            String cleanName = counselorName.toLowerCase().replace(" ", "").replace(".", "");
            venue = "https://utm.webex.com/utm/" + cleanName;
        }

        Appointment app = new Appointment();
        app.setStudentId(studentId);
        app.setCounselorName(counselorName);
        app.setDate(date);
        app.setTime(time);
        app.setType(mode);
        app.setVenue(venue);

        if (existingId != null && !existingId.isEmpty()) {
            app.setId(existingId);
            app.setStatus("Rescheduled");
            appointmentService.rescheduleAppointment(app); 
        } else {
            app.setStatus("Booked");
            appointmentService.bookAppointment(app); 
        }

        model.addAttribute("bookingId", app.getId()); 
        model.addAttribute("counselorName", counselorName);
        model.addAttribute("sessionType", mode);
        model.addAttribute("venue", venue);
        model.addAttribute("date", date);
        model.addAttribute("time", time);

        return "counseling/booking_success";
    }

    @GetMapping("/booking/cancel")
    public String cancelBooking(@RequestParam("id") String id) {
        appointmentService.deleteAppointment(id);
        return "redirect:/counseling/home";
    }

    @GetMapping("/browse")
    public String showBrowsePage(@RequestParam(value = "search", required = false) String search, Model model) {
        if (search != null && !search.isEmpty()) {
            model.addAttribute("counselors", counselorService.searchCounselors(search));
        } else {
            model.addAttribute("counselors", counselorService.getAllCounselors());
        }
        return "counseling/browse";
    }

    @GetMapping("/counselor")
    public String showCounselorProfile(@RequestParam("id") String id, Model model) {
        Counselor c = counselorService.getCounselorById(id);
        if (c == null) return "redirect:/counseling/browse";
        model.addAttribute("c", c);
        return "counseling/profile";
    }

    @GetMapping("/history")
    public String showHistoryPage(Model model, HttpSession session) {
        Object studentObj = session.getAttribute("loggedInStudent");
        if (studentObj == null) return "redirect:/login";

        String studentId = getStudentId(studentObj);

        List<Appointment> myApps = appointmentService.getAppointmentsByStudentId(studentId);

        List<Appointment> past = new ArrayList<>();
        for (Appointment app : myApps) {
            if (!app.isUpcoming()) {
                past.add(app);
            }
        }

        model.addAttribute("appointments", past);
        return "counseling/history";
    }

    @GetMapping("/history/view")
    public String viewAppointment(@RequestParam("id") String id, Model model) {
        Appointment app = appointmentService.getAppointmentById(id);
        if (app == null) return "redirect:/counseling/history";
        model.addAttribute("app", app);

        Feedback fb = sessionFeedbackService.getFeedbackByAppointmentId(id);
        model.addAttribute("feedback", fb);

        return "counseling/appointment_details";
    }

    @GetMapping("/history/feedback")
    public String showFeedbackForm(@RequestParam("id") String id, Model model) {
        model.addAttribute("bookingId", id);
        return "counseling/submit_feedback";
    }

    @PostMapping("/history/feedback/submit")
    public String processFeedback(@RequestParam("bookingId") String id,
            @RequestParam("category") String category,
            @RequestParam("subject") String subject,
            @RequestParam("message") String message,
            @RequestParam("rating") int rating,
            Model model) {

        Feedback fb = new Feedback(id, category, subject, message, rating);
        sessionFeedbackService.saveFeedback(fb);

        model.addAttribute("success", true);
        model.addAttribute("bookingId", id);
        return "counseling/submit_feedback";
    }

    @GetMapping("/view")
    public String viewAppointmentDetails(@RequestParam("id") String id, Model model) {
        Appointment app = appointmentService.getAppointmentById(id);
        if (app == null) return "redirect:/counseling/home";

        model.addAttribute("bookingId", app.getId());
        model.addAttribute("counselorName", app.getCounselorName());
        model.addAttribute("sessionType", app.getType()); 
        model.addAttribute("venue", app.getVenue());
        model.addAttribute("date", app.getDate());
        model.addAttribute("time", app.getTime());

        return "counseling/booking_success";
    }

    private String getStudentId(Object studentObj) {
        if (studentObj instanceof Student) {
            return ((Student) studentObj).getStudentId();
        } else if (studentObj instanceof Map) {
            return (String) ((Map<?, ?>) studentObj).get("student_id");
        }
        return null;
    }
}