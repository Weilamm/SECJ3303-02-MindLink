<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Student List - MindLink</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
        <style>
            :root {
                --bg-color: #FFF3E0;
                --text-dark: #003049;
                --card-bg: #FFFFFF;
                --btn-yellow: #F2C94C;
                --btn-teal: #48C9B0;
                --btn-pink: #F497AA;
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
                margin: 40px auto;
                position: relative;
                z-index: 10;
                padding: 0 40px;
            }

            h1 {
                font-size: 48px;
                font-weight: 800;
                margin-bottom: 30px;
                color: var(--text-dark);
                text-align: center;
            }

            .page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }

            .page-header h2 {
                font-size: 32px;
                font-weight: 700;
                color: var(--text-dark);
                margin: 0;
            }

            /* Cards */
            .card {
                background: var(--card-bg);
                border-radius: 40px;
                padding: 40px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
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

            .btn-yellow {
                background-color: var(--btn-yellow);
            }

            .btn-teal {
                background-color: var(--btn-teal);
            }

            .btn-pink {
                background-color: var(--btn-pink);
            }

            .btn:hover {
                opacity: 0.9;
            }

            .btn-sm {
                padding: 8px 20px;
                font-size: 14px;
            }

            /* Table */
            .table-container {
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background: white;
            }

            thead {
                background-color: var(--text-dark);
                color: white;
            }

            th {
                padding: 15px;
                text-align: left;
                font-weight: 600;
                font-size: 14px;
            }

            td {
                padding: 15px;
                border-bottom: 1px solid #f0f0f0;
            }

            tbody tr:hover {
                background-color: #f9f9f9;
            }

            /* Alerts */
            .alert {
                padding: 15px 20px;
                border-radius: 20px;
                margin-bottom: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .alert-success {
                background-color: #d4edda;
                color: #155724;
            }

            .alert-danger {
                background-color: #f8d7da;
                color: #721c24;
            }

            .btn-close {
                background: none;
                border: none;
                font-size: 20px;
                cursor: pointer;
                opacity: 0.5;
            }

            .btn-close:hover {
                opacity: 1;
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
                <a href="${pageContext.request.contextPath}/admin/home">Home</a>
                <a href="${pageContext.request.contextPath}/admin/modules">Module</a>
                <a href="${pageContext.request.contextPath}/admin/tips">Tips</a>
                <a href="${pageContext.request.contextPath}/admin/user-management">User Management</a>
            </div>

            <a href="${pageContext.request.contextPath}/home" class="logo">
                <div class="logo-icon">
                    <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
                </div>
                <span>MindLink</span>
            </a>

            <div class="nav-right">
                <a href="${pageContext.request.contextPath}/admin/chatbot">Chatbot</a>
                <a href="${pageContext.request.contextPath}/admin/forum/manage">Forum</a>
                <a href="${pageContext.request.contextPath}/admin/profile">Profile</a>
            </div>
        </div>

        <img src="${pageContext.request.contextPath}/images/assessment-left.png" class="shape shape-left" alt="">
        <img src="${pageContext.request.contextPath}/images/assessment-right.png" class="shape shape-right-bottom"
            alt="">

        <div class="container">
            <div class="page-header">
                <h2>Students</h2>
                <a href="${pageContext.request.contextPath}/admin/user-management/students/new" class="btn btn-teal">Add
                    New Student</a>
            </div>

            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    <span>${success}</span>
                    <button class="btn-close" onclick="this.parentElement.remove()">&times;</button>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    <span>${error}</span>
                    <button class="btn-close" onclick="this.parentElement.remove()">&times;</button>
                </div>
            </c:if>

            <div class="card">
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Faculty</th>
                                <th>Year</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${students}" var="student">
                                <tr>
                                    <td>${student.studentId}</td>
                                    <td>${student.name}</td>
                                    <td>${student.email}</td>
                                    <td>${student.faculty}</td>
                                    <td>${student.year}</td>
                                    <td>${student.createdAt != null ? student.createdAt.toString().substring(0, 16) :
                                        'N/A'}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/user-management/students/edit/${student.studentId}"
                                            class="btn btn-sm btn-yellow" style="margin-right: 5px;">Edit</a>
                                        <a href="${pageContext.request.contextPath}/admin/user-management/students/delete/${student.studentId}"
                                            class="btn btn-sm btn-pink"
                                            onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty students}">
                                <tr>
                                    <td colspan="7" style="text-align: center; padding: 40px; color: #888;">No students
                                        found.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>


            <!-- Import Counselor List Fragment -->
            <c:import url="/admin/user-management/counselors/fragment" />
        </div>

    </body>

    </html>