<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mental Health Assessment</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --btn-dark: #003049;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 0;
            color: var(--text-dark);
            /* We handle overflow in the hero container now */
        }

        /* Header Navigation (Unchanged) */
        .header {
            padding: 20px 60px;
            display: flex; justify-content: space-between; align-items: center;
            background: transparent;
        }
        .nav-left, .nav-right { display: flex; gap: 30px; }
        .nav-left a, .nav-right a {
            text-decoration: none; color: #00313e; font-size: 16px; font-weight: 600;
        }
        .logo {
            display: flex; align-items: center; gap: 10px; font-weight: 800;
            color: #00313e; font-size: 32px; text-decoration: none;
        }
        .logo-icon img { width: 40px; height: 40px; }

        /* --- HERO SECTION --- */
        .hero-container {
            background: #FFF3E0;
            position: relative;
            /* Calculate height to fill the screen below header */
            height: calc(100vh - 90px);
            min-height: 600px; /* Ensure it doesn't get too short on small screens */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 20px;
            /* CRITICAL: Crop anything that somehow spills out */
            overflow: hidden;
        }

        /* Center Text Box */
        .content-box {
            text-align: center;
            z-index: 10;
            position: relative;
            max-width: 800px;
        }

        h1 {
            font-size: 64px;
            font-weight: 800;
            color: #003049;
            line-height: 1.2;
            margin-bottom: 50px;
        }

        .btn-start {
            display: inline-block;
            background-color: var(--btn-dark);
            color: white;
            padding: 18px 50px;
            border-radius: 40px;
            font-size: 18px;
            font-weight: 600;
            text-decoration: none;
            transition: transform 0.2s;
        }
        .btn-start:hover { transform: scale(1.05); background-color: #004566; }

        /* --- DECORATIVE SHAPES (FIXED) --- */
        /* Common styles for both images */
        /* 1. LEFT IMAGE */
        .shape-left {
            position: absolute;
            left: 0;
            top: 0;
            
            /* FORCE HEIGHT TO MATCH CONTAINER */
            height: 100%; 
            
            /* Allow width to adjust automatically */
            width: auto; 
            
            /* Prevent it from overlapping the text in the middle */
            max-width: 35%; 
            
            /* CRITICAL: This ensures the full image is shown (no cutting) */
            object-fit: contain; 
            
            /* Anchor it to the left side */
            object-position: left center; 
            
            z-index: 1;
        }

        /* 2. RIGHT IMAGE */
        .shape-right {
            position: absolute;
            right: 0;
            top: 0;
            
            /* FORCE HEIGHT TO MATCH CONTAINER */
            height: 100%;
            
            /* Allow width to adjust automatically */
            width: auto;
            
            /* Prevent it from overlapping the text in the middle */
            max-width: 35%;
            
            /* CRITICAL: This ensures the full image is shown (no cutting) */
            object-fit: contain;
            
            /* Anchor it to the right side */
            object-position: right center;
            
            z-index: 1;
        }

        /* Responsive: Fade out on mobile */
        @media (max-width: 1100px) {
            .shape-left, .shape-right {
                opacity: 0.2; 
            }
            h1 { font-size: 40px; }
        }

    </style>
</head>
<body>

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

    <div class="hero-container">
        
        <img src="${pageContext.request.contextPath}/images/assessment_left.png" class="shape-left" alt="">

        <div class="content-box">
            <h1>Let’s get start with <br> mental health <br> assessment!</h1>
            <a href="/assessment/start" class="btn-start">Get Started &nbsp; &rarr;</a>
        </div>

        <img src="${pageContext.request.contextPath}/images/assessment_right.png" class="shape-right" alt="">

    </div>

</body>
</html>