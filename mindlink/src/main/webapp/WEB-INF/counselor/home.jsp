<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Counselor Dashboard | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root { --primary: #004D40; --accent: #26A69A; --bg: #F5F7FA; }
        body { font-family: 'Inter', sans-serif; background-color: var(--bg); margin: 0; }
        
        /* Navbar */
        .navbar { background: white; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .brand { font-weight: 700; font-size: 20px; color: var(--primary); display: flex; align-items: center; gap: 10px; }
        .user-info { display: flex; align-items: center; gap: 15px; }
        .btn-logout { color: #d32f2f; text-decoration: none; font-weight: 600; font-size: 14px; }

        /* Dashboard Grid */
        .container { max-width: 1200px; margin: 40px auto; padding: 0 20px; }
        .dashboard-header { margin-bottom: 30px; }
        .stats-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 30px; }
        
        .stat-card { background: white; padding: 25px; border-radius: 12px; box-shadow: 0 2px 5px rgba(0,0,0,0.05); }
        .stat-card h3 { margin: 0; color: #666; font-size: 14px; font-weight: 500; }
        .stat-card .number { font-size: 32px; font-weight: 700; color: var(--primary); margin: 10px 0 0 0; }

        /* Appointments Table */
        .section-card { background: white; border-radius: 12px; box-shadow: 0 2px 5px rgba(0,0,0,0.05); overflow: hidden; }
        .card-header { padding: 20px 25px; border-bottom: 1px solid #eee; display: flex; justify-content: space-between; align-items: center; }
        .card-header h2 { margin: 0; font-size: 18px; color: #333; }
        
        table { width: 100%; border-collapse: collapse; }
        th { text-align: left; padding: 15px 25px; background: #fafafa; color: #666; font-size: 13px; font-weight: 600; }
        td { padding: 20px 25px; border-bottom: 1px solid #eee; font-size: 14px; color: #333; }
        tr:last-child td { border-bottom: none; }
        
        .status-badge { padding: 5px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; }
        .status-upcoming { background: #E0F2F1; color: #00695C; }
        .btn-action { padding: 8px 16px; background: var(--primary); color: white; border: none; border-radius: 6px; cursor: pointer; text-decoration: none; font-size: 13px; }
        .btn-action:hover { opacity: 0.9; }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="brand">
            <i class="fas fa-heartbeat"></i> MindLink Staff
        </div>
        <div class="user-info">
            <span>Welcome, <strong>${sessionScope.loggedInCounselor.name}</strong></span>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a>
        </div>
    </nav>

    <div class="container">
        <div class="dashboard-header">
            <h1>Counselor Dashboard</h1>
            <p style="color: #666;">Manage your upcoming sessions and student requests.</p>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <h3>Total Appointments</h3>
                <p class="number">${appointments.size()}</p>
            </div>
            <div class="stat-card">
                <h3>Pending Requests</h3>
                <p class="number">3</p> </div>
            <div class="stat-card">
                <h3>Completed Sessions</h3>
                <p class="number">12</p> </div>
        </div>

        <div class="section-card">
            <div class="card-header">
                <h2>Upcoming Appointments</h2>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student Name</th> <th>Date & Time</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${appointments}" var="app">
                        <tr>
                            <td>#${app.id}</td>
                            <td>Student User</td> <td>${app.date} <br><span style="color:#888; font-size:12px">${app.time}</span></td>
                            <td>${app.type}</td>
                            <td><span class="status-badge status-upcoming">Confirmed</span></td>
                            <td>
                                <a href="#" class="btn-action">View Details</a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <c:if test="${empty appointments}">
                        <tr>
                            <td colspan="6" style="text-align:center; padding: 40px; color: #888;">No appointments scheduled.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>