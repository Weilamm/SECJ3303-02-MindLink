<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Question - MindLink</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background: white;
        }
        .header {
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e0e0e0;
        }
        .logo {
            font-size: 40px;
            font-weight: bold;
            color: #00313e;
        }
        .nav-links a {
            font-size: 15px;
            color: #666;
            text-decoration: none;
            margin: 0 15px;
        }
        .container {
            background: #f9e6d0;
            min-height: calc(100vh - 80px);
            padding: 30px 60px;
            display: flex;
            justify-content: center;
        }
        .dashboard {
            background: #ffffff;
            border-radius: 30px;
            text-align: center;
            font-weight: bold;
            width: 80%;
            padding: 15px;
        }
        .back-btn {
            position: absolute;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 24px;
            color: #00313e;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            font-weight: bolder;
            margin-left: 30px;
            margin-top: 10px;
        }
        button {
            background: none;
            border: none;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="nav-links"><a href="index.jsp">Home</a></div>
        <div class="nav-links"><a href="#">Learning</a></div>
        <div class="logo">MindLink</div>
        <div class="nav-links"><a href="#">Community</a></div>
        <div class="nav-links"><a href="#">Profile</a></div>
    </div>
    
    <div class="container">
        <div class="dashboard"> 
            <button class="back-btn" onclick="history.back()">↶</button>
            <h1>Achivement Dashboard</h1>
            <br>
            <form action="details.jsp" method="post">
                <button class="badges">
                    <img src="badges.png" alt="listOfBadges">
                </button>
            </form>
        </div>
    </div>

</body>
</html>