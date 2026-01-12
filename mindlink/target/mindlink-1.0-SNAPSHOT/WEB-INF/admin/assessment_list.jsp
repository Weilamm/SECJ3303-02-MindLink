<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Assessment</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #FFF3E0; padding: 20px; color: #003049; }
        .container { max-width: 1000px; margin: 0 auto; }
        
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .btn-add { background: transparent; border: none; font-size: 32px; cursor: pointer; color: #000; }
        
        .question-card {
            background: #FFF5F5; /* Light pinkish background from screenshot */
            border-radius: 20px; padding: 30px; margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            position: relative;
        }

        .question-text { font-size: 20px; font-weight: 800; margin-bottom: 10px; color: #000; }
        .options-text { font-size: 14px; color: #666; font-weight: 600; }

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
            <h1>Mental Health Assessment</h1>
            <div style="display: flex; align-items: center; gap: 15px;">
                <a href="/admin/assessment/add" class="btn-add" style="text-decoration:none;">+</a>
                <a href="/admin/home" style="font-size:14px; color:#666; text-decoration:none;">Back</a>
            </div>
        </div>

        <c:forEach items="${questions}" var="q">
            <div class="question-card">
                <div class="question-text">${q.questionText}</div>
                <div class="options-text">${q.options}</div>
                
                <div class="actions">
                    <a href="/admin/assessment/edit?id=${q.id}" class="action-icon">✎</a>
                    
                    <a href="/admin/assessment/delete?id=${q.id}" class="action-icon delete-icon" 
                       onclick="return confirm('Delete this question?')">🗑</a>
                </div>
            </div>
        </c:forEach>

    </div>
</body>
</html>