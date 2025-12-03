<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomePage-Student Portal - MindLink</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #FFE6D0; /* match forum soft peach */
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
            background: #FFE6D0;
            padding: 60px 100px;
            padding-bottom: 120px;
            position: relative;
            overflow: hidden;
            min-height: calc(100vh - 81px); /* fill viewport under header */
            background-image:
                url('images/background-left.png'),
                url('images/background-right.png');
            background-position: left bottom, right bottom; /* stay at bottom corners */
            background-repeat: no-repeat, no-repeat;
            background-size: auto, auto; /* keep original size */
            background-color: #FFE6D0;
        }

        /* Welcome Content */
        .welcome-content {
            text-align: center;
            position: relative;
            z-index: 2;
        }

        .welcome-title {
            font-size: 56px;
            color: #00313e;
            font-weight: 700;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .welcome-subtitle {
            font-size: 40px;
            color: #00313e;
            font-weight: 600;
            margin-bottom: 50px;
        }

        /* Tip Box */
        .tip-box {
            background: white;
            border-radius: 20px;
            padding: 25px 40px;
            margin: 0 auto 60px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            display: inline-block;
            text-align: left;
            max-width: 600px;
        }

        .tip-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
        }

        .tip-icon {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .tip-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .tip-title {
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }

        .tip-content {
            color: #00313e;
            font-size: 15px;
            line-height: 1.6;
            font-style: italic;
        }

        /* Upcoming Sessions */
        .sessions-section {
            margin-top: 40px;
        }

        .sessions-title {
            font-size: 24px;
            color: #00313e;
            font-weight: 700;
            margin-bottom: 25px;
            text-align: left;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .session-item {
            background: white;
            border-radius: 15px;
            padding: 20px 30px;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.06);
            transition: all 0.3s;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 15px;
        }

        .session-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .session-info h3 {
            font-size: 16px;
            color: #00313e;
            margin-bottom: 5px;
            font-weight: 600;
        }

        .session-info p {
            font-size: 13px;
            color: #666;
        }

        .view-button {
            background: linear-gradient(135deg, #ffa500, #ff8c00);
            color: white;
            border: none;
            padding: 10px 28px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .view-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 165, 0, 0.4);
        }

        /* Chat Button - Fixed Position */
        .chat-button {
            position: fixed;
            bottom: 60px;
            right: 60px;
            background: white;
            border: none;
            padding: 20px;
            border-radius: 20px;
            cursor: pointer;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            transition: all 0.3s;
            z-index: 1000;
            text-decoration: none;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            width: 120px;
        }

        .chat-button:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }

        .chat-button-icon {
            width: 60px;
            height: 60px;
            object-fit: contain;
        }

        .chat-button-text {
            color: #00313e;
            font-size: 12px;
            font-weight: 700;
            text-align: center;
            line-height: 1.4;
        }

        /* Inline Lightbulb Icon (inside tip header) */
        .lightbulb-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #fff7e0;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            text-decoration: none;
        }

        .lightbulb-link:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 10px rgba(255, 193, 7, 0.4);
        }

        .lightbulb-link img {
            width: 22px;
            height: 22px;
            object-fit: contain;
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .header {
                padding: 20px 50px;
            }

            .container {
                padding: 50px;
                background-size: 15% auto, 15% auto;
            }

            .nav-left, .nav-right {
                gap: 40px;
            }
        }

        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
            }

            .nav-left, .nav-right {
                gap: 20px;
            }

            .welcome-title {
                font-size: 36px;
            }

            .welcome-subtitle {
                font-size: 28px;
            }

            .container {
                background-image: none;
            }

            .lightbulb-link {
                position: static;
                transform: none;
                margin: 20px auto;
            }
        }
    </style>
</head>
<body>
    <!-- Header Navigation -->
    <div class="header">
        <div class="nav-left">
            <a href="home.jsp">Home</a>
            <a href="learning.jsp">Learning</a>
        </div>
        
        <a href="home.jsp" class="logo">
            <div class="logo-icon">
                <img src="images/mindlink.png" alt="MindLink">
            </div>
            <span>MindLink</span>
        </a>
        
        <div class="nav-right">
            <a href="uc12_forum_welcome.jsp">Forum</a>
            <a href="profile.jsp">Profile</a>
        </div>
    </div>

    <!-- Main Container -->
    <div class="container">
        <!-- Welcome Content -->
        <div class="welcome-content">
            <h1 class="welcome-title">Welcome back, Karen!</h1>
            <h2 class="welcome-subtitle">How are you feeling today?</h2>

            <!-- Today's Mind Tip -->
            <div class="tip-box">
                <div class="tip-header">
                    <a href="uc11_tips.jsp" class="lightbulb-link" title="Go to Mind Tips page">
                        <img src="images/lightbulb.png" alt="Mind Tip">
                    </a>
                    <span class="tip-title">Today's Mind Tip:</span>
                </div>
                <p class="tip-content">
                    "Take a few deep breaths before studying — calm mind, better focus."
                </p>
            </div>

            <!-- Upcoming Sessions -->
            <div class="sessions-section">
                <h3 class="sessions-title">Upcoming Session:</h3>

                <div class="session-item">
                    <div class="session-info">
                        <h3>Session with Dr. Evelyn Reed</h3>
                        <p>Date: July 5, 2025, 10:00 AM</p>
                    </div>
                    <a href="learning.jsp" class="view-button">View</a>
                </div>

                <div class="session-item">
                    <div class="session-info">
                        <h3>Session with Dr. Aaron Smith</h3>
                        <p>Date: July 20, 2025, 10:00 AM</p>
                    </div>
                    <a href="learning.jsp" class="view-button">View</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Fixed Chat Button -->
    <a href="uc10_chatbot.jsp" class="chat-button">
        <img src="images/chatbot.png" alt="Chat with AI" class="chat-button-icon">
        <span class="chat-button-text">CHAT<br>WITH AI<br>HERE!</span>
    </a>

    <script>
        // Add smooth animations on load
        window.addEventListener('load', function() {
            const container = document.querySelector('.container');
            container.style.opacity = '0';
            setTimeout(function() {
                container.style.transition = 'opacity 0.8s';
                container.style.opacity = '1';
            }, 100);
        });

        // Add click feedback for interactive elements
        document.querySelectorAll('.view-button, .chat-button, .lightbulb-link').forEach(function(element) {
            element.addEventListener('click', function(e) {
                const currentTransform = this.style.transform || '';
                this.style.transform = currentTransform + ' scale(0.95)';
                setTimeout(() => {
                    this.style.transform = currentTransform;
                }, 150);
            });
        });
    </script>
</body>
</html>


