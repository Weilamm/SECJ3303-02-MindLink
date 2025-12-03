<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UCO5 Self Assessment (User) - MindLink</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: white;
        }
        .header {
            padding: 10px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .container {
            background: #f9e6d0;
            padding: 30px;
            padding-bottom: 100px;
            border-radius: 10px;
            background: 
                url('background-left.png') left / 30% 100% no-repeat,
                url('background-right.png') right  / 30% 100% no-repeat,
                #f9e6d0;
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
        }
        h1 {
            color: #00313e;
            font-size: 60px;
            margin-bottom: 15px;
            text-align: center;
            padding-left: 80px;
        }
        form {
            display: flex;
            justify-content: center;
            padding-left: 100px;
        }
        .start-btn {
            width: 25%;
            justify-items: right;            
            padding: 15px;
            background: #00313e;
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 20px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .start-btn:hover {
            background: #0d4e57;
        }
    </style>
</head>
<body>
        <div class="header">
                <div class="nav-links"><a href="#">Home</a></div>
                <div class="nav-links"><a href="#">Learning</a></div>
                <div class="logo">MindLink</div>
                <div class="nav-links"><a href="#">Community</a></div>
                <div class="nav-links"><a href="#">Profile</a></div>
        </div>
        
        <div class="container">
            <h1>Let's get start with<br>mental health<br>assessment!</h1>
            <br><br>
            <form action="question1.jsp" method="post">
                <button type="submit" class="start-btn">Get Started &nbsp &nbsp &nbsp →</button>
            </form>
        </div>
</body>
</html>