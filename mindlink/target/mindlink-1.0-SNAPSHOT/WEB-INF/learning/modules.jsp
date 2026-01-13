<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Learning Modules - MindLink</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap"
                rel="stylesheet">
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
                    margin: 0;
                    padding: 0;
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

                .nav-left a,
                .nav-right a {
                    text-decoration: none;
                    color: #00313e;
                    font-size: 16px;
                    font-weight: 500;
                    transition: color 0.3s;
                }

                .nav-left a:hover,
                .nav-right a:hover {
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

                /* Module Card */
                .module-card {
                    background-color: var(--card-bg);
                    border-radius: 40px;
                    padding: 30px;
                    display: flex;
                    gap: 40px;
                    align-items: center;
                    margin-bottom: 30px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                    transition: transform 0.2s;
                    cursor: pointer;
                    text-decoration: none;
                    color: inherit;
                }

                .module-card:hover {
                    transform: translateY(-5px);
                }

                /* Left Image */
                .module-img {
                    width: 300px;
                    height: 200px;
                    object-fit: cover;
                    border-radius: 20px;
                    background-color: #eee;
                }

                /* Right Content */
                .module-content {
                    flex: 1;
                }

                .module-title {
                    font-size: 24px;
                    font-weight: 800;
                    color: var(--text-dark);
                    margin-bottom: 15px;
                }

                .module-desc {
                    font-size: 16px;
                    color: #555;
                    line-height: 1.6;
                    margin-bottom: 25px;
                }

                /* Progress Bar */
                .progress-section {
                    display: flex;
                    align-items: center;
                    gap: 15px;
                }

                .progress-label {
                    font-weight: 700;
                    font-size: 14px;
                    color: var(--text-dark);
                }

                .progress-track {
                    flex: 1;
                    height: 15px;
                    background-color: var(--bar-bg);
                    border-radius: 10px;
                    overflow: hidden;
                    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
                }

                .progress-fill {
                    height: 100%;
                    background-color: var(--btn-teal);
                    width: 0%;
                    border-radius: 10px;
                }

                .progress-text {
                    font-size: 12px;
                    color: #777;
                    font-weight: 600;
                    min-width: 80px;
                    text-align: right;
                }

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
                    <a href="${pageContext.request.contextPath}/home">Home</a>
                    <a href="${pageContext.request.contextPath}/learning" style="font-weight:700;">Learning</a>
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

            <img src="${pageContext.request.contextPath}/images/assessment-left.png" class="shape shape-left" alt="">
            <img src="${pageContext.request.contextPath}/images/assessment-right.png" class="shape shape-right-bottom"
                alt="">

            <div class="container">
                <h1>Learning Modules</h1>

                <c:forEach items="${modules}" var="module">
                    <a href="${pageContext.request.contextPath}/learning/modules/view?id=${module.moduleId}"
                        class="module-card">
                        <img src="${pageContext.request.contextPath}/images/${module.imagePath}" class="module-img"
                            alt="${module.title}">

                        <div class="module-content">
                            <div class="module-title">${module.title}</div>
                            <div class="module-desc">${module.description}</div>

                            <div class="progress-section">
                                <span class="progress-label">Progress :</span>
                                <div class="progress-track">
                                    <div class="progress-fill" style="width: ${module.progressPercentage}%;"></div>
                                </div>
                                <span class="progress-text">${module.progressPercentage}% Completed</span>
                            </div>
                        </div>
                    </a>
                </c:forEach>

            </div>

            <!-- Script removed as we now use server-side data -->
        </body>

        </html>