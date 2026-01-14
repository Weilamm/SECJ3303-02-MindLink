<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forum Reports</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-red: #FF6B6B;
            --btn-grey: #999;
        }

        body { font-family: 'Inter', sans-serif; background-color: var(--bg-color); margin: 0; padding: 20px; color: var(--text-dark); }
        
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .logo { font-size: 24px; font-weight: 800; }
        
        h1 { margin-bottom: 30px; }

        /* TABLE STYLE */
        .report-table {
            width: 100%; border-collapse: collapse; background: white; 
            border-radius: 12px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        
        th { text-align: left; padding: 15px; background: #f9f9f9; font-size: 13px; color: #666; text-transform: uppercase; }
        td { padding: 15px; border-bottom: 1px solid #eee; font-size: 14px; vertical-align: top; }
        
        .reason-tag {
            background: #FFEBEE; color: #D32F2F; 
            padding: 4px 10px; border-radius: 20px; font-size: 12px; font-weight: 700;
        }

        .btn-action {
            text-decoration: none; padding: 6px 12px; border-radius: 6px; 
            font-size: 12px; font-weight: 600; display: inline-block; margin-right: 5px;
        }
        
        .btn-delete { background-color: var(--btn-red); color: white; }
        .btn-dismiss { background-color: #E0E0E0; color: #333; }
        
        .btn-delete:hover { opacity: 0.9; }
        .btn-dismiss:hover { background-color: #d0d0d0; }

    </style>
</head>
<body>

    <div class="header">
        <div class="logo">MindLink Admin</div>
        <a href="${pageContext.request.contextPath}/admin/home" style="text-decoration:none; color:#003049; font-weight:600;">&larr; Back to Dashboard</a>
    </div>

    <h1>Forum Reports</h1>

    <table class="report-table">
        <thead>
            <tr>
                <th>Date</th>
                <th>Author</th>
                <th style="width: 40%;">Content</th>
                <th>Reason</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${reports}" var="item">
                <tr>
                    <td>${item.date}</td>
                    <td><b>${item.author}</b></td>
                    <td style="color:#555;">"${item.content}"</td>
                    <td><span class="reason-tag">${item.reason}</span></td>
                    <td>
                        <span style="font-weight:600; color: ${item.status == 'Pending' ? '#E67E22' : '#27AE60'}">
                            ${item.status}
                        </span>
                    </td>
                    <td>
                        <c:if test="${item.status == 'Pending'}">
                            <a href="${pageContext.request.contextPath}/admin/forum/reports/delete?id=${item.id}" 
                               class="btn-action btn-delete"
                               onclick="return confirm('Are you sure you want to delete this post? This cannot be undone.');">
                               Delete Post
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/admin/forum/reports/dismiss?id=${item.id}" 
                               class="btn-action btn-dismiss">
                               Dismiss
                            </a>
                        </c:if>
                        <c:if test="${item.status != 'Pending'}">
                            <span style="color:#aaa; font-size:12px;">No actions available</span>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            
            <c:if test="${empty reports}">
                <tr><td colspan="6" style="text-align:center; padding:30px;">No reported posts found. Good job!</td></tr>
            </c:if>
        </tbody>
    </table>

</body>
</html>