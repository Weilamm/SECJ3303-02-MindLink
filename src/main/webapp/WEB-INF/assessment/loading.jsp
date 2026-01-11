<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Calculating Score...</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --text-green: #4CAF50; /* Green color for the subtext */
            --card-bg: #FFF8F0; /* Slightly lighter beige for card */
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
            color: var(--text-dark);
        }

        /* Navbar */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 40px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); margin: 0 15px; font-weight: 600; }
        .logo { font-size: 32px; font-weight: 800; color: var(--text-dark); }

        /* Container */
        .container {
            display: flex; justify-content: center; align-items: center;
            min-height: 80vh;
        }

        /* The Card */
        .loading-card {
            background-color: #FFF9F2; /* Very light beige card */
            width: 1000px;
            height: 600px; /* Fixed height for consistent look */
            border-radius: 60px; /* Very round corners like screenshot */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
        }

        /* Typography */
        h1 {
            font-size: 36px;
            font-weight: 800;
            margin-bottom: 15px;
            color: #000;
        }

        .subtext {
            font-size: 18px;
            color: var(--text-green);
            font-weight: 500;
            margin-bottom: 40px;
        }

        /* Image Animation */
        .loading-img {
            width: 200px;
            height: auto;
            opacity: 0.9;
            /* Optional: Add a subtle pulse animation */
            animation: pulse 2s infinite ease-in-out;
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 0.9; }
            50% { transform: scale(1.05); opacity: 1; }
            100% { transform: scale(1); opacity: 0.9; }
        }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="/home">Home</a>
            <a href="/learning">Learning</a>
        </div>
        <div class="logo">MindLink</div>
        <div class="nav-links">
            <a href="/forum">Community</a>
            <a href="/profile">Profile</a>
        </div>
    </nav>

    <div class="container">
        <div class="loading-card">
            
            <h1>Please wait for a while...</h1>
            <div class="subtext">We're calculating your score 🍃</div>

            <img src="${pageContext.request.contextPath}/images/thinking-statue.png" alt="Thinking..." class="loading-img">

        </div>
    </div>

    <script>
        // Wait for 3000 milliseconds (3 seconds), then go to result page
        setTimeout(function() {
            window.location.href = "/assessment/result";
        }, 3000);
    </script>

</body>
</html>