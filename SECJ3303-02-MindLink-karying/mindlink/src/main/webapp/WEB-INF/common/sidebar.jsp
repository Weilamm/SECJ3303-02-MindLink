<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="sidebar">
    <div class="brand">MindLink</div>
    <ul>
        <li><a href="/dashboard">Dashboard</a></li>
        <li><a href="/learning/list">Learning</a></li>
        <li><a href="/assessment/start">Self-Assessment</a></li>
        <li><a href="/gamification/view">Achievements</a></li>
        <li><a href="/assistant/chat">AI Assistant</a></li>
        <li><a href="/forum/feed">Forum</a></li>
        <li><a href="/counseling/list">Counseling</a></li>
        
        <!-- Admin Check -->
        <c:if test="${user.role == 'ADMIN'}">
            <li class="admin-link"><a href="/admin/analytics">Admin Panel</a></li>
        </c:if>
        
        <li><a href="/logout">Logout</a></li>
    </ul>
</div>