<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Appointment History</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-teal: #48C9B0; /* The teal color from screenshot */
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
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

        .container { max-width: 900px; margin: 40px auto; }
        
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 30px; }

        /* HISTORY CARD STYLE */
        .history-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .history-card {
            background: var(--card-bg);
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between; /* Pushes text left, button right */
            align-items: center;
        }

        .card-info h3 {
            margin: 0 0 10px 0;
            font-size: 18px;
            font-weight: 700;
            color: #111;
        }
        
        .card-info p {
            margin: 0;
            font-size: 15px;
            color: #777; /* Grey text for date */
        }

        .btn-view {
            background-color: var(--btn-teal);
            color: white;
            text-decoration: none;
            padding: 10px 30px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
            transition: 0.2s;
        }
        .btn-view:hover { opacity: 0.9; }

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
        <h1>Appointment History</h1>

        <div class="history-list">
            
            <c:forEach items="${appointments}" var="app">
                <div class="history-card">
                    <div class="card-info">
                        <h3>Booking ID: ${app.id}</h3>
                        <p>${app.date}</p>
                    </div>
                    <a href="/counseling/history/view?id=${app.id}" class="btn-view" onclick="alert('Viewing details for ${app.id}')">View</a>
                </div>
            </c:forEach>

            <c:if test="${empty appointments}">
                <p style="text-align: center; color: #666;">No appointment history found.</p>
            </c:if>

        </div>
    </div>

</body>
</html>