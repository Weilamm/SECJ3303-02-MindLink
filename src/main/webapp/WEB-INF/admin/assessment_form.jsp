<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Question</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #FFF3E0; padding: 40px; color: #003049; }
        .form-card { background: white; max-width: 600px; margin: 0 auto; padding: 40px; border-radius: 20px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; font-weight: 600; margin-bottom: 8px; }
        input, textarea { width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; }
        .btn-save { background: #48C9B0; color: white; border: none; padding: 12px 30px; border-radius: 20px; width: 100%; cursor: pointer; font-size: 16px; font-weight: 600; }
    </style>
</head>
<body>
    <div class="form-card">
        <h2>${question.id == null || question.id == '' ? 'Add' : 'Edit'} Question</h2>
        
        <form action="/admin/assessment/save" method="post">
            <input type="hidden" name="id" value="${question.id}">
            
            <div class="form-group">
                <label>Question Text</label>
                <input type="text" name="questionText" value="${question.questionText}" required>
            </div>
            
            <div class="form-group">
                <label>Options (Separate by semicolon ';')</label>
                <textarea name="options" rows="3" placeholder="Yes;No;Maybe" required>${question.options}</textarea>
            </div>
            
            <button type="submit" class="btn-save">Save Question</button>
            <a href="/admin/assessment" style="display:block; text-align:center; margin-top:15px; color:#666; text-decoration:none;">Cancel</a>
        </form>
    </div>
</body>
</html>