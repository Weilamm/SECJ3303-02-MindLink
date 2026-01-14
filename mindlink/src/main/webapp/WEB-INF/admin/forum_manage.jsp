<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Forums - Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-blue: #00313e;
            --btn-green: #48C9B0;
            --btn-red: #FF6B6B;
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
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .logo {
            font-size: 24px;
            font-weight: 800;
        }

        .header-actions {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
        }

        .btn-primary {
            background-color: var(--btn-blue);
            color: white;
        }

        .btn-primary:hover {
            background-color: #004d61;
        }

        .btn-secondary {
            background-color: #E0E0E0;
            color: #333;
        }

        .btn-secondary:hover {
            background-color: #d0d0d0;
        }

        .btn-edit {
            background-color: var(--btn-green);
            color: white;
            padding: 6px 12px;
            font-size: 12px;
        }

        .btn-edit:hover {
            background-color: #3ab89a;
        }

        .btn-view {
            background-color: var(--btn-blue);
            color: white;
            padding: 6px 12px;
            font-size: 12px;
        }

        .btn-view:hover {
            background-color: #004d61;
        }

        h1 {
            margin-bottom: 20px;
        }

        .forums-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .forum-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .forum-info {
            flex: 1;
        }

        .forum-title {
            font-size: 20px;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 8px;
        }

        .forum-description {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
            line-height: 1.5;
        }

        .forum-meta {
            font-size: 12px;
            color: #999;
            display: flex;
            gap: 15px;
        }

        .forum-status {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
        }

        .status-active {
            background: #E8F5E9;
            color: #2E7D32;
        }

        .status-closed {
            background: #FFF3E0;
            color: #E67E22;
        }

        .status-archived {
            background: #F3E5F5;
            color: #7B1FA2;
        }

        .forum-actions {
            display: flex;
            gap: 10px;
            align-items: center;
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
    </style>
</head>
<body>

    <div class="header">
        <div class="logo">MindLink Admin - Forum Management</div>
        <div class="header-actions">
            <a href="${pageContext.request.contextPath}/admin/forum/create-form" class="btn btn-primary">+ Add Forum</a>
            <a href="${pageContext.request.contextPath}/admin/home" class="btn btn-secondary">← Back to Dashboard</a>
        </div>
    </div>

    <h1>Manage Forums</h1>

    <div class="forums-container">
        <c:choose>
            <c:when test="${empty forums}">
                <div class="empty-state">
                    <p style="font-size: 24px; margin-bottom: 10px;">📭</p>
                    <p><strong>No forums found</strong></p>
                    <p>Click "Add Forum" to create your first forum.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="forum" items="${forums}">
                    <div class="forum-card">
                        <div class="forum-info">
                            <div class="forum-title">${forum.title}</div>
                            <div class="forum-description">${forum.description}</div>
                            <div class="forum-meta">
                                <span>Created by: <b>${forum.createdBy}</b></span>
                                <c:if test="${not empty forum.createdAt}">
                                    <span>• 
                                        ${post.createdAt.toString().replace("T", " ").substring(0, 16)}
                                    </span>
                                </c:if>
                                <span class="forum-status status-${forum.status}">${forum.status}</span>
                            </div>
                        </div>
                        <div class="forum-actions">
                            <a href="${pageContext.request.contextPath}/admin/forum/detail?id=${forum.id}" class="btn btn-view">View</a>
                            <a href="${pageContext.request.contextPath}/admin/forum/edit-form?id=${forum.id}" class="btn btn-edit">Edit</a>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>

