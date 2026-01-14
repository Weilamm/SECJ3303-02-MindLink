<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select Module - Assessment</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        :root { --bg-color: #FFF3E0; --text-dark: #003049; }
        body { font-family: 'Segoe UI', sans-serif; background-color: var(--bg-color); margin: 0; color: var(--text-dark); }
        .header { padding: 20px 100px; display: flex; justify-content: space-between; align-items: center; background: white; }
        .logo { display: flex; align-items: center; gap: 10px; font-weight: 700; font-size: 32px; text-decoration: none; color: #00313e; }
        .container { max-width: 900px; margin: 60px auto; padding: 0 40px; text-align: center; }
        .module-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-top: 40px; }
        .module-card { background: white; padding: 30px; border-radius: 20px; text-decoration: none; color: inherit; transition: transform 0.2s, box-shadow 0.2s; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
        .module-card:hover { transform: translateY(-5px); box-shadow: 0 8px 20px rgba(0,0,0,0.1); }
        .module-card h3 { margin: 0 0 10px 0; font-size: 20px; }
        .module-card p { font-size: 14px; color: #666; margin: 0; }
    </style>
</head>
<body>
    <div class="header">
        <a href="${pageContext.request.contextPath}/admin/home" class="logo">MindLink</a>
    </div>

    <div class="container">
        <h1>Select a Module</h1>
        <p>Choose a module to manage its assessment questions.</p>
        
        <div class="module-grid">
            <c:forEach items="${modules}" var="m">
                <a href="${pageContext.request.contextPath}/admin/assessment/list?moduleId=${m.moduleId}" class="module-card">
                    <h3>${m.title}</h3>
                    <p>${m.description}</p>
                </a>
            </c:forEach>
        </div>
    </div>
</body>
</html>