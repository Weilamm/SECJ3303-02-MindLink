<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Mental Health Support Platform</title>
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

        /* Top nav like admin mockup */
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

        /* Main admin dashboard area */
        .main {
            background: #FFE6D0;
            padding: 60px 80px 80px;
        }

        .welcome-title {
            font-size: 40px;
            font-weight: 700;
            color: #00313e;
            text-align: center;
            margin-bottom: 40px;
        }

        .card-row {
            display: flex;
            gap: 40px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .admin-card {
            background: white;
            border-radius: 30px;
            width: 280px;
            padding: 40px 30px 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            text-align: center;
        }

        .card-title {
            font-size: 22px;
            font-weight: 700;
            color: #00313e;
            margin-bottom: 16px;
        }

        .card-text {
            font-size: 14px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 26px;
        }

        .card-button {
            display: inline-block;
            padding: 10px 40px;
            border-radius: 999px;
            border: none;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-update {
            background: #00B9A3;
            color: white;
        }

        .btn-review {
            background: #FF7FA3;
            color: white;
        }

        .admin-links {
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .admin-link {
            background-color: #0d5555;
            color: white;
            padding: 12px 25px;
            border-radius: 20px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .admin-link:hover {
            background-color: #0a4444;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(13, 85, 85, 0.3);
        }

        .footer {
            margin-top: 40px;
            text-align: center;
            color: #999;
            font-size: 12px;
        }

        @media (max-width: 900px) {
            .header {
                padding: 16px 24px;
            }

            .main {
                padding: 40px 24px 60px;
            }

            .card-row {
                gap: 24px;
            }
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

        <!-- Admin main content -->
        <div class="main">
            <h1 class="welcome-title">Welcome back, Admin123!</h1>

            <div class="card-row">
                <div class="admin-card">
                    <div class="card-title">Learning Module</div>
                    <div class="card-text">
                        Practical tips on stress management, mindfulness,
                        and emotional resilience.
                    </div>
                    <button class="card-button btn-update">Update</button>
                </div>

                <div class="admin-card">
                    <div class="card-title">Self Assessment</div>
                    <div class="card-text">
                        Set up self assessment questions for students to know
                        more about mental health.
                    </div>
                    <button class="card-button btn-update">Update</button>
                </div>

                <div class="admin-card">
                    <div class="card-title">Forum Report</div>
                    <div class="card-text">
                        Reviews reported posts, marks them as handled,
                        or deletes them if necessary.
                    </div>
                    <button class="card-button btn-review"
                            onclick="window.location.href='${pageContext.request.contextPath}/report/view'">
                        Review
                    </button>
                </div>
            </div>

            <div class="footer">
                © 2024 MindLink Admin. Supporting mental wellness together.
            </div>
        </div>
    </body>
</html>
