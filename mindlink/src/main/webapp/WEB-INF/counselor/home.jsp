<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<%-- CALCULATE UPCOMING COUNT --%>
<c:set var="bookedCount" value="0" />
<c:forEach items="${appointments}" var="app">
    <c:if test="${app.upcoming}">
        <c:set var="bookedCount" value="${bookedCount + 1}" />
    </c:if>
</c:forEach>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Counselor Home | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        :root {
            --bg-color: #FFF3E0; 
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-orange: #F77F00;
            --btn-hover: #D62828;
            --text-grey: #555;
        }

        body {
            font-family: 'Inter', sans-serif;
            /* 🟢 FANCY BACKGROUND: Gradient Mesh */
            background-color: var(--bg-color);
            background-image: 
                radial-gradient(circle at 10% 20%, rgba(247, 127, 0, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 90% 80%, rgba(72, 201, 176, 0.1) 0%, transparent 50%);
            margin: 0; padding: 0;
            color: var(--text-dark);
            overflow-x: hidden;
            min-height: 100vh;
            position: relative;
        }

        /* 🟢 ANIMATED BLOBS */
        .blob {
            position: absolute;
            filter: blur(50px);
            z-index: -1;
            opacity: 0.6;
            animation: float 10s ease-in-out infinite;
        }

        .blob-1 {
            top: -100px; left: -100px;
            width: 500px; height: 500px;
            background: rgba(247, 127, 0, 0.15); /* Orange Tint */
            border-radius: 40% 60% 70% 30%;
        }

        .blob-2 {
            bottom: -150px; right: -100px;
            width: 600px; height: 600px;
            background: rgba(72, 201, 176, 0.15); /* Teal Tint */
            border-radius: 60% 40% 30% 70%;
            animation-direction: reverse;
        }

        @keyframes float {
            0% { transform: translate(0, 0) rotate(0deg); }
            50% { transform: translate(30px, 20px) rotate(5deg); }
            100% { transform: translate(0, 0) rotate(0deg); }
        }

        /* --- Navbar (Glass Effect) --- */
        .navbar {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(15px);
            padding: 15px 50px;
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 4px 20px rgba(0,0,0,0.03);
            position: sticky; top: 0; z-index: 100;
        }

        .nav-links { display: flex; gap: 30px; }
        .nav-links a {
            text-decoration: none; color: #555; font-weight: 600; font-size: 16px;
            transition: color 0.2s; position: relative;
        }
        .nav-links a:hover, .nav-links a.active-link { color: var(--text-dark); }
        
        .nav-links a::after {
            content: ''; position: absolute; width: 0; height: 2px;
            bottom: -4px; left: 0; background-color: var(--btn-orange);
            transition: width 0.3s;
        }
        .nav-links a:hover::after, .nav-links a.active-link::after { width: 100%; }

        .btn-logout { color: #D62828 !important; }

        /* 🟢 LOGO ADJUSTMENTS */
        .logo {
            display: flex; align-items: center; gap: 10px;
            font-weight: 800;
            color: var(--text-dark); /* Use Variable */
            font-size: 26px; /* Adjusted size */
            text-decoration: none;
        }

        .logo-icon {
            width: 35px; height: 35px;
            display: flex; align-items: center; justify-content: center;
        }

        .logo-icon img {
            width: 100%; height: 100%; object-fit: contain;
        }

        /* --- Main Layout --- */
        .container {
            max-width: 900px; margin: 50px auto; padding: 0 20px 60px; text-align: center;
        }

        h1 { 
            font-size: 48px; font-weight: 800; color: var(--text-dark); 
            margin: 0 0 10px 0; 
            text-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        .subtitle { 
            font-size: 22px; font-weight: 600; color: #555; 
            margin-bottom: 50px; 
        }

        /* --- INFO CARD --- */
        .info-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.06);
            margin-bottom: 50px;
            text-align: center;
            border: 1px solid rgba(255,255,255,0.6);
        }

        .info-header {
            display: flex; align-items: center; justify-content: center; gap: 10px;
            font-size: 20px; font-weight: 700; color: var(--text-dark);
            margin-bottom: 15px;
        }
        
        .info-text { font-size: 16px; color: var(--text-grey); }

        /* --- SESSION LIST --- */
        .section-title {
            font-size: 28px; font-weight: 800; color: var(--text-dark);
            margin-bottom: 25px;
        }

        .session-card {
            background: white;
            border-radius: 16px;
            padding: 25px 35px;
            margin-bottom: 20px;
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
            transition: transform 0.2s, box-shadow 0.2s;
            position: relative; overflow: hidden;
        }
        
        .session-card::before {
            content: ''; position: absolute; left: 0; top: 0; bottom: 0; width: 6px;
            background: var(--btn-orange);
        }

        .session-card:hover { 
            transform: translateY(-5px); 
            box-shadow: 0 10px 25px rgba(0,0,0,0.1); 
        }

        .session-info { text-align: left; }
        
        .session-name { 
            font-size: 18px; font-weight: 700; color: var(--text-dark); 
            margin-bottom: 5px; 
        }
        
        .session-date { font-size: 14px; color: var(--text-grey); font-weight: 500; }

        .btn-view {
            background-color: var(--btn-orange);
            color: white;
            padding: 10px 30px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            border: none;
            box-shadow: 0 4px 10px rgba(247, 127, 0, 0.3);
            transition: all 0.2s;
        }
        .btn-view:hover { 
            background-color: #e06c00; 
            box-shadow: 0 6px 15px rgba(247, 127, 0, 0.4); 
            transform: translateY(-1px);
        }

        .empty-state {
            padding: 30px; background: rgba(255,255,255,0.6); 
            border-radius: 16px; color: #777; font-style: italic;
        }

    </style>
</head>
<body>

    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>

    <nav class="navbar">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/dashboard" class="active-link">Home</a>
            <a href="${pageContext.request.contextPath}/counselor/appointments">Appointment</a>
        </div>

        <a href="${pageContext.request.contextPath}/counselor/dashboard" class="logo">
            <div class="logo-icon">
                <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="Logo">
            </div>
            <span>MindLink</span>
        </a>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/profile">Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a>
        </div>
    </nav>

    <div class="container">
        <h1>Welcome back, ${not empty sessionScope.loggedInCounselor.name ? sessionScope.loggedInCounselor.name : 'Counselor'}!</h1>
        <div class="subtitle">Ready to support your students today?</div>

        <div class="info-card">
            <div class="info-header">
                <i class="fas fa-calendar-check" style="color: #F77F00;"></i> Session Overview
            </div>
            <div class="info-text">
                "You have <strong>${bookedCount}</strong> upcoming sessions scheduled. Prepare your notes and grab a coffee!"
            </div>
        </div>

        <div class="section-title">Upcoming Sessions</div>

        <c:forEach items="${appointments}" var="app">
            <c:if test="${app.upcoming}">
                <div class="session-card">
                    <div class="session-info">
                        <div class="session-name">Session with ${app.studentName != null ? app.studentName : 'Student'}</div>
                        <div class="session-date">
                            <i class="far fa-calendar-alt" style="margin-right: 5px;"></i> ${app.date} 
                            &nbsp;|&nbsp; 
                            <i class="far fa-clock" style="margin-right: 5px;"></i> ${app.time}
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/counselor/appointment?id=${app.id}" class="btn-view">
                        View Details
                    </a>
                </div>
            </c:if>
        </c:forEach>

        <c:if test="${bookedCount == 0}">
            <div class="empty-state">
                <i class="fas fa-mug-hot"></i> No upcoming sessions found. Enjoy your free time!
            </div>
        </c:if>

    </div>

</body>
</html>