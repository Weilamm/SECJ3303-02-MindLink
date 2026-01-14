<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Edit My Profile</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                rel="stylesheet">
            <style>
                :root {
                    --bg-color: #FFF3E0;
                    --text-dark: #003049;
                    --text-blue: #2F80ED;
                    --card-bg: #FDF3E7;
                    --btn-dark: #013B46;
                    --btn-teal: #48C9B0;
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
                    background-color: var(--card-bg);
                    border-radius: 50px;
                    padding: 60px 80px;
                    position: relative;
                    min-height: 500px;
                }

                /* Back Button */
                .back-btn {
                    position: absolute;
                    top: 40px;
                    left: 40px;
                    font-size: 32px;
                    text-decoration: none;
                    color: #000;
                }

                h2 {
                    font-size: 32px;
                    font-weight: 700;
                    margin-bottom: 40px;
                    color: var(--text-dark);
                }

                .form-group {
                    margin-bottom: 25px;
                }

                label {
                    display: block;
                    font-weight: 600;
                    margin-bottom: 8px;
                    color: var(--text-dark);
                    font-size: 18px;
                }

                input,
                select {
                    width: 100%;
                    padding: 12px 15px;
                    border: 2px solid #e0e0e0;
                    border-radius: 15px;
                    font-family: inherit;
                    font-size: 16px;
                    transition: border-color 0.3s;
                    box-sizing: border-box;
                }

                input:focus,
                select:focus {
                    outline: none;
                    border-color: var(--btn-teal);
                }

                input[readonly] {
                    background-color: #f5f5f5;
                    cursor: not-allowed;
                }

                .form-actions {
                    display: flex;
                    gap: 15px;
                    margin-top: 40px;
                }

                .btn {
                    padding: 15px 40px;
                    border-radius: 30px;
                    font-size: 18px;
                    font-weight: 600;
                    border: none;
                    cursor: pointer;
                    text-decoration: none;
                    display: inline-block;
                    transition: 0.2s;
                    text-align: center;
                }

                .btn-save {
                    background-color: var(--btn-teal);
                    color: white;
                }

                .btn-cancel {
                    background-color: #999;
                    color: white;
                }

                .btn:hover {
                    opacity: 0.9;
                }

                .error-msg {
                    background-color: #ffebee;
                    color: #c62828;
                    padding: 15px;
                    border-radius: 10px;
                    margin-bottom: 20px;
                }

                .success-msg {
                    background-color: #e8f5e9;
                    color: #2e7d32;
                    padding: 15px;
                    border-radius: 10px;
                    margin-bottom: 20px;
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
                <a href="${pageContext.request.contextPath}/profile" class="back-btn">
                    <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="black" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 14L4 9l5-5" />
                        <path d="M4 9h10c4 0 7 3 7 7v1" />
                    </svg>
                </a>

                <h2>Edit Profile</h2>

                <c:if test="${not empty error}">
                    <div class="error-msg">${error}</div>
                </c:if>

                <c:if test="${not empty success}">
                    <div class="success-msg">${success}</div>
                </c:if>

                <form action="${pageContext.request.contextPath}/profile/update" method="post">
                    <div class="form-group">
                        <label>Student ID</label>
                        <input type="text" value="${student.studentId}" readonly>
                        <small style="color: #666; font-size: 14px;">Student ID cannot be changed</small>
                    </div>

                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" value="${student.name}" readonly>
                        <small style="color: #666; font-size: 14px;">Name cannot be changed</small>
                    </div>

                    <div class="form-group">
                        <label>Year</label>
                        <input type="text" value="Year ${student.year}" readonly>
                        <small style="color: #666; font-size: 14px;">Year cannot be changed</small>
                    </div>

                    <div class="form-group">
                        <label>Email Address *</label>
                        <input type="email" name="email" value="${student.email}" required>
                    </div>

                    <div class="form-group">
                        <label>Phone Number *</label>
                        <input type="text" name="phone" value="${student.phone != null ? student.phone : ''}"
                            placeholder="e.g., +60123456789">
                    </div>

                    <div class="form-group">
                        <label>Faculty</label>
                        <input type="text" value="${student.faculty}" readonly>
                        <small style="color: #666; font-size: 14px;">Faculty cannot be changed</small>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-save">Save Changes</button>
                        <a href="${pageContext.request.contextPath}/profile" class="btn btn-cancel">Cancel</a>
                    </div>
                </form>
            </div>

        </body>

        </html>