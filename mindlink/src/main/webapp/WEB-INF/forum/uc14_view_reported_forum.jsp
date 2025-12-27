<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reported Forum - Select Forum - MindLink Admin</title>
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
            overflow-x: hidden;
        }

        /* Admin header (same as index.jsp) */
        .header {
            padding: 18px 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
        }

        .header-nav {
            display: flex;
            gap: 40px;
            align-items: center;
        }

        .header-nav a {
            text-decoration: none;
            color: #00313e;
            font-size: 15px;
            font-weight: 500;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 32px;
            font-weight: 700;
            color: #00313e;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
        }

        .logo-icon span {
            font-size: 30px;
        }

        /* Main content */
        .main {
            padding: 50px 80px 80px;
        }

        .page-title {
            font-size: 40px;
            font-weight: 700;
            color: #00313e;
            margin-bottom: 30px;
        }

        .forum-card {
            background: #FFEFD9;
            border-radius: 30px;
            padding: 30px 40px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.08);
            max-width: 700px;
            margin-bottom: 24px;
        }

        .forum-name {
            font-size: 24px;
            font-weight: 700;
            color: #00313e;
            margin-bottom: 8px;
        }

        .forum-meta {
            font-size: 14px;
            color: #555;
            margin-bottom: 6px;
        }

        .forum-latest {
            font-size: 13px;
            color: #666;
            margin-bottom: 18px;
        }

        .select-btn {
            background: #004B4B;
            color: white;
            border: none;
            padding: 10px 40px;
            border-radius: 999px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            float: right;
        }

        .select-btn:hover {
            background: #003636;
        }
    </style>
</head>
<body>
    <!-- Admin header -->
    <div class="header">
        <div class="header-nav">
            <a href="#">Home</a>
            <a href="#">Module</a>
        </div>
        <div class="logo">
            <div class="logo-icon"><span>💛</span></div>
            <span>MindLink</span>
        </div>
        <div class="header-nav">
            <a href="#">Forum</a>
            <a href="#">Profile</a>
        </div>
    </div>

    <!-- Forum selection -->
    <div class="main">
        <h1 class="page-title">Forum:</h1>

        <div class="forum-card">
            <div class="forum-name">📚 Academic Pressure</div>
            <div class="forum-meta">189 members • 23 online now</div>
            <div class="forum-latest">Latest: "Dealing with assignment overload" – 5 min ago</div>
            <button class="select-btn" onclick="window.location.href='${pageContext.request.contextPath}/report/table'">Select Forum</button>
            <div style="clear: both;"></div>
        </div>

        <div class="forum-card">
            <div class="forum-name">😴 Sleep &amp; Wellness</div>
            <div class="forum-meta">156 members • 8 online now</div>
            <div class="forum-latest">Latest: "My bedtime routine that works" – 2 hours ago</div>
            <button class="select-btn" onclick="window.location.href='${pageContext.request.contextPath}/report/table'">Select Forum</button>
            <div style="clear: both;"></div>
        </div>
    </div>
</body>
</html>


