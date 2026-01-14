<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${student.studentId == null ? 'New' : 'Edit'} Student - MindLink</title>
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
            max-width: 800px;
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

        /* Cards */
        .card {
            background: var(--card-bg);
            border-radius: 40px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        .card-header {
            margin-bottom: 30px;
        }

        .card-header h3 {
            font-size: 28px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0;
        }

        /* Form */
        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-dark);
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 20px;
            font-size: 16px;
            font-family: 'Inter', sans-serif;
            transition: border-color 0.3s;
            box-sizing: border-box;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--btn-teal);
        }

        .form-control:disabled {
            background-color: #f5f5f5;
            cursor: not-allowed;
        }

        .form-text {
            font-size: 12px;
            color: #888;
            margin-top: 5px;
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

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
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
        .shape { position: absolute; z-index: 1; pointer-events: none; }
        
        .shape-left { top: 20%; left: -5%; width: 250px; opacity: 0.8; }
        .shape-right-bottom { bottom: -10%; right: -5%; width: 300px; opacity: 0.8; }

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
        <div class="card">
            <div class="card-header">
                <h3>${student.studentId == null ? 'New Student' : 'Edit Student'}</h3>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    <span>${error}</span>
                    <button class="btn-close" onclick="this.parentElement.remove()">&times;</button>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/admin/user-management/students/save" method="post">
                <c:choose>
                    <c:when test="${student.studentId != null && !empty student.studentId}">
                        <input type="hidden" name="studentId" value="${student.studentId}" />
                        <div class="form-group">
                            <label class="form-label">Student ID</label>
                            <input type="text" class="form-control" value="${student.studentId}" disabled />
                            <small class="form-text">Student ID cannot be changed</small>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="form-group">
                            <label class="form-label">Student ID</label>
                            <input type="text" name="studentId" class="form-control" placeholder="e.g. S123456" required />
                            <small class="form-text">Enter the Student ID (must be unique)</small>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="name" class="form-control" value="${student.name}" required />
                </div>

                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" value="${student.email}" required />
                </div>

                <div class="form-group">
                    <label class="form-label">Password ${student.studentId != null ? '(Leave blank to keep current)' : ''}</label>
                    <input type="password" name="password" class="form-control" ${student.studentId==null ? 'required' : ''} />
                </div>

                <div class="form-group">
                    <label class="form-label">Phone</label>
                    <input type="text" name="phone" class="form-control" value="${student.phone}" />
                </div>

                <div class="form-group">
                    <label class="form-label">Faculty</label>
                    <input type="text" name="faculty" class="form-control" value="${student.faculty}" />
                </div>

                <div class="form-group">
                    <label class="form-label">Year</label>
                    <input type="number" name="year" class="form-control" value="${student.year}" />
                </div>

                <div class="btn-group">
                    <a href="${pageContext.request.contextPath}/admin/user-management/students" class="btn btn-pink">Cancel</a>
                    <button type="submit" class="btn btn-teal">Save Student</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
