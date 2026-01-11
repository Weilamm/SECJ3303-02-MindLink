<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forum Posts Management - Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-red: #FF6B6B;
            --btn-blue: #00313e;
        }

        body { 
            font-family: 'Inter', sans-serif; 
            background-color: var(--bg-color); 
            margin: 0; 
            padding: 20px; 
            color: var(--text-dark); 
        }
        
        .header { 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            margin-bottom: 30px; 
        }
        
        .logo { 
            font-size: 24px; 
            font-weight: 800; 
        }
        
        h1 { 
            margin-bottom: 20px; 
        }

        .filter-section {
            background: white;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .filter-section label {
            font-weight: 600;
            margin-right: 10px;
        }

        .filter-section select {
            padding: 8px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            margin-right: 15px;
        }

        .filter-section a {
            display: inline-block;
            padding: 8px 20px;
            background: var(--btn-blue);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
        }

        .filter-section a:hover {
            background: #004d61;
        }

        /* Post Cards */
        .posts-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .post-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: relative;
        }

        .post-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .post-meta {
            flex: 1;
        }

        .post-author {
            font-size: 16px;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 5px;
        }

        .post-info {
            font-size: 13px;
            color: #666;
            margin-bottom: 3px;
        }

        .post-forum {
            display: inline-block;
            background: #E3F2FD;
            color: #1976D2;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-top: 8px;
        }

        .post-actions {
            display: flex;
            gap: 10px;
        }

        .btn-action {
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
        }

        .btn-delete {
            background-color: var(--btn-red);
            color: white;
        }

        .btn-delete:hover {
            background-color: #e55a5a;
        }

        .btn-view-forum {
            background-color: #E0E0E0;
            color: #333;
            text-decoration: none;
        }

        .btn-view-forum:hover {
            background-color: #d0d0d0;
        }

        .post-content {
            font-size: 14px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 15px;
            padding: 15px;
            background: #f9f9f9;
            border-radius: 8px;
            white-space: pre-wrap;
            word-wrap: break-word;
        }

        .post-id {
            font-size: 11px;
            color: #999;
            margin-top: 10px;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .empty-state p {
            font-size: 16px;
            color: #666;
            margin: 10px 0;
        }

        .stats {
            background: white;
            padding: 15px 20px;
            border-radius: 12px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            display: flex;
            gap: 30px;
            font-size: 14px;
        }

        .stat-item {
            display: flex;
            flex-direction: column;
        }

        .stat-label {
            color: #666;
            font-size: 12px;
            margin-bottom: 5px;
        }

        .stat-value {
            font-size: 20px;
            font-weight: 700;
            color: var(--text-dark);
        }
    </style>
</head>
<body>

    <div class="header">
        <div class="logo">MindLink Admin - Forum Posts</div>
        <a href="${pageContext.request.contextPath}/admin/home" style="text-decoration:none; color:#003049; font-weight:600;">&larr; Back to Dashboard</a>
    </div>

    <h1>Forum Posts Management</h1>

    <!-- Filter Section -->
    <div class="filter-section">
        <form method="get" action="${pageContext.request.contextPath}/admin/forum/posts" style="display: inline-block;">
            <label for="forumId">Filter by Forum:</label>
            <select name="forumId" id="forumId" onchange="this.form.submit()">
                <option value="">All Forums</option>
                <c:forEach var="f" items="${forums}">
                    <option value="${f.id}" ${param.forumId == f.id ? 'selected' : ''}>${f.title}</option>
                </c:forEach>
            </select>
        </form>
        <a href="${pageContext.request.contextPath}/admin/forum/posts">View All Posts</a>
    </div>

    <!-- Stats -->
    <div class="stats">
        <div class="stat-item">
            <span class="stat-label">Total Posts</span>
            <span class="stat-value">${posts != null ? posts.size() : 0}</span>
        </div>
        <c:if test="${not empty forum}">
            <div class="stat-item">
                <span class="stat-label">Forum</span>
                <span class="stat-value">${forum.title}</span>
            </div>
        </c:if>
    </div>

    <!-- Posts List -->
    <div class="posts-container">
        <c:choose>
            <c:when test="${empty posts}">
                <div class="empty-state">
                    <p style="font-size: 24px; margin-bottom: 10px;">📭</p>
                    <p><strong>No posts found</strong></p>
                    <p>There are no posts in ${not empty forum ? 'this forum' : 'any forum'} yet.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="post" items="${posts}">
                    <div class="post-card">
                        <div class="post-header">
                            <div class="post-meta">
                                <div class="post-author">${post.userName}</div>
                                <div class="post-info">User ID: ${post.userId}</div>
                                <c:if test="${not empty post.createdAt}">
                                    <div class="post-info">
                                        Posted: 
                                        <c:catch var="dateError">
                                            <fmt:parseDate value="${post.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
                                            <fmt:formatDate value="${parsedDate}" pattern="MMM dd, yyyy 'at' HH:mm" />
                                        </c:catch>
                                        <c:if test="${not empty dateError}">
                                            ${post.createdAt}
                                        </c:if>
                                    </div>
                                </c:if>
                                <c:if test="${empty forum}">
                                    <!-- Find forum for this post -->
                                    <c:forEach var="f" items="${forums}">
                                        <c:if test="${f.id == post.forumId}">
                                            <span class="post-forum">${f.title}</span>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <div class="post-actions">
                                <a href="${pageContext.request.contextPath}/admin/forum/posts/delete?id=${post.id}${not empty forum ? '&forumId=' : ''}${not empty forum ? forum.id : ''}" 
                                   class="btn-action btn-delete"
                                   onclick="return confirm('Are you sure you want to delete this post?\n\nAuthor: ${post.userName} (${post.userId})\n\nThis action cannot be undone.');">
                                   Delete Post
                                </a>
                            </div>
                        </div>
                        <div class="post-content">${post.content}</div>
                        <div class="post-id">Post ID: ${post.id} | Forum ID: ${post.forumId}</div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>

