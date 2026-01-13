<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Joined Forums - MindLink</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #FFE6D0;
            min-height: 100vh;
            overflow-x: hidden; /* ensure page fits laptop browser width */
        }

        /* Header */
        .header {
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            border-bottom: 1px solid #e0e0e0;
        }

        .nav-left,
        .nav-right {
            display: flex;
            align-items: center;
            justify-content: space-evenly; /* distribute header links equally */
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
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        /* Container */
        .container {
            background: #FFE6D0;
            min-height: calc(100vh - 81px);
            padding: 50px 100px;
        }

        /* Back Button */
        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            color: #00313e;
            font-size: 20px;
            text-decoration: none;
            margin-bottom: 30px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .back-btn:hover {
            transform: translateX(-5px);
        }

        /* Content */
        .content {
            max-width: 900px;
            margin: 0 auto;
        }

        .page-title {
            font-size: 36px;
            color: #00313e;
            font-weight: 700;
            margin-bottom: 40px;
            text-align: center;
        }

        /* Forum Card */
        .forum-card {
            background: white;
            border-radius: 20px;
            padding: 35px 45px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .forum-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 15px;
        }

        .forum-icon {
            font-size: 32px;
        }

        .forum-title {
            font-size: 26px;
            color: #00313e;
            font-weight: 700;
        }

        .forum-stats {
            font-size: 14px;
            color: #666;
            margin-bottom: 15px;
        }

        .forum-latest {
            font-size: 14px;
            color: #555;
            margin-bottom: 25px;
        }

        .enter-btn {
            background: #00313e;
            color: white;
            border: none;
            padding: 12px 35px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            float: right;
        }

        .enter-btn:hover {
            background: #0d4e57;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 49, 62, 0.3);
        }

        /* Chat Button */
        .chat-button {
            position: fixed;
            bottom: 60px;
            right: 60px;
            background: white;
            padding: 15px;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            transition: all 0.3s;
            z-index: 1000;
            text-decoration: none;
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .chat-button:hover {
            transform: translateY(-5px) scale(1.05);
        }

        .chat-button-icon {
            width: 50px;
            height: 50px;
            object-fit: contain;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
                padding: 20px 30px;
            }

            .container {
                padding: 30px 20px;
            }

            .forum-card {
                padding: 25px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
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
            <a href="${pageContext.request.contextPath}/forum/welcome" style="color: #0d4e57; font-weight: 600;">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <!-- Container -->
    <div class="container">
        <div class="content">
            <a href="${pageContext.request.contextPath}/forum/available" class="back-btn">← Back</a>
            
            <h1 class="page-title">Joined Forum:</h1>

            <!-- Forum Card -->
            <div class="forum-card">
                <div class="forum-header">
                    <span class="forum-icon">😰</span>
                    <h2 class="forum-title">Anxiety & Stress Support</h2>
                </div>
                <p class="forum-stats">234 members • 15 online now</p>
                <p class="forum-latest">Latest: "Tips for presentation anxiety" – 10 min ago</p>
                <a href="${pageContext.request.contextPath}/forum/detail" class="enter-btn">Enter</a>
                <div style="clear: both;"></div>
            </div>
        </div>
    </div>

    <!-- Chat Button -->
    <a href="${pageContext.request.contextPath}/ai/chatbot" class="chat-button">
        <img src="${pageContext.request.contextPath}/images/chatbot.png" alt="Chat" class="chat-button-icon">
    </a>
</body>
</html>