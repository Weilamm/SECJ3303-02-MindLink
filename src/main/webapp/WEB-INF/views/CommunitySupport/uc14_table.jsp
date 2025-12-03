<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reported Forum Table - MindLink Admin</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            border: 1px solid #000;
            padding: 10px 12px;
            font-size: 14px;
        }

        th {
            background: #f9f9f9;
            font-weight: 700;
            text-align: left;
        }

        .status-pending {
            font-weight: 600;
        }

        .status-reviewed {
            font-weight: 600;
        }

        .btn-view,
        .btn-delete {
            display: inline-block;
            min-width: 90px;
            padding: 8px 0;
            border-radius: 4px;
            font-size: 13px;
            font-weight: 600;
            color: #fff;
            text-align: center;
            margin-bottom: 6px;
            text-decoration: none;
        }

        .btn-view {
            background: #1A73E8;
        }

        .btn-delete {
            background: #F44336;
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

    <!-- Reported forum table -->
    <div class="main">
        <h1 class="page-title">Reported Forum:</h1>

        <table>
            <thead>
                <tr>
                    <th>Report ID</th>
                    <th>Post Title</th>
                    <th>Reason</th>
                    <th>Reporter</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>001</td>
                    <td>Exam Stress - Any Advice?</td>
                    <td>Harassment</td>
                    <td>Alex</td>
                    <td>2025-11-07</td>
                    <td class="status-pending">Pending</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/report/review" class="btn-view">[View]</a><br>
                        <a href="${pageContext.request.contextPath}/report/review" class="btn-delete">[Delete]</a>
                    </td>
                </tr>
                <tr>
                    <td>002</td>
                    <td>Study Meme Post</td>
                    <td>Spam</td>
                    <td>Nur</td>
                    <td>2025-11-06</td>
                    <td class="status-reviewed">Reviewed</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/report/review" class="btn-view">[View]</a><br>
                        <a href="${pageContext.request.contextPath}/report/review" class="btn-delete">[Delete]</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>


