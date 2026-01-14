<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Counselor Requests - MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-yellow: #F2C94C;
            --btn-teal: #48C9B0;
            --btn-pink: #F497AA;
            --btn-green: #27AE60;
            --btn-red: #E74C3C;
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

        .btn-green {
            background-color: var(--btn-green);
        }

        .btn-red {
            background-color: var(--btn-red);
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

        .status-badge {
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-pending {
            background: #FFF3CD;
            color: #856404;
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

        .back-link {
            color: #003B46;
            text-decoration: none;
            font-size: 14px;
            margin-bottom: 20px;
            display: inline-block;
        }

        .back-link:hover {
            text-decoration: underline;
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
    <img src="${pageContext.request.contextPath}/images/assessment-right.png" class="shape shape-right-bottom"
        alt="">

    <div class="container">
        <a href="${pageContext.request.contextPath}/admin/user-management/students" class="back-link">← Back to User Management</a>

        <div class="page-header">
            <h2>Pending Counselor Applications</h2>
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
                            <th>Counselor ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Certification ID</th>
                            <th>Location</th>
                            <th>Education</th>
                            <th>Specialization</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pendingCounselors}" var="counselor">
                            <tr>
                                <td>${counselor.counselorId}</td>
                                <td><b>${counselor.name}</b></td>
                                <td>${counselor.email}</td>
                                <td>${counselor.phone}</td>
                                <td><b style="color: #003B46;">${counselor.certId}</b></td>
                                <td>${counselor.location}</td>
                                <td>${counselor.education}</td>
                                <td>${counselor.specialization}</td>
                                <td>
                                    <span class="status-badge status-pending">Pending</span>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/admin/user-management/counselors/approve/${counselor.counselorId}" method="post" style="display: inline;">
                                        <button type="submit" class="btn btn-sm btn-green" style="margin-right: 5px;"
                                            onclick="return confirm('Approve this counselor application?\n\nName: ${counselor.name}\nCert ID: ${counselor.certId}')">
                                            Approve
                                        </button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/admin/user-management/counselors/reject/${counselor.counselorId}" method="post" style="display: inline;">
                                        <button type="submit" class="btn btn-sm btn-red"
                                            onclick="return confirm('Reject this counselor application?\n\nName: ${counselor.name}\nCert ID: ${counselor.certId}')">
                                            Reject
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty pendingCounselors}">
                            <tr>
                                <td colspan="10" style="text-align: center; padding: 40px; color: #888;">
                                    No pending counselor applications.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>

</html>

