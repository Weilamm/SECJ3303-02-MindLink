package com.mindlink.admin;

import com.mindlink.forum.dao.ForumCommentDAO;
import com.mindlink.forum.dao.ForumPostDAO;
import com.mindlink.forum.model.ForumComment;
import com.mindlink.forum.model.ForumPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class ForumCommentReportService {
    
    @Autowired
    private ForumCommentDAO forumCommentDAO;

    @Autowired
    private ForumPostDAO forumPostDAO;

    /**
     * Get all reported comments from database
     * Converts ForumComment to ReportedComment for display
     */
    public List<ReportedComment> getAllReportedComments() {
        List<ForumComment> reportedComments = forumCommentDAO.findReportedComments();
        List<ReportedComment> reports = new ArrayList<>();
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        
        for (ForumComment comment : reportedComments) {
            // Create ReportedComment from ForumComment
            String date = comment.getCreatedAt() != null ? comment.getCreatedAt().format(formatter) : "N/A";
            String status = "Pending"; // All reported comments are pending until admin action
            
            // Get display name - admins always see real names, even for anonymous comments
            String displayName = comment.getUserName() + " (" + comment.getUserId() + ")";
            if (comment.getStatus() != null && comment.getStatus().equals("reported")) {
                // Check if anonymous (we'll need to add this field to ForumComment if not present)
                // For now, just show the name
            }
            
            // Get report reason from database, or default message
            String reportReason = (comment.getReportReason() != null && !comment.getReportReason().trim().isEmpty()) 
                ? comment.getReportReason() 
                : "No reason provided";
            
            // Get post content for context
            ForumPost post = forumPostDAO.findById(comment.getPostId());
            String postContent = post != null ? (post.getContent().length() > 100 ? post.getContent().substring(0, 100) + "..." : post.getContent()) : "Post not found";
            
            ReportedComment report = new ReportedComment(
                String.valueOf(comment.getId()),
                date,
                displayName,
                comment.getContent(),
                reportReason,
                status,
                comment.getPostId(),
                postContent
            );
            reports.add(report);
        }
        
        return reports;
    }

    /**
     * Delete the comment (removes from database)
     */
    public void deleteComment(String id) {
        try {
            int commentId = Integer.parseInt(id);
            forumCommentDAO.delete(commentId);
        } catch (NumberFormatException e) {
            // Invalid ID, ignore
        }
    }

    /**
     * Dismiss the report - change status back to normal and clear report reason
     */
    public void dismissCommentReport(String id) {
        try {
            int commentId = Integer.parseInt(id);
            forumCommentDAO.updateStatusWithReason(commentId, "normal", null);
        } catch (NumberFormatException e) {
            // Invalid ID, ignore
        }
    }
}

