<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Manage Chatbot Rules</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
            <style>
                :root {
                    --bg-color: #FFF3E0;
                    --text-dark: #003049;
                }

                body {
                    font-family: 'Inter', sans-serif;
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
                    max-width: 1000px;
                    margin: 40px auto;
                    padding: 0 40px;
                }

                .page-title-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 30px;
                }

                .btn-add {
                    background: transparent;
                    border: none;
                    font-size: 32px;
                    cursor: pointer;
                    color: #000;
                    text-decoration: none;
                }

                .rule-card {
                    background: #FFF5F5;
                    border-radius: 20px;
                    padding: 30px;
                    margin-bottom: 20px;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
                    position: relative;
                }

                .keyword-text {
                    font-size: 20px;
                    font-weight: 800;
                    margin-bottom: 10px;
                    color: #000;
                }

                .response-text {
                    font-size: 14px;
                    color: #666;
                    font-weight: 400;
                    line-height: 1.6;
                }

                .actions {
                    position: absolute;
                    top: 20px;
                    right: 20px;
                    display: flex;
                    gap: 10px;
                }

                .action-icon {
                    text-decoration: none;
                    font-size: 20px;
                    color: #000;
                    padding: 5px;
                    border-radius: 5px;
                    transition: background 0.2s;
                }

                .action-icon:hover {
                    background: rgba(0, 0, 0, 0.1);
                }

                .delete-icon {
                    color: #d32f2f;
                }
            </style>
        </head>

        <body>
            <!-- Header Navigation -->
            <div class="header">
                <div class="nav-left">
                    <a href="${pageContext.request.contextPath}/admin/home">Home</a>
                    <a href="${pageContext.request.contextPath}/admin/modules/dashboard">Module</a>
                    <a href="${pageContext.request.contextPath}/admin/tips">Tips</a>
                    <a href="${pageContext.request.contextPath}/admin/user-management">User Management</a>
                </div>

                <a href="${pageContext.request.contextPath}/admin/home" class="logo">
                    <div class="logo-icon">
                        <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
                    </div>
                    <span>MindLink</span>
                </a>

                <div class="nav-right">
                    <a href="${pageContext.request.contextPath}/admin/chatbot">Chatbot</a>
                    <a href="${pageContext.request.contextPath}/admin/forum/posts">Manage Forums</a>
                    <a href="${pageContext.request.contextPath}/admin/profile">Profile</a>
                </div>
            </div>

            <div class="container">

                <div class="page-title-row">
                    <h1>Chatbot Rules Management</h1>
                    <div style="display: flex; align-items: center; gap: 15px;">
                        <a href="${pageContext.request.contextPath}/admin/chatbot/add" class="btn-add">+</a>
                        <a href="${pageContext.request.contextPath}/admin/home"
                            style="font-size:14px; color:#666; text-decoration:none;">Back</a>
                    </div>
                </div>

                <c:forEach var="rule" items="${rules}">
                    <div class="rule-card">
                        <div class="keyword-text">Keyword: "${rule.keyword}"</div>
                        <div class="response-text">${rule.response}</div>

                        <div class="actions">
                            <a href="${pageContext.request.contextPath}/admin/chatbot/edit?id=${rule.id}"
                                class="action-icon">✏️</a>
                            <a href="${pageContext.request.contextPath}/admin/chatbot/delete?id=${rule.id}"
                                class="action-icon delete-icon"
                                onclick="return confirm('Are you sure you want to delete this rule?')">🗑️</a>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty rules}">
                    <div style="text-align: center; padding: 40px; color: #666;">
                        <p>No chatbot rules found. Click + to add a new rule.</p>
                    </div>
                </c:if>

            </div>
        </body>

        </html>