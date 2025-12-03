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
            padding-bottom: 30px;
        }
        .result {
            width: 85%;
            background: white;
            border-radius: 40px;
            padding: 30px 10px;
            text-align: center;
        }
        h4 {
            color: #00313e;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
        p {
            color: #29b04d;
        }
        .score {
            width: 150px;
            height: 150px;
            background: #d0722a;
            border-radius: 100%;
            border: none;
            padding: 15px;   
            margin: 0 auto; 
            text-align: center;
            display: flex;        
            justify-content: center;
            align-items: center;
        }
        .score2 {
            width: 100px;
            height: 100px;
            background: #d9b15c;
            border-radius: 100%;
            border: none;
            padding: 15px;   
            text-align: center;
            font-size: 90px;
            color: white;
        }
        .combine {
            display: flex;
            align-items: center;
            gap: 30px;
        }
        .animateImage img {
            left: 120px;
            width: 200px;
            height: 300px;
        }
        .suggestions {
            min-width: 60%;
            background: #00373e;
            border: none;
            border-radius: 40px;
            font-size: 25px;
            color: white;
            text-align: left;
            padding: 20px;
            flex: 1;  
            margin-right: 30px;
        }
        .return-btn {
            width: 130px;
            height: 70px;
            background: #00373e;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 20px;
            box-shadow: 8px 8px 5px rgba(0, 0, 0, 0.543);
        }
        .return-btn:hover {
            background: #00313e;
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
            <div class="result">
                <h4><b>Your Mental Health Score Has Been Done!</b></h4>
                <p>Scroll down to view the suggestions. 🍃</p>  
                <br>
                <div class="score">
                    <div class="score2">
                        <b>55</b>
                    </div>
                </div>
                <br>   
                <h4>Suggestion:</h4> 
                <div class="combine">
                    <div class="animateImage">
                        <img src="animate11.png" alt="thinkingAnimation">
                    </div>     
                    <div class="suggestions">
                        Oh No!<br>
                        Your Mental Health is not well! <br>
                        <br>
                        Here are some suggestions: <br>
                        - Eat Healthy Food <br>
                        - Get More sleep <br>
                        <br>
                        You May Contact: <br>
                        Dr. Azizah (+6012 - 345 6789) <br>
                    </div>
                    <form action="home.jsp" method="post">
                        <button type="submit" class="return-btn">
                            <p><b>DONE</b></p>
                        </button>
                    </form>
                </div>
            </div>
        </div>

</body>
</html>