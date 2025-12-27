<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MindLink - Learning Resources</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* --- THEME COLORS --- */
        :root {
            --bg-color: #FFF3E0;      /* Beige Background */
            --text-dark: #003049;     /* Dark Navy for Headings */
            --text-body: #333333;
            --card-bg: #FFFFFF;
            --btn-yellow: #F2C94C;
            --btn-teal: #48C9B0;
            --btn-pink: #EF96AA;
            --btn-purple: #C89BF4;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            padding: 0;
            color: var(--text-body);
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

        /* Main Container */
        .container {
            max-width: 1400px;
            margin: 40px auto;
            text-align: center;
            padding: 0 40px; /* Added side padding for safety */
        }

        h1 {
            font-size: 48px;
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 20px;
            line-height: 1.2;
        }
        .subtitle {
            font-size: 18px;
            color: var(--text-dark);
            margin-bottom: 60px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            line-height: 1.5;
        }

        /* --- UPDATED GRID SYSTEM --- */
        .cards-container {
            display: grid;
            /* This forces exactly 4 columns of equal width */
            grid-template-columns: repeat(4, 1fr); 
            gap: 20px; /* Space between cards */
            width: 100%;
        }

        .card {
            background: var(--card-bg);
            border-radius: 40px;
            padding: 40px 20px; /* Reduced side padding slightly */
            /* Removed fixed width so it adapts to the grid */
            width: auto; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            text-align: center;
            min-height: 380px;
            transition: transform 0.2s;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }

        .card h2 {
            font-size: 22px; /* Slightly smaller to prevent text wrapping */
            color: var(--text-dark);
            margin-bottom: 15px;
        }

        .card p {
            font-size: 14px;
            line-height: 1.6;
            color: #555;
            margin-bottom: 30px;
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
        }

        .btn-yellow { background-color: var(--btn-yellow); color: white; }
        .btn-teal { background-color: var(--btn-teal); color: white; }
        .btn-pink { background-color: var(--btn-pink); color: white; }
        .btn-purple { background-color: var(--btn-purple); color: white; }

        .btn:hover { opacity: 0.9; }

        /* --- RESPONSIVENESS --- */
        /* If screen gets too small, switch to 2 columns so cards don't get squished */
        @media (max-width: 1200px) {
            .cards-container {
                grid-template-columns: repeat(2, 1fr);
                max-width: 700px;
                margin: 0 auto;
            }
        }
        /* On mobile, 1 column */
        @media (max-width: 600px) {
            .cards-container {
                grid-template-columns: 1fr;
            }
        }

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
        
        <h1>Resources for Your<br>Well-being</h1>
        <p class="subtitle">
            Explore expert insights, self-care guides, and tools to support your mental health.
        </p>

        <div class="cards-container">
            
            <div class="card">
                <div>
                    <h2>Learning<br>Module</h2>
                    <p>Practical tips on stress management, mindfulness, and emotional resilience.</p>
                </div>
                <a href="/learning/modules" class="btn btn-yellow">Explore</a>
            </div>

            <div class="card">
                <div>
                    <h2>Self<br>Assessment</h2>
                    <p>Self assessment for you to know more about you and knowledge about mental.</p>
                </div>
                <a href="/assessment" class="btn btn-teal">Explore</a>
            </div>

            <div class="card">
                <div>
                    <h2>Counseling &<br>Appointment</h2>
                    <p>Live and recorded sessions with mental health professionals.</p>
                </div>
                <a href="/counseling" class="btn btn-pink">Explore</a>
            </div>

            <div class="card">
                <div>
                    <h2>Achievements</h2>
                    <p>Earn badges and rewards as you reach your wellness goals.</p>
                </div>
                <a href="/gamification" class="btn btn-purple">Explore</a>
            </div>

        </div>
    </div>

</body>
</html>