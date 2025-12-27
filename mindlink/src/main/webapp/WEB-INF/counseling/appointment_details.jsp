<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Appointment Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-teal: #48C9B0; /* Teal color from your screenshot */
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

        .card {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 50px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            min-height: 400px; /* Gives it that spacious look */
            position: relative;
        }

        /* GRID LAYOUT */
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr; /* 2 Columns */
            gap: 40px; /* Bigger gap */
            margin-bottom: 80px; /* Space before the button */
        }
        
        .detail-row { margin-bottom: 25px; font-size: 16px; }
        .label { font-weight: 400; color: #333; display: inline-block; width: 140px; }
        .value { font-weight: 500; color: #000; }

        /* BUTTONS */
        .action-area {
            display: flex;
            justify-content: center;
        }

        .btn-feedback {
            background-color: var(--btn-teal);
            color: white;
            padding: 12px 30px;
            border-radius: 6px; /* Slightly squared corners */
            border: none;
            font-weight: 500;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: 0.2s;
        }
        
        .btn-feedback:hover { opacity: 0.9; transform: translateY(-2px); }

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
        <h1>Appointment Details</h1>

        <div class="card">

            <div class="details-grid">
                <div>
                    <div class="detail-row">
                        <span class="label">Booking ID:</span>
                        <span class="value">${app.id}</span>
                    </div>
                    <div class="detail-row">
                        <span class="label">Session Type:</span>
                        <span class="value">${app.type}</span>
                    </div>
                    <div class="detail-row">
                        <span class="label">Date:</span>
                        <span class="value">${app.date}</span>
                    </div>
                </div>

                <div>
                    <div class="detail-row">
                        <span class="label">Counselor Name:</span>
                        <span class="value">${app.counselorName}</span>
                    </div>
                    <div class="detail-row">
                        <span class="label">Venue:</span>
                        <span class="value">${app.venue}</span>
                    </div>
                    <div class="detail-row">
                        <span class="label">Time:</span>
                        <span class="value">${app.time}</span>
                    </div>
                </div>
            </div>

            <div class="action-area">
                <a href="/counseling/history/feedback?id=${app.id}" class="btn-feedback" onclick="alert('Feedback form coming soon!')">
                    Write a Feedback ✏️
                </a>
            </div>

        </div>
    </div>

</body>
</html>