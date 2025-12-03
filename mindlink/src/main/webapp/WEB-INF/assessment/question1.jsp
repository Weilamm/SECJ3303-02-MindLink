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
        .container {
            background: #f9e6d0;
            padding: 25px;
            border-radius: 10px;
            background: #f9e6d0;
            display: flex;
            justify-content: center;
        }
        .question {
            width: 85%;
            background: white;
            border-radius: 40px;
            padding: 10px;
        }
        h4 {
            color: #00313e;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
        .cancel-btn {
            background: #ff0000;
            border-radius: 80px;
            position: absolute;
            top: 115px;
            left: 140px;
            padding: 10px;
            border: none;
        }
        .cancel-btn img {
            width: 35px;
            height: 35px;
        }
        .selection {
            margin-left: 30%;
        }
        .number {
            position: absolute;
            top: 135px;
            right: 160px;
            width: 80px;
            height: 20px;
            padding: 7px 10px;
            background: #00313e;
            color: white;
            border: none;
            border-radius: 40px;
            text-align: center;
        }
        .animateImage {
            position: absolute;
            left: 160px;
            bottom: 65px;
        }
        .animateImage img {
            width: 200px;
            height: 200px;
        }
        .next form {
            position: absolute;
            right: 160px;
            bottom: 60px;
        }
        .next-btn img {
            width: 80px;
            height: 25px;
        }
        .next-btn {
            padding: 5px 10px;
            background: #00313e;
            color: white;
            border: none;
            border-radius: 40px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .choice-btn {
            width: 50%;
            background: #00313e;
            color: white;
            border: none;
            border-radius: 40px;
            cursor: pointer;
            font-size: 15px;
        }
        .next-btn:hover {
            width: 100%;
            background: #0d4e57;
        }
        .choice-btn:hover {
            background: #81d873;
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
            <div class="question">
                <h4>What's your health goal for today?</h4>
                <form class="cancel" action="cancel.jsp" method="post">
                    <button type="submit" class="cancel-btn">
                        <img src="cancel.png" alt="ancelQuestion">
                    </button>
                </form>
                <div class="number">
                    1 of 10
                </div>
                <div class="animateImage">
                    <img src="animate1.png" alt="animatePicture">
                </div>
                <div class="selection">
                    <button type="submit" class="choice-btn">
                        <p>❤️ I wanna reduce stress</p>
                    </button>
                    <br><br>
                    <button type="submit" class="choice-btn">
                        <p>🙉   I wanna try AI</p>
                    </button>
                    <br><br>
                    <button type="submit" class="choice-btn">
                        <p>🏳️ I want to cope with trauma</p>
                    </button>
                    <br><br>
                    <button type="submit" class="choice-btn">
                        <p>😀 I wanna to be a better person</p>
                    </button>
                    <br><br>
                    <button type="submit" class="choice-btn">
                        <p>👨‍🎓 Just trying out the app, mate!</p>
                    </button>
                </div>
                <br>
                <div class="next"> 
                    <form action="question2.jsp" method="post">
                        <button type="submit" class="next-btn">
                            <img src="nextArrow.png" alt="nextQuestion">
                        </button>
                    </form>                     
                </div>

            </div>
        </div>

</body>
</html>