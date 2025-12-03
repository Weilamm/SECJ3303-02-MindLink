<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Forum - MindLink</title>
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

        /* Header Navigation */
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
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        /* Main Container */
        .container {
            background: #FFE6D0;
            padding: 80px 100px;
            min-height: calc(100vh - 81px);
        }

        /* Welcome Section */
        .welcome-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 60px;
        }

        .welcome-text {
            flex: 1;
            max-width: 500px;
        }

        .welcome-title {
            font-size: 52px;
            color: #00313e;
            font-weight: 700;
            margin-bottom: 25px;
            line-height: 1.2;
        }

        .welcome-subtitle {
            font-size: 17px;
            color: #00313e;
            line-height: 1.7;
            margin-bottom: 35px;
        }

        .join-btn {
            background: #00313e;
            color: white;
            border: none;
            padding: 16px 45px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .join-btn:hover {
            background: #0d4e57;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 49, 62, 0.3);
        }

        .welcome-image {
            flex: 1;
            display: flex;
            justify-content: flex-end;
            align-items: flex-end;
        }

        .welcome-image img {
            max-width: 450px;
            width: 100%;
            height: auto;
        }

        /* Chat Button */
        .chat-button {
            position: fixed;
            bottom: 60px;
            right: 60px;
            background: white;
            border: none;
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
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }

        .chat-button-icon {
            width: 50px;
            height: 50px;
            object-fit: contain;
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .header {
                padding: 20px 50px;
            }

            .container {
                padding: 60px 50px;
            }

            .welcome-section {
                flex-direction: column;
                text-align: center;
            }

            .welcome-text {
                max-width: 100%;
            }

            .welcome-image {
                justify-content: center;
            }
        }

        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
            }

            .nav-left, .nav-right {
                gap: 30px;
            }

            .welcome-title {
                font-size: 36px;
            }

            .container {
                padding: 40px 30px;
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
            <a href="${pageContext.request.contextPath}/forum/welcome" style="color: #0d4e57; font-weight: 600;">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <!-- Main Container -->
    <div class="container">
        <div class="welcome-section">
            <div class="welcome-text">
                <h1 class="welcome-title">Welcome to the MindLink Community Forum!</h1>
                <p class="welcome-subtitle">
                    You're not alone on this journey — share your thoughts, support others, and grow together
                </p>
                <a href="${pageContext.request.contextPath}/forum/available" class="join-btn">Join The Community</a>
            </div>

            <div class="welcome-image">
                <img src="${pageContext.request.contextPath}/images/forum_welcome.png" alt="Community">
            </div>
        </div>
    </div>

    <!-- Fixed Chat Button -->
    <a href="${pageContext.request.contextPath}/ai/chatbot" class="chat-button">
        <img src="${pageContext.request.contextPath}/images/chatbot.png" alt="Chat with AI" class="chat-button-icon">
    </a>

    <script>
        // Smooth fade-in animation
        window.addEventListener('load', function() {
            document.querySelector('.welcome-section').style.opacity = '0';
            setTimeout(function() {
                document.querySelector('.welcome-section').style.transition = 'opacity 1s ease-in';
                document.querySelector('.welcome-section').style.opacity = '1';
            }, 100);
        });
    </script>
</body>
</html>

