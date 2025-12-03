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

        /* Navbar */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 40px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); margin: 0 15px; font-weight: 500; }
        .logo { font-size: 28px; font-weight: 800; color: var(--text-dark); }

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