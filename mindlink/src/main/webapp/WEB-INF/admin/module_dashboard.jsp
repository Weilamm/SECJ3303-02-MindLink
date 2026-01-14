<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Module Dashboard - MindLink Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-yellow: #F2C94C;
            --btn-teal: #48C9B0;
            --btn-pink: #F497AA;
            --bar-bg: #E0E0E0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 0;
            color: var(--text-dark);
            overflow-x: hidden;
        }

        /* Header Navigation */
        .header {
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
        }

        .nav-left,
        .nav-right {
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            flex: 1;
            gap: 0;
        }

        .nav-left a, .nav-right a {
            text-decoration: none;
            color: #00313e;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-left a:hover, .nav-right a:hover {
            color: #0d4e57;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 700;
            color: #00313e;
            font-size: 32px;
            text-decoration: none;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        /* Main Container */
        .container {
            max-width: 1400px;
            margin: 60px auto;
            position: relative;
            z-index: 10;
            padding: 0 40px;
        }

        h1 {
            font-size: 48px;
            font-weight: 800;
            margin-bottom: 60px;
            color: var(--text-dark);
            text-align: center;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .page-header h2 {
            font-size: 32px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0;
        }

        /* Module Card - Matching home.jsp style */
        .module-card {
            background-color: var(--card-bg);
            border-radius: 40px;
            padding: 40px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            transition: transform 0.2s;
        }

        .module-card:hover {
            transform: translateY(-5px);
        }

        .module-header {
            display: flex;
            gap: 40px;
            align-items: center;
            margin-bottom: 20px;
        }

        /* Left Image */
        .module-img {
            width: 300px;
            height: 200px;
            object-fit: cover;
            border-radius: 20px;
            background-color: #eee;
            flex-shrink: 0;
        }

        /* Right Content */
        .module-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .module-title {
            font-size: 24px;
            font-weight: 800;
            color: var(--text-dark);
            margin: 0;
        }

        .module-desc {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
            margin: 0;
        }

        /* Action Buttons Container */
        .module-actions {
            display: flex;
            gap: 15px;
            margin-top: 10px;
            flex-wrap: wrap;
        }

        /* Questions Section */
        .questions-section {
            margin-top: 30px;
            padding-top: 30px;
            border-top: 2px solid rgba(0,0,0,0.05);
        }

        .questions-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .questions-header h3 {
            font-size: 20px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0;
        }

        .question-item {
            background-color: #f9f9f9;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .question-info {
            flex: 1;
        }

        .question-title {
            font-size: 16px;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 5px;
        }

        .question-meta {
            font-size: 14px;
            color: #666;
        }

        .question-actions {
            display: flex;
            gap: 10px;
        }

        .btn-small {
            padding: 8px 20px;
            font-size: 14px;
        }

        /* Buttons */
        .btn {
            padding: 12px 30px;
            border-radius: 30px;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: opacity 0.3s;
        }

        .btn-yellow { background-color: var(--btn-yellow); }
        .btn-teal { background-color: var(--btn-teal); }
        .btn-pink { background-color: var(--btn-pink); }
        .btn:hover { opacity: 0.9; }

        .btn-view {
            background-color: var(--btn-teal);
        }

        .btn-edit {
            background-color: var(--btn-yellow);
        }

        .btn-delete {
            background-color: var(--btn-pink);
        }

        /* Decorative Background Shapes */
        .shape { position: absolute; z-index: 1; pointer-events: none; }
        
        .shape-left { top: 20%; left: -5%; width: 250px; opacity: 0.8; }
        .shape-right-bottom { bottom: -10%; right: -5%; width: 300px; opacity: 0.8; }

        /* Responsive */
        @media (max-width: 900px) {
            .module-header {
                flex-direction: column;
                text-align: center;
            }
            .module-img {
                width: 100%;
                max-width: 400px;
            }
        }

    </style>
</head>
<body>

    <!-- Header Navigation -->
    <div class="header">
        <div class="nav-left">
            <a href="${pageContext.request.contextPath}/admin/home">Home</a>
            <a href="${pageContext.request.contextPath}/admin/modules/dashboard" style="font-weight:700;">Module</a>
        </div>
        
        <a href="${pageContext.request.contextPath}/admin/home" class="logo">
            <div class="logo-icon">
                <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
            </div>
            <span>MindLink</span>
        </a>
        
        <div class="nav-right">
            <a href="${pageContext.request.contextPath}/admin/user-management">User Management</a>
            <a href="${pageContext.request.contextPath}/admin/profile">Profile</a>
        </div>
    </div>

    <img src="${pageContext.request.contextPath}/images/assessment-left.png" class="shape shape-left" alt="">
    <img src="${pageContext.request.contextPath}/images/assessment-right.png" class="shape shape-right-bottom" alt="">

    <div class="container">
        <div class="page-header">
            <h2>Module Dashboard</h2>
            <a href="${pageContext.request.contextPath}/admin/modules/add" class="btn btn-teal">+ Add New Module</a>
        </div>

        <c:if test="${not empty error}">
            <div style="text-align: center; padding: 20px; background: #ffebee; color: #c62828; border-radius: 10px; margin-bottom: 20px;">
                <strong>Error:</strong> ${error}
            </div>
        </c:if>
        
        <c:forEach items="${modules}" var="module">
            <div class="module-card">
                <div class="module-header">
                    <img src="${pageContext.request.contextPath}/images/${module.imagePath}" class="module-img" alt="${module.title}">
                    
                    <div class="module-content">
                        <div class="module-title">${module.title}</div>
                        <div class="module-desc">${module.description}</div>
                        
                        <div class="module-actions">
                            <a href="${pageContext.request.contextPath}/admin/modules/intro?id=${module.moduleId}" class="btn btn-view">View Details</a>
                            <a href="${pageContext.request.contextPath}/admin/modules/edit?id=${module.moduleId}" class="btn btn-edit">Edit Module</a>
                            <a href="${pageContext.request.contextPath}/admin/modules/delete?id=${module.moduleId}" 
                               class="btn btn-delete" 
                               onclick="return confirm('Are you sure you want to delete this module? This action cannot be undone.')">Delete Module</a>
                        </div>
                    </div>
                </div>

                <!-- Questions Section -->
                <div class="questions-section">
                    <div class="questions-header">
                        <h3>Module Questions (${fn:length(module.questions)})</h3>
                        <a href="${pageContext.request.contextPath}/admin/modules/questions/add?moduleId=${module.moduleId}" class="btn btn-teal btn-small">+ Add Question</a>
                    </div>

                    <c:if test="${not empty module.questions}">
                        <c:forEach items="${module.questions}" var="question">
                            <div class="question-item">
                                <div class="question-info">
                                    <div class="question-title">${question.questionNumber} - ${question.questionText}</div>
                                    <div class="question-meta">Chapter ${question.chapterNumber} | Type: ${question.questionType}</div>
                                </div>
                                <div class="question-actions">
                                    <a href="${pageContext.request.contextPath}/admin/modules/questions/edit?id=${question.questionId}" class="btn btn-edit btn-small">Edit</a>
                                    <a href="${pageContext.request.contextPath}/admin/modules/questions/delete?id=${question.questionId}" 
                                       class="btn btn-delete btn-small" 
                                       onclick="return confirm('Are you sure you want to delete this question?')">Delete</a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty module.questions}">
                        <div style="text-align: center; padding: 30px; color: #888;">
                            <p>No questions yet. <a href="${pageContext.request.contextPath}/admin/modules/questions/add?moduleId=${module.moduleId}" style="color: var(--btn-teal);">Add your first question</a></p>
                        </div>
                    </c:if>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty modules}">
            <div style="text-align: center; padding: 60px; color: #888;">
                <p style="font-size: 18px; margin-bottom: 20px;">No modules found.</p>
                <a href="${pageContext.request.contextPath}/admin/modules/add" class="btn btn-teal">Create your first module</a>
            </div>
        </c:if>
    </div>

</body>
</html>
