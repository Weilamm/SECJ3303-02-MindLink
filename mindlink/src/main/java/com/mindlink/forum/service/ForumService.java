package com.mindlink.forum.service;

import com.mindlink.forum.dao.ForumDAO;
import com.mindlink.forum.dao.ForumPostDAO;
import com.mindlink.forum.dao.ForumCommentDAO;
import com.mindlink.forum.model.Forum;
import com.mindlink.forum.model.ForumPost;
import com.mindlink.forum.model.ForumComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Service Layer for Forum Module
 * Uses DAO pattern for data access - delegates to DAO implementations
 */
@Service
public class ForumService {

    @Autowired
    private ForumDAO forumDAO;
    
    @Autowired
    private ForumPostDAO forumPostDAO;
    
    @Autowired
    private ForumCommentDAO forumCommentDAO;

    /**
     * Get all active forums
     */
    public List<Forum> getAllForums() {
        return forumDAO.findAll();
    }

    /**
     * Get all forums (including closed and archived)
     */
    public List<Forum> getAllForumsIncludingClosed() {
        return forumDAO.findAllIncludingClosed();
    }

    /**
     * Get forum by ID
     */
    public Forum getForumById(int id) {
        return forumDAO.findById(id);
    }

    /**
     * Create a new forum
     */
    public int createForum(String title, String description, String createdBy) {
        return forumDAO.create(title, description, createdBy);
    }

    /**
     * Update forum
     */
    public void updateForum(int id, String title, String description) {
        forumDAO.update(id, title, description);
    }

    /**
     * Delete forum (soft delete by setting status)
     */
    public void deleteForum(int id) {
        forumDAO.delete(id);
    }

    /**
     * Get all posts for a specific forum
     */
    public List<ForumPost> getPostsByForumId(int forumId) {
        return forumPostDAO.findByForumId(forumId);
    }

    /**
     * Get post by ID
     */
    public ForumPost getPostById(int id) {
        return forumPostDAO.findById(id);
    }

    /**
     * Add a new post to a forum
     */
    public int addPost(int forumId, String userId, String userName, String content) {
        return forumPostDAO.create(forumId, userId, userName, content);
    }
    
    /**
     * Add a new post to a forum with anonymous flag
     */
    public int addPost(int forumId, String userId, String userName, String content, boolean isAnonymous) {
        // If anonymous, still store real user info but display as "Anonymous"
        return forumPostDAO.create(forumId, userId, userName, content, isAnonymous);
    }
    
    /**
     * Update post status with report reason
     */
    public void updatePostStatusWithReason(int id, String status, String reportReason) {
        forumPostDAO.updateStatusWithReason(id, status, reportReason);
    }

    /**
     * Update a post
     */
    public void updatePost(int id, String content) {
        forumPostDAO.update(id, content);
    }

    /**
     * Delete a post
     */
    public void deletePost(int id) {
        forumPostDAO.delete(id);
    }

    /**
     * Get post count for a forum
     */
    public int getPostCount(int forumId) {
        return forumPostDAO.countByForumId(forumId);
    }

    /**
     * Get all comments for a specific post
     */
    public List<ForumComment> getCommentsByPostId(int postId) {
        return forumCommentDAO.findByPostId(postId);
    }

    /**
     * Get comment by ID
     */
    public ForumComment getCommentById(int id) {
        return forumCommentDAO.findById(id);
    }

    /**
     * Add a new comment to a post
     */
    public int addComment(int postId, String userId, String userName, String content) {
        return forumCommentDAO.create(postId, userId, userName, content);
    }

    /**
     * Update a comment
     */
    public void updateComment(int id, String content) {
        forumCommentDAO.update(id, content);
    }

    /**
     * Delete a comment
     */
    public void deleteComment(int id) {
        forumCommentDAO.delete(id);
    }

    /**
     * Get comment count for a post
     */
    public int getCommentCount(int postId) {
        return forumCommentDAO.countByPostId(postId);
    }

    /**
     * Update post status (e.g., mark as reported)
     */
    public void updatePostStatus(int id, String status) {
        forumPostDAO.updateStatus(id, status);
    }

    /**
     * Update comment status and report reason
     */
    public void updateCommentStatusWithReason(int id, String status, String reportReason) {
        forumCommentDAO.updateStatusWithReason(id, status, reportReason);
    }

    /**
     * Get all reported comments
     */
    public List<ForumComment> getReportedComments() {
        return forumCommentDAO.findReportedComments();
    }

    /**
     * Search posts by content within a forum
     */
    public List<ForumPost> searchPostsByContent(int forumId, String searchTerm) {
        if (searchTerm == null || searchTerm.trim().isEmpty()) {
            return getPostsByForumId(forumId);
        }
        return forumPostDAO.searchByContent(forumId, searchTerm);
    }
}
