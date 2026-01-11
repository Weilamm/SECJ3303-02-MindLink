<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${rule != null && rule.id > 0 ? 'Edit' : 'Add'} Chatbot Rule</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #FFF3E0; padding: 40px; color: #003049; }
        .form-card { background: white; max-width: 600px; margin: 0 auto; padding: 40px; border-radius: 20px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; font-weight: 600; margin-bottom: 8px; }
        input, textarea { width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; box-sizing: border-box; font-family: inherit; }
        textarea { min-height: 120px; resize: vertical; }
        .btn-save { background: #48C9B0; color: white; border: none; padding: 12px 30px; border-radius: 20px; width: 100%; cursor: pointer; font-size: 16px; font-weight: 600; }
        .btn-save:hover { background: #3ab89d; }
    </style>
</head>
<body>
    <div class="form-card">
        <h2>${rule != null && rule.id > 0 ? 'Edit' : 'Add'} Chatbot Rule</h2>
        
        <form action="${pageContext.request.contextPath}/admin/chatbot/save" method="post">
            <input type="hidden" name="id" value="${rule != null && rule.id > 0 ? rule.id : ''}">
            
            <div class="form-group">
                <label>Keyword</label>
                <input type="text" name="keyword" value="${rule != null ? rule.keyword : ''}" placeholder="e.g., hello, stress, anxiety" required>
                <small style="color: #666; font-size: 12px;">The keyword users might type to trigger this response</small>
            </div>
            
            <div class="form-group">
                <label>Response</label>
                <textarea name="response" placeholder="Enter the chatbot's response to this keyword..." required>${rule != null ? rule.response : ''}</textarea>
                <small style="color: #666; font-size: 12px;">The message the chatbot will send when this keyword is detected</small>
            </div>
            
            <button type="submit" class="btn-save">Save Rule</button>
            <a href="${pageContext.request.contextPath}/admin/chatbot" style="display:block; text-align:center; margin-top:15px; color:#666; text-decoration:none;">Cancel</a>
        </form>
    </div>
</body>
</html>

