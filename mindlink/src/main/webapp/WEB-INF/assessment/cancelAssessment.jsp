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
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            margin-top: 120px;
            width: 85%;
            background: white;
            border: 2px solid black ;
            border-radius: 40px;
            padding: 10px;
            padding-bottom: 55px;
            text-align: right;
        }
        h4 {
            color: #00313e;
            font-size: 50px;
            margin-bottom: 15px;
            text-align: center;
            padding-left: 250px;
        }
        .animateImage {
            position: absolute;
            padding-left: 30px;
        }
        .animateImage img {
            width: 280px;
            height: 380px;
        }
        .selection {
            margin-left: 10%;
            display: flex;
            justify-content: right;
            margin-right: 20%;
            gap: 40px;
            padding: 20px;
        }
        .yes-btn {
            width: 130px;
            height: 70px;
            background: #eb8b8b;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 20px;
            box-shadow: 8px 8px 5px rgba(0, 0, 0, 0.543);
        }
        .yes-btn:hover {
            background: #d87378;
        }
        .no-btn {
            width: 130px;
            height: 70px;
            background: #c0e1ae;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 20px;
            box-shadow: 8px 8px 5px rgba(0, 0, 0, 0.543);
        }
        .no-btn:hover {
            background: #81d873;
        }
    </style>
</head>
<body>  
        <div class="container">
                <div class="animateImage">
                    <img src="animate12.png" alt="animatePicture">
                </div>
                <h4>Are you sure you want <br> to quit the mental <br> health assessment? </h4>

                <div class="selection">
                    <form action="welcome.jsp" method="post">
                        <button type="submit" class="yes-btn">
                            <p><b>YES</b></p>
                        </button>
                    </form>
                    <br>
                    <form action="question5.jsp" method="post">
                        <button  type="submit" class="no-btn">
                            <p><b>NO</b></p>
                        </button>
                    </form>  
                </div>
            </div>
        </div>
</body>
</html>