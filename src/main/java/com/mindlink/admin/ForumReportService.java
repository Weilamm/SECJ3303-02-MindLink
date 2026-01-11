package com.mindlink.admin;

import com.mindlink.forum.dao.ForumPostDAO;
import com.mindlink.forum.model.ForumPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class ForumReportService {
    
    @Autowired
    private ForumPostDAO forumPostDAO;

    /**
     * Get all reported posts from database
     * Converts ForumPost to ReportedPost for display
     */
    public List<ReportedPost> getAllReports() {
        List<ForumPost> reportedPosts = forumPostDAO.findReportedPosts();
        List<ReportedPost> reports = new ArrayList<>();
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        
        for (ForumPost post : reportedPosts) {
            // Create ReportedPost from ForumPost
            // Using post ID as report ID, and default reason as "Reported" (can be enhanced later)
            String date = post.getCreatedAt() != null ? post.getCreatedAt().format(formatter) : "N/A";
            String status = "Pending"; // All reported posts are pending until admin action
            
            ReportedPost report = new ReportedPost(
                String.valueOf(post.getId()),
                date,
                post.getUserName() + " (" + post.getUserId() + ")",
                post.getContent(),
                "Reported", // Default reason - can be enhanced to store actual reason
                status
            );
            reports.add(report);
        }
        
        return reports;
    }

    /**
     * Delete the post (removes from database)
     */
    public void deletePost(String id) {
        try {
            int postId = Integer.parseInt(id);
            forumPostDAO.delete(postId);
        } catch (NumberFormatException e) {
            // Invalid ID, ignore
        }
    }

    /**
     * Dismiss the report - change status back to normal
     */
    public void dismissReport(String id) {
        try {
            int postId = Integer.parseInt(id);
            forumPostDAO.updateStatus(postId, "normal");
        } catch (NumberFormatException e) {
            // Invalid ID, ignore
        }
    }
}
