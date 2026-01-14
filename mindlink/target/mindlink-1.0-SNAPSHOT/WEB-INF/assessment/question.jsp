<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Expression Analysis</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                rel="stylesheet">
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
                    margin: 0;
                    padding: 0;
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
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    min-height: calc(100vh - 81px);
                    /* minus header */
                    padding: 40px;
                }

                /* The White Card */
                .assessment-card {
                    background: white;
                    width: 1000px;
                    border-radius: 40px;
                    padding: 40px;
                    position: relative;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                }

                /* Header Elements */
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
                    font-weight: bold;
                    font-size: 20px;
                    text-decoration: none;
                    cursor: pointer;
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

                .subtitle {
                    color: #666;
                    font-size: 16px;
                }

                /* Content Layout */
                .content-row {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    gap: 50px;
                    margin-bottom: 40px;
                }

                .illustration img {
                    width: 250px;
                    height: auto;
                }

                /* Input Area Styling */
                .input-box {
                    background-color: var(--input-bg);
                    border-radius: 20px;
                    padding: 30px;
                    width: 450px;
                    position: relative;
                }

                textarea {
                    width: 100%;
                    height: 150px;
                    background: transparent;
                    border: none;
                    color: white;
                    font-size: 20px;
                    font-family: inherit;
                    resize: none;
                    outline: none;
                    line-height: 1.5;
                }

                textarea::placeholder {
                    color: rgba(255, 255, 255, 0.5);
                }

                .char-count {
                    position: absolute;
                    bottom: 15px;
                    right: 20px;
                    color: rgba(255, 255, 255, 0.6);
                    font-size: 12px;
                    display: flex;
                    align-items: center;
                    gap: 5px;
                }

                /* Voice Button */
                .voice-btn {
                    display: block;
                    margin: 20px auto 0 auto;
                    background-color: var(--btn-green);
                    color: white;
                    border: none;
                    padding: 10px 25px;
                    border-radius: 30px;
                    font-weight: 600;
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    width: fit-content;
                }

                /* Footer Navigation */
                .footer-nav {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 0 40px;
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
                    font-size: 24px;
                    text-decoration: none;
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
                }
            </style>
        </head>

        <body>

            <!-- Header Navigation -->
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

                    <a href="/assessment" class="close-btn">✕</a>
                    <div class="progress-pill">10 Of 10</div>

                    <div class="card-header">
                        <h1>${title}</h1>
                        <p class="subtitle">Please answer the following questions honestly.</p>
                    </div>

                    <form action="${pageContext.request.contextPath}/assessment/submit" method="post">
                        <c:forEach var="question" items="${questions}" varStatus="status">
                            <div class="content-row" style="display: block; text-align: left; margin-bottom: 30px;">
                                <h3 style="margin-bottom: 15px;">${status.index + 1}. ${question.questionText}</h3>

                                <div class="options-group" style="display: flex; gap: 20px; flex-wrap: wrap;">
                                    <c:forEach var="option" items="${question.options}">
                                        <label
                                            style="background: var(--bg-color); padding: 10px 20px; border-radius: 10px; cursor: pointer; display: flex; align-items: center; gap: 10px;">
                                            <input type="radio" name="q_${question.id}" value="${option.scoreValue}"
                                                required>
                                            <span style="font-weight: 500;">${option.optionText}</span>
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>

                        <div class="footer-nav">
                            <a href="${pageContext.request.contextPath}/assessment" class="back-arrow">&larr;</a>
                            <button type="submit" class="submit-btn">Submit Assessment</button>
                        </div>
                    </form>

                </div>
            </div>

            <script>
                function updateCount(textarea) {
                    document.getElementById('count').innerText = textarea.value.length;
                }
            </script>

        </body>

        </html>