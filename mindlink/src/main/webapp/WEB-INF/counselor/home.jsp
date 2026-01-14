<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<%-- 
    1. CALCULATE UPCOMING COUNT (Real-Time)
    We loop through appointments and check 'app.upcoming' instead of just 'status'.
--%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor Home | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --bg-peach: #FFF0E5;       
            --text-dark: #003B46;      
            --text-body: #666;         
            --card-white: #FFFFFF;
            --btn-orange: #FF9F1C;     
            --btn-hover: #E68A00;
        }

        body {
            font-family: 'Quicksand', sans-serif;
            background-color: var(--bg-peach);
            margin: 0;
            color: var(--text-dark);
            min-height: 100vh;
            overflow-x: hidden; 
        }

        /* --- Navbar --- */
        .navbar {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 15px 50px;
            display: flex; justify-content: space-between; align-items: center;
            position: sticky; top: 0; z-index: 100;
            box-shadow: 0 4px 20px rgba(0,0,0,0.02);
        }

        .nav-center-logo {
            font-size: 24px; font-weight: 700; color: var(--text-dark);
            display: flex; align-items: center; gap: 10px;
            position: absolute; left: 50%; transform: translateX(-50%);
        }

        .nav-links { display: flex; gap: 40px; align-items: center; }
        .nav-links a {
            text-decoration: none; color: var(--text-dark);
            font-weight: 700; font-size: 16px; transition: color 0.2s; position: relative;
        }
        
        .active-link { color: var(--btn-orange) !important; }
        .nav-links a::after {
            content: ''; position: absolute; width: 0; height: 3px;
            bottom: -5px; left: 0; background-color: var(--btn-orange);
            transition: width 0.3s; border-radius: 2px;
        }
        .nav-links a:hover::after { width: 100%; }
        .btn-logout { color: #d9534f !important; }

        /* --- Main Layout --- */
        .container {
            max-width: 800px; margin: 0 auto; padding: 60px 20px 100px; 
            text-align: center; position: relative; z-index: 2;
        }

        h1 { font-size: 42px; margin: 0 0 10px 0; color: var(--text-dark); }
        .subtitle { font-size: 20px; color: var(--text-body); margin-bottom: 50px; font-weight: 500; }

        /* --- Highlight Card --- */
        .highlight-card {
            background: var(--card-white); border-radius: 25px; padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.04); margin-bottom: 60px;
            display: flex; flex-direction: column; align-items: center;
            position: relative; overflow: hidden;
        }
        .highlight-card::before {
            content: ''; position: absolute; top: 0; left: 0; right: 0; height: 6px;
            background: linear-gradient(90deg, #FF9F1C, #2EC4B6);
        }
        .highlight-icon {
            font-size: 32px; color: var(--btn-orange); margin-bottom: 15px;
            background: #FFF4E6; width: 60px; height: 60px; border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
        }
        .highlight-text { font-size: 18px; line-height: 1.6; color: var(--text-body); max-width: 500px; }
        .highlight-stat { font-weight: 700; color: var(--text-dark); }

        /* --- Session Cards --- */
        .section-title { font-size: 28px; font-weight: 700; margin-bottom: 30px; color: var(--text-dark); }

        .session-card {
            background: var(--card-white); border-radius: 20px; padding: 25px 35px;
            margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.03); transition: transform 0.2s, box-shadow 0.2s;
            border: 1px solid transparent;
        }
        .session-card:hover {
            transform: translateY(-5px); box-shadow: 0 10px 25px rgba(0,0,0,0.06); border-color: #FFF0E5;
        }

        .session-left { display: flex; align-items: center; gap: 20px; text-align: left; }

        .avatar-circle {
            width: 50px; height: 50px; background-color: #E0F7FA; color: #006064;
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            font-size: 18px; font-weight: 700;
        }

        .session-details h3 { margin: 0 0 5px 0; font-size: 18px; color: var(--text-dark); }
        .session-meta { color: #888; font-size: 14px; display: flex; gap: 15px; }
        .session-meta i { color: var(--btn-orange); }

        .btn-view {
            background-color: var(--btn-orange); color: white; padding: 12px 28px;
            border-radius: 50px; text-decoration: none; font-weight: 700; font-size: 14px;
            transition: background 0.2s; border: none;
        }
        .btn-view:hover { background-color: var(--btn-hover); }

        /* --- Shapes --- */
        .shape { position: fixed; z-index: 1; opacity: 0.6; pointer-events: none; }
        .shape-blob-left {
            bottom: -50px; left: -50px; width: 300px; height: 300px;
            background: #C4E0E5; border-radius: 40% 60% 70% 30%;
            animation: float 8s ease-in-out infinite;
        }
        .shape-blob-right {
            top: 100px; right: -80px; width: 250px; height: 250px;
            background: #FFE0B2; border-radius: 60% 40% 30% 70%;
            animation: float 6s ease-in-out infinite reverse;
        }
        @keyframes float { 0% { transform: translate(0, 0); } 50% { transform: translate(10px, -20px); } 100% { transform: translate(0, 0); } }

    </style>
</head>
<body>

    <div class="shape shape-blob-left"></div>
    <div class="shape shape-blob-right"></div>

    <nav class="navbar">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/dashboard" class="active-link">Home</a>
            <a href="${pageContext.request.contextPath}/counselor/appointments">Appointment</a>
        </div>

        <div class="nav-center-logo">
            <i class="fas fa-heart"></i> MindLink
        </div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/profile">Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a>
        </div>
    </nav>

    <div class="container">
        <h1>Welcome back, ${sessionScope.loggedInCounselor.name}!</h1>
        <div class="subtitle">Ready to make a difference today?</div>

        <div class="highlight-card">
            <div class="highlight-icon"><i class="far fa-lightbulb"></i></div>
            <div class="highlight-text">
                <p style="margin: 0;">
                    You have <span class="highlight-stat">${bookedCount} upcoming sessions</span>. 
                </p>
            </div>
        </div>

        <div class="section-title">Upcoming Sessions</div>

        <c:forEach items="${appointments}" var="app">
            
            <%-- 
               2. FILTER LIST (Real-Time)
               Only show this card if it is TRULY upcoming (checked by Java Logic)
            --%>
            <c:if test="${app.upcoming}">
                <div class="session-card">
                    <div class="session-left">
                        <div class="avatar-circle"><i class="fas fa-user"></i></div>
                        <div class="session-details">
                            
                            <%-- 3. SHOW STUDENT NAME (Not ID) --%>
                            <h3>Session with ${app.studentName != null ? app.studentName : 'Unknown Student'}</h3>
                            
                            <div class="session-meta">
                                <span><i class="far fa-calendar"></i> ${app.date}</span>
                                <span><i class="far fa-clock"></i> ${app.time}</span>
                                <span><i class="fas fa-video"></i> ${app.type}</span>
                            </div>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/counselor/appointment?id=${app.id}" class="btn-view">View</a>
                </div>
            </c:if>
        </c:forEach>

        <c:if test="${bookedCount == 0}">
            <div style="background: rgba(255,255,255,0.5); padding: 20px; border-radius: 15px; color: #888;">
                <i class="fas fa-mug-hot"></i> No upcoming sessions found.
            </div>
        </c:if>
    </div>

</body>
</html>