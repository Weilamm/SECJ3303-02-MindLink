<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Modules</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        /* (Reuse your existing CSS variables here) */
        body { font-family: 'Inter', sans-serif; background-color: #FFF3E0; padding: 20px; color: #003049; }
        .container { max-width: 1000px; margin: 0 auto; }
        
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .btn-add { background: #003049; color: white; padding: 12px 25px; border-radius: 20px; text-decoration: none; font-weight: 600; }
        
        .module-item {
            background: white; padding: 20px; border-radius: 15px; margin-bottom: 20px;
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        .mod-info h3 { margin: 0 0 5px 0; }
        .mod-info p { margin: 0; color: #666; font-size: 14px; }
        
        .actions a { margin-left: 10px; text-decoration: none; font-weight: 600; font-size: 14px; }
        .btn-edit { color: #F2C94C; }
        .btn-delete { color: #F497AA; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Learning Modules</h1>
            <a href="/admin/home" style="color:#666; text-decoration:none; margin-right:20px;">Back to Home</a>
            <a href="/admin/modules/add" class="btn-add">+ Add Module</a>
        </div>

        <c:forEach items="${modules}" var="m">
            <div class="module-item">
                <div class="mod-info">
                    <h3>${m.title}</h3>
                    <p>${m.description}</p>
                </div>
                <div class="actions">
                    <a href="/admin/modules/edit?id=${m.id}" class="btn-edit">Edit</a>
                    <a href="/admin/modules/delete?id=${m.id}" class="btn-delete" onclick="return confirm('Delete this module?')">Delete</a>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty modules}">
            <p style="text-align:center;">No modules found.</p>
        </c:if>
    </div>
</body>
</html>