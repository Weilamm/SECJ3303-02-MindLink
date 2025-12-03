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

        /* Navbar */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 40px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); margin: 0 15px; font-weight: 500; }
        .logo { font-size: 28px; font-weight: 800; color: var(--text-dark); }

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