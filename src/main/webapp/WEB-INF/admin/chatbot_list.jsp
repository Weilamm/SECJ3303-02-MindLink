<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Chatbot Rules</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #FFF3E0; padding: 20px; color: #003049; }
        .container { max-width: 1000px; margin: 0 auto; }
        
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .btn-add { background: transparent; border: none; font-size: 32px; cursor: pointer; color: #000; text-decoration: none; }
        
        .rule-card {
            background: #FFF5F5;
            border-radius: 20px; padding: 30px; margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            position: relative;
        }

        .keyword-text { font-size: 20px; font-weight: 800; margin-bottom: 10px; color: #000; }
        .response-text { font-size: 14px; color: #666; font-weight: 400; line-height: 1.6; }

        .actions {
            position: absolute; top: 20px; right: 20px;
            display: flex; gap: 10px;
        }
        
        .action-icon {
            text-decoration: none; font-size: 20px; color: #000;
            padding: 5px; border-radius: 5px; transition: background 0.2s;
        }
        .action-icon:hover { background: rgba(0,0,0,0.1); }
        .delete-icon { color: #d32f2f; }
    </style>
</head>
<body>
    <div class="container">
        
        <div class="header">
            <h1>Chatbot Rules Management</h1>
            <div style="display: flex; align-items: center; gap: 15px;">
                <a href="${pageContext.request.contextPath}/admin/chatbot/add" class="btn-add">+</a>
                <a href="${pageContext.request.contextPath}/admin/home" style="font-size:14px; color:#666; text-decoration:none;">Back</a>
            </div>
        </div>

        <c:forEach var="rule" items="${rules}">
            <div class="rule-card">
                <div class="keyword-text">Keyword: "${rule.keyword}"</div>
                <div class="response-text">${rule.response}</div>
                
                <div class="actions">
                    <a href="${pageContext.request.contextPath}/admin/chatbot/edit?id=${rule.id}" class="action-icon">✏️</a>
                    <a href="${pageContext.request.contextPath}/admin/chatbot/delete?id=${rule.id}" class="action-icon delete-icon" 
                       onclick="return confirm('Are you sure you want to delete this rule?')">🗑️</a>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty rules}">
            <div style="text-align: center; padding: 40px; color: #666;">
                <p>No chatbot rules found. Click + to add a new rule.</p>
            </div>
        </c:if>

    </div>
</body>
</html>

