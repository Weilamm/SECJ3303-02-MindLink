<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Counseling & Appointment</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* --- THEME COLORS --- */
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --text-body: #333;
            --btn-pink: #F497AA; /* Soft pink from screenshot */
            --btn-pink-hover: #E58699;
            --card-bg: #FFFFFF;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 0;
            color: var(--text-dark);
        }

        /* Navbar (Standard) */
        .navbar {
            display: flex; justify-content: space-between; align-items: center;
            padding: 20px 50px; background-color: transparent;
        }
        .nav-links a {
            text-decoration: none; color: var(--text-dark);
            margin: 0 15px; font-weight: 500;
        }
        .logo { font-size: 28px; font-weight: 800; display: flex; align-items: center; gap: 10px; }

        /* Main Layout */
        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 20px;
        }

        /* Header Section */
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 10px; }
        .subtitle { font-size: 16px; color: #666; margin-bottom: 30px; font-weight: 400; }

        /* Action Buttons Row */
        .action-bar {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
        }

        .btn {
            padding: 12px 24px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            border: none;
            transition: 0.2s;
        }

        .btn-primary {
            background-color: var(--btn-pink);
            color: white;
        }
        .btn-primary:hover { background-color: var(--btn-pink-hover); }

        .btn-outline {
            background-color: #F5F7FA;
            color: var(--text-dark);
            border: 1px solid #E0E0E0;
        }
        .btn-outline:hover { background-color: #EAECEF; }

        /* Appointments Card */
        .card {
            background: var(--card-bg);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            padding: 30px;
            min-height: 400px; /* Force height to look like screenshot */
        }

        .card-header {
            margin-bottom: 20px;
        }
        .card-header h2 { font-size: 20px; margin: 0 0 5px 0; }
        .card-header span { font-size: 14px; color: #777; }

        /* Empty State Styling */
        .empty-state {
            display: flex;
            height: 300px;
            justify-content: center;
            align-items: center;
            color: #888;
            font-size: 14px;
        }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="/">Home</a>
            <a href="/learning">Learning</a>
        </div>
        <div class="logo">❤️ MindLink</div>
        <div class="nav-links">
            <a href="#">Forum</a>
            <a href="#">Profile</a>
        </div>
    </nav>

    <div class="container">
        <h1>Counseling & Appointment</h1>
        <p class="subtitle">Manage your appointments and track your wellness journey</p>

        <div class="action-bar">
            <a href="/counseling/booking" class="btn btn-primary">Book New Appointment</a>
            <a href="/counseling/browse" class="btn btn-primary">Browse Counselors</a>
            <a href="/counseling/history" class="btn btn-outline">Appointment History</a>
        </div>

        <div class="card">
            <div class="card-header">
                <h2>Your Appointments</h2>
                <span>${appointments.size()} appointments scheduled</span>
            </div>

            <c:choose>
                
                <c:when test="${empty appointments}">
                    <div class="empty-state">
                        No appointments scheduled yet.
                    </div>
                </c:when>
                
                <c:otherwise>
                    <c:forEach items="${appointments}" var="app">
                        
                        <div style="background: #F9F9F9; border-left: 5px solid #F497AA; padding: 20px; border-radius: 8px; margin-bottom: 15px; display: flex; justify-content: space-between; align-items: center;">
                            <div>
                                <h3 style="margin: 0 0 5px 0; font-size: 18px;">${app.counselorName}</h3>
                                <div style="color: #666; font-size: 14px; margin-bottom: 5px;">📅 ${app.date} &bull; ⏰ ${app.time}</div>
                                <div style="font-size: 13px; color: #888;">${app.type} &bull; ${app.venue}</div>
                            </div>
                            <div>
                                <span style="background: #E0F7FA; color: #006064; padding: 5px 10px; border-radius: 20px; font-size: 12px; font-weight: bold;">Upcoming</span>
                            </div>
                        </div>

                    </c:forEach>
                </c:otherwise>
                
            </c:choose>
        </div>
    </div>
</body>
</html>