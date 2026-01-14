<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${module.title} - MindLink Admin</title>
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

        .container {
            max-width: 1400px;
            margin: 60px auto;
            position: relative;
            z-index: 10;
            padding: 0 40px;
            padding-bottom: 60px;
        }

        /* HEADER SECTION */
        .header-section {
            display: flex;
            gap: 40px;
            align-items: center;
            margin-bottom: 40px;
        }
        
        .header-img {
            width: 350px;
            height: 220px;
            object-fit: cover;
            border-radius: 20px;
            background-color: #ddd;
        }

        .header-content {
            flex: 1;
        }

        h1 {
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .desc {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        /* CHAPTER CARDS */
        .chapter-card {
            background-color: var(--card-bg);
            border-radius: 40px;
            padding: 40px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        .chapter-title {
            font-size: 24px;
            font-weight: 800;
            margin-bottom: 25px;
        }

        /* Lesson Item */
        .lesson-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 2px solid rgba(0,0,0,0.05);
        }

        .lesson-row:last-child {
            border-bottom: none;
        }

        .lesson-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .pdf-icon {
            font-size: 24px;
        }

        .lesson-name {
            font-size: 18px;
            font-weight: 600;
            color: #666;
        }

        .back-arrow {
            font-size: 30px;
            text-decoration: none;
            color: #000;
            display: inline-block;
            margin-bottom: 20px;
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

        /* Decorative Background Shapes */
        .shape {
            position: absolute;
            z-index: 1;
            pointer-events: none;
        }
        
        .shape-left {
            top: 20%;
            left: -5%;
            width: 250px;
            opacity: 0.8;
        }

        .shape-right-bottom {
            bottom: -10%;
            right: -5%;
            width: 300px;
            opacity: 0.8;
        }

    </style>
</head>
<body>

    <!-- Header Navigation -->
    <div class="header">
        <div class="nav-left">
            <a href="${pageContext.request.contextPath}/admin/home">Home</a>
            <a href="${pageContext.request.contextPath}/admin/modules/dashboard">Module</a>
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
        
        <a href="${pageContext.request.contextPath}/admin/modules/dashboard" class="back-arrow">↩</a>

        <c:if test="${not empty module}">
            <div class="header-section">
                <img src="${pageContext.request.contextPath}/images/${module.imagePath}" class="header-img" alt="${module.title}">
                <div class="header-content">
                    <h1>${module.title}</h1>
                    <p class="desc">${module.description}</p>
                </div>
            </div>

            <c:set var="currentChapter" value="0" />
            <c:forEach var="question" items="${module.questions}">
                <c:if test="${currentChapter != question.chapterNumber}">
                    <c:if test="${currentChapter != 0}">
                        </div>
                    </c:if>
                    <c:set var="currentChapter" value="${question.chapterNumber}" />
                    <div class="chapter-card">
                        <div class="chapter-title">Chapter ${question.chapterNumber} : 
                            <c:choose>
                                <c:when test="${question.chapterNumber == 1}">What is Mental Health?</c:when>
                                <c:when test="${question.chapterNumber == 2}">Mental Health Stigma</c:when>
                                <c:otherwise>Chapter ${question.chapterNumber}</c:otherwise>
                            </c:choose>
                        </div>
                </c:if>
                <div class="lesson-row">
                    <div class="lesson-info">
                        <span class="pdf-icon">📄</span>
                        <span class="lesson-name">${question.questionNumber} ${question.questionText}</span>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${currentChapter != 0}">
                </div>
            </c:if>
        </c:if>

    </div>

</body>
</html>



