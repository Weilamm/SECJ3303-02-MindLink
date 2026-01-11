<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Question 1</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --btn-dark-green: #013B46;
            --btn-light-green: #74C67A;
            --card-bg: #FFFFFF;
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

        /* Container */
        .container {
            display: flex; justify-content: center; align-items: center;
            min-height: 80vh;
        }

        /* Card */
        .assessment-card {
            background: #FFFCF7; /* Slightly off-white from screenshot */
            width: 1000px;
            border-radius: 40px;
            padding: 50px;
            position: relative;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        /* Header Controls */
        .close-btn {
            position: absolute; top: 40px; left: 40px;
            width: 40px; height: 40px; background-color: #FF6B6B;
            border-radius: 50%; color: white;
            display: flex; justify-content: center; align-items: center;
            font-weight: bold; text-decoration: none; font-size: 20px;
        }

        .progress-pill {
            position: absolute; top: 40px; right: 40px;
            background-color: var(--btn-dark-green); color: white;
            padding: 8px 25px; border-radius: 20px; font-weight: 600; font-size: 14px;
        }

        /* Main Content */
        h1 {
            text-align: center; font-size: 32px; font-weight: 800;
            margin-top: 10px; margin-bottom: 40px;
        }

        .layout-grid {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            padding: 0 50px;
        }

        /* Illustration */
        .illustration img {
            width: 300px; height: auto;
        }

        /* Buttons List */
        .options-list {
            flex: 1;
            max-width: 450px;
            display: flex; flex-direction: column; gap: 15px;
            margin-left: 50px;
        }

        .option-btn {
            display: flex; align-items: center; justify-content: center;
            padding: 15px; border-radius: 30px;
            font-weight: 600; font-size: 16px; color: white;
            cursor: pointer; transition: transform 0.2s;
            text-decoration: none; border: none; width: 100%;
        }
        
        .option-btn:hover { transform: scale(1.02); }

        .btn-dark { background-color: var(--btn-dark-green); }
        .btn-light { background-color: var(--btn-light-green); }

        .icon { margin-right: 10px; }

        /* Next Arrow Button */
        .next-arrow-container {
            display: flex; justify-content: flex-end;
            margin-top: 30px; padding-right: 50px;
        }

        .next-btn {
            background-color: var(--btn-dark-green);
            color: white; width: 100px; height: 50px;
            border-radius: 25px;
            display: flex; justify-content: center; align-items: center;
            font-size: 24px; text-decoration: none;
            transition: background-color 0.3s;
        }
        .next-btn:hover { background-color: #002a33; }

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
        <div class="assessment-card">
            
            <a href="/assessment" class="close-btn">✕</a>
            <div class="progress-pill">1 Of 10</div>
            <h1>What’s your health goal for today?</h1>

            <div class="layout-grid">
                
                <div class="illustration">
                    <img src="${pageContext.request.contextPath}/images/couple-coffee.png" alt="Couple drinking coffee">
                </div>

                <div class="options-list">
                    <div class="option-btn btn-dark">
                        <span class="icon">♥</span> I wanna reduce stress
                    </div>

                    <div class="option-btn btn-dark">
                        I Wanna Try AI
                    </div>

                    <div class="option-btn btn-dark">
                        <span class="icon">🏳</span> I want to cope with trauma
                    </div>

                    <div class="option-btn btn-light">
                        <span class="icon">☺</span> I want to be a better person
                    </div>

                    <div class="option-btn btn-dark">
                        <span class="icon">🔋</span> Just trying out the app, mate!
                    </div>
                </div>
            </div>

            <div class="next-arrow-container">
                <a href="/assessment/last" class="next-btn">⟶</a>
            </div>

        </div>
    </div>

</body>
</html>