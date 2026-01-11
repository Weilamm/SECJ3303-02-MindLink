<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${tip != null && tip.id > 0 ? 'Edit' : 'Add'} Daily Tip</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #FFF3E0; padding: 40px; color: #003049; }
        .form-card { background: white; max-width: 600px; margin: 0 auto; padding: 40px; border-radius: 20px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; font-weight: 600; margin-bottom: 8px; }
        input, textarea { width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; box-sizing: border-box; font-family: inherit; }
        input { margin-bottom: 8px; }
        textarea { min-height: 150px; resize: vertical; }
        .btn-save { background: #48C9B0; color: white; border: none; padding: 12px 30px; border-radius: 20px; width: 100%; cursor: pointer; font-size: 16px; font-weight: 600; }
        .btn-save:hover { background: #3ab89d; }
    </style>
</head>
<body>
    <div class="form-card">
        <h2>${tip != null && tip.id > 0 ? 'Edit' : 'Add'} Daily Tip</h2>
        
        <form action="${pageContext.request.contextPath}/admin/tips/save" method="post">
            <input type="hidden" name="id" value="${tip != null && tip.id > 0 ? tip.id : ''}">
            
            <div class="form-group">
                <label>Title</label>
                <input type="text" name="title" value="${tip != null && tip.title != null ? tip.title : ''}" placeholder="e.g., Find Your Calm Before You Begin" required>
                <small style="color: #666; font-size: 12px;">The title of the tip</small>
            </div>
            
            <div class="form-group">
                <label>Content</label>
                <textarea name="content" placeholder="Enter the daily tip content..." required>${tip != null ? tip.content : ''}</textarea>
                <small style="color: #666; font-size: 12px;">This tip will be randomly displayed to users on the tips page (3 tips at a time)</small>
            </div>
            
            <button type="submit" class="btn-save">Save Tip</button>
            <a href="${pageContext.request.contextPath}/admin/tips" style="display:block; text-align:center; margin-top:15px; color:#666; text-decoration:none;">Cancel</a>
        </form>
    </div>
</body>
</html>

