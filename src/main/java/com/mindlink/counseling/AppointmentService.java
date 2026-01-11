package com.mindlink.counseling;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class AppointmentService {
    
    private List<Appointment> appointments = new ArrayList<>();

    // CONSTRUCTOR: Pre-load the history data matching your screenshot
    public AppointmentService() {
        // 1. Future appointment (June)
        appointments.add(new Appointment("BK20250610-045", "Ms Nur Alya", "Saturday, 10 June 2025", "12.30PM", "Physical", "Block B Room 314"));
        
        // 2. Past appointment (March)
        appointments.add(new Appointment("BK20250312-034", "Mr. Ryan Lin", "Wednesday, 12 March 2025", "10.00AM", "Online", "Google Meet"));
        
        // 3. Past appointment (February)
        appointments.add(new Appointment("BK20250228-055", "Ms. Cindy Leong", "Friday, 28 February 2025", "02.00PM", "Physical", "Block A Room 217"));
    }

    public void addAppointment(Appointment app) {
        // Add new appointments to the TOP of the list (index 0)
        appointments.add(0, app);
    }

    public void deleteAppointment(String id) {
        appointments.removeIf(app -> app.getId().equals(id));
    }

    public List<Appointment> getAllAppointments() {
        return appointments;
    }
    
    // Helper to find specific appointment for the "View" button
    public Appointment getAppointmentById(String id) {
        return appointments.stream()
                .filter(a -> a.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
}