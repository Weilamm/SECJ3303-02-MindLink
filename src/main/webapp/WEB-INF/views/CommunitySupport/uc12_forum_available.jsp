<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Forums - MindLink</title>
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

        /* Main Layout */
        .main-layout {
            display: flex;
            min-height: calc(100vh - 81px);
        }

        /* Sidebar */
        .sidebar {
            width: 300px;
            background: #FFE6D0;
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
            gap: 30px;
        }

        .sidebar-image {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar-image img {
            width: 150px;
            height: auto;
        }

        .activity-section {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .activity-title {
            font-size: 16px;
            font-weight: 700;
            color: #00313e;
            margin-bottom: 15px;
        }

        .activity-section ul {
            list-style: none;
            color: #333;
            font-size: 14px;
            line-height: 2;
        }

        .activity-section ul li::before {
            content: "• ";
            color: #00313e;
            font-weight: bold;
            margin-right: 8px;
        }

        .forum-joined-btn {
            background: #00313e;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            width: 100%;
        }

        .forum-joined-btn:hover {
            background: #0d4e57;
            transform: translateY(-2px);
        }

        /* Content Area */
        .content-area {
            flex: 1;
            background: #FFE6D0;
            padding: 50px 80px;
        }

        .content-title {
            font-size: 42px;
            color: #00313e;
            font-weight: 700;
            margin-bottom: 40px;
            text-align: center;
        }

        /* Forum Card */
        .forum-card {
            background: white;
            border-radius: 20px;
            padding: 30px 40px;
            margin-bottom: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 0.3s;
        }

        .forum-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 30px rgba(0,0,0,0.12);
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
            font-size: 24px;
            color: #00313e;
            font-weight: 700;
            text-decoration: underline;
        }

        .forum-stats {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }

        .forum-latest {
            font-size: 14px;
            color: #555;
            margin-bottom: 20px;
        }

        .join-forum-btn {
            background: #00313e;
            color: white;
            border: none;
            padding: 12px 35px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-block;
            float: right;
        }

        .join-forum-btn:hover {
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
        @media (max-width: 1200px) {
            .main-layout {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
            }

            .content-area {
                padding: 40px 50px;
            }
        }

        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
                padding: 20px 30px;
            }

            .content-area {
                padding: 30px 20px;
            }

            .content-title {
                font-size: 32px;
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

    <!-- Main Layout -->
    <div class="main-layout">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-image">
                <img src="${pageContext.request.contextPath}/images/forum_available.png" alt="Forum">
            </div>

            <div class="activity-section">
                <h3 class="activity-title">Your Activity:</h3>
                <ul>
                    <li>2 posts</li>
                    <li>10 comment</li>
                </ul>
            </div>

            <button class="forum-joined-btn" onclick="window.location.href='${pageContext.request.contextPath}/forum/joined'">
                Forum Joined
            </button>
        </div>

        <!-- Content Area -->
        <div class="content-area">
            <h1 class="content-title">Available Forums:</h1>

            <!-- Forum Card 1 -->
            <div class="forum-card">
                <div class="forum-header">
                    <span class="forum-icon">📚</span>
                    <h2 class="forum-title">Academic Pressure</h2>
                </div>
                <p class="forum-stats">189 members • 23 online now</p>
                <p class="forum-latest">Latest: "Dealing with assignment overload" – 5 min ago</p>
                <!-- Only "Forum Joined" button in sidebar navigates; this button has no direct link -->
                <button type="button" class="join-forum-btn">Join Forum</button>
                <div style="clear: both;"></div>
            </div>

            <!-- Forum Card 2 -->
            <div class="forum-card">
                <div class="forum-header">
                    <span class="forum-icon">😴</span>
                    <h2 class="forum-title">Sleep & Wellness</h2>
                </div>
                <p class="forum-stats">156 members • 8 online now</p>
                <p class="forum-latest">Latest: "My bedtime routine that works" – 2 hours ago</p>
                <button type="button" class="join-forum-btn">Join Forum</button>
                <div style="clear: both;"></div>
            </div>
        </div>
    </div>

    <!-- Chat Button -->
    <a href="${pageContext.request.contextPath}/ai/chatbot" class="chat-button">
        <img src="${pageContext.request.contextPath}/images/chatbot.png" alt="Chat" class="chat-button-icon">
    </a>

    <script>
        window.addEventListener('load', function() {
            document.querySelectorAll('.forum-card').forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    card.style.transition = 'all 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, 100 * index);
            });
        });
    </script>
</body>
</html>
