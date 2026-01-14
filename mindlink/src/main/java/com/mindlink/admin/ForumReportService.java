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
            String date = post.getCreatedAt() != null ? post.getCreatedAt().format(formatter) : "N/A";
            String status = "Pending"; // All reported posts are pending until admin action
            
            // Get display name - admins always see real names, even for anonymous posts
            String displayName = post.getUserName() + " (" + post.getUserId() + ")";
            if (post.isAnonymous()) {
                displayName += " [Anonymous to users]";
            }
            
            // Get report reason from database, or default message
            String reportReason = (post.getReportReason() != null && !post.getReportReason().trim().isEmpty()) 
                ? post.getReportReason() 
                : "No reason provided";
            
            ReportedPost report = new ReportedPost(
                String.valueOf(post.getId()),
                date,
                displayName,
                post.getContent(),
                reportReason,
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
     * Dismiss the report - change status back to normal and clear report reason
     */
    public void dismissReport(String id) {
        try {
            int postId = Integer.parseInt(id);
            forumPostDAO.updateStatusWithReason(postId, "normal", null);
        } catch (NumberFormatException e) {
            // Invalid ID, ignore
        }
    }
}
