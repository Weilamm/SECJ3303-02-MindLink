package com.mindlink.admin;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class ForumReportService {
    
    private List<ReportedPost> reports = new ArrayList<>();

    public ForumReportService() {
        // Mock Data
        reports.add(new ReportedPost("RPT-001", "12/06/2025", "User123", "I hate everyone here, this app is useless.", "Hate Speech", "Pending"));
        reports.add(new ReportedPost("RPT-002", "11/06/2025", "SpamBot99", "Buy cheap crypto now! Click link...", "Spam", "Pending"));
        reports.add(new ReportedPost("RPT-003", "10/06/2025", "AngryStudent", "You are stupid if you think that.", "Bullying", "Resolved"));
    }

    public List<ReportedPost> getAllReports() {
        return reports;
    }

    // Delete the post (Simulated by removing the report)
    public void deletePost(String id) {
        reports.removeIf(r -> r.getId().equals(id));
    }

    // Ignore/Dismiss the report
    public void dismissReport(String id) {
        for (ReportedPost r : reports) {
            if (r.getId().equals(id)) {
                r.setStatus("Dismissed");
            }
        }
    }
}