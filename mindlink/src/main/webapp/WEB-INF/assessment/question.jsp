<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>MindLink - ${title}</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --input-bg: #013B46;
            --highlight: #4E8692;
            --btn-green: #86E393;
            --btn-red: #FF6B6B;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-dark);
        }

        /* Header Navigation */
        .header {
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
        }

        .nav-left, .nav-right {
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            flex: 1;
        }

        .nav-left a, .nav-right a {
            text-decoration: none;
            color: #00313e;
            font-size: 16px;
            font-weight: 500;
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

        .logo-icon img {
            width: 40px;
            height: 40px;
        }

        /* Container & Card */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 81px);
            padding: 40px;
        }

        .assessment-card {
            background: white;
            width: 100%;
            max-width: 900px;
            border-radius: 40px;
            padding: 50px;
            position: relative;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        }

        .close-btn {
            position: absolute;
            top: 40px;
            left: 40px;
            width: 40px;
            height: 40px;
            background-color: var(--btn-red);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .progress-pill {
            position: absolute;
            top: 40px;
            right: 40px;
            background-color: var(--input-bg);
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
        }

        .card-header {
            text-align: center;
            margin-bottom: 40px;
        }

        h1 {
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .question-block {
            margin-bottom: 35px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }

        .question-text {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 20px;
            display: block;
        }

        .options-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .option-label {
            background: #f8f8f8;
            padding: 12px 20px;
            border-radius: 12px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: background 0.2s;
            border: 1px solid #eee;
        }

        .option-label:hover {
            background: #f0f0f0;
        }

        .option-label input[type="radio"] {
            accent-color: var(--input-bg);
        }

        /* Footer Actions */
        .footer-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .back-arrow {
            background-color: var(--input-bg);
            width: 80px;
            height: 40px;
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-decoration: none;
            font-size: 24px;
        }

        .submit-btn {
            background-color: var(--input-bg);
            color: white;
            padding: 12px 40px;
            border-radius: 30px;
            font-weight: 700;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: opacity 0.2s;
        }

        .submit-btn:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>
    <div class="header">
        <div class="nav-left">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/learning">Learning</a>
        </div>
        <a href="${pageContext.request.contextPath}/home" class="logo">
            <div class="logo-icon">
                <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
            </div>
            <span>MindLink</span>
        </a>
        <div class="nav-right">
            <a href="${pageContext.request.contextPath}/forum/welcome">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <div class="container">
        <div class="assessment-card">
            <a href="${pageContext.request.contextPath}/assessment/select-module" class="close-btn">✕</a>
            
            <div class="progress-pill">
                Page ${currentPage} of ${totalPages}
            </div>

            <div class="card-header">
                <h1>${title}</h1>
                <p class="subtitle">Please answer the following questions honestly.</p>
            </div>

            <form action="${pageContext.request.contextPath}/assessment/submit" method="post">
                <input type="hidden" name="title" value="${title}">
                <input type="hidden" name="currentPage" value="${currentPage}">
                <input type="hidden" name="totalPages" value="${totalPages}">

                <c:forEach var="q" items="${questions}" varStatus="status">
                    <div class="question-block">
                        <span class="question-text">${q.questionText}</span>
                        <div class="options-group">
                            <c:forEach var="opt" items="${q.options}">
                                <label class="option-label">
                                    <input type="radio" name="q_${q.id}" value="${opt.scoreValue}" required>
                                    <span>${opt.optionText}</span>
                                </label>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>

                <div class="footer-nav">
                    <a href="${pageContext.request.contextPath}/assessment/select-module" class="back-arrow">&larr;</a>
                    
                    <button type="submit" class="submit-btn">
                        <c:choose>
                            <c:when test="${currentPage == totalPages}">Submit Assessment</c:when>
                            <c:otherwise>Next Page &rarr;</c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>