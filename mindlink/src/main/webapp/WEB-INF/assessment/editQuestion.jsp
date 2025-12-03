<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Question - MindLink</title>
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
            padding: 15px;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            padding-bottom: 30px;
            min-height: calc(100vh - 80px);
        }
        .question {
            width: 85%;
            background: white;
            border-radius: 40px;
            padding: 20px;
            position: relative;
        }
        .question-input {
            width: 60%;
            padding: 15px;
            font-size: 18px;
            border: 2px solid #ddd;
            border-radius: 15px;
            margin: 20px auto;
            display: block;
            color: #00313e;
            text-align: center;
            font-weight: bolder;
        }
        .back-btn {
            background: #ff0000;
            border-radius: 80px;
            position: absolute;
            top: 40px;
            left: 40px;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
        .back-btn img {
            width: 35px;
            height: 35px;
        }
        .selection, 
        .selection2 {
            margin-left: 18%;
            margin-top: 20px;
        }
        .choice-btn {
            width: 250px;
            height: 150px;
            background: #00313e;
            color: white;
            border: none;
            border-radius: 40px;
            cursor: pointer;
            font-size: 15px;
            margin: 10px;
            transition: all 0.3s;
        }
        .choice-btn:hover {
            background: #0d4e57;
        }
        .choice-btn.selected {
            background: #81d873;
        }
        .animateImage {
            position: absolute;
            right: 60px;
            bottom: 40px;
        }
        .animateImage img {
            width: 100px;
            height: 340px;
        }
        .save-btn {
            position: absolute;
            right: 60px;
            top: 50px;
            padding: 12px 40px;
            background: #00313e;
            color: white;
            border: none;
            border-radius: 40px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }
        .save-btn:hover {
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
        <div class="question">
            <form action="updateQuestion.jsp" method="post">
                <button type="button" class="back-btn" onclick="history.back()">
                    <img src="cancel.png" alt="ancelQuestion">
                </button>

                <input type="text" name="questionTitle" class="question-input" 
                       value="Are you taking any medications?" placeholder="Enter question title">
                
                <div class="selection">
                    <button type="button" class="choice-btn selected" onclick="toggleChoice(this)">
                        <input type="checkbox" name="option1" value="Prescribed Medications" style="display:none" checked>
                        <p>💊 Prescribed Medications</p>
                    </button>
                    <button type="button" class="choice-btn selected" onclick="toggleChoice(this)">
                        <input type="checkbox" name="option2" value="Over the Counter Supplements" style="display:none" checked>
                        <p>💊 Over the Counter Supplements</p>
                    </button>
                </div>
                <div class="selection2">
                    <button type="button" class="choice-btn selected" onclick="toggleChoice(this)">
                        <input type="checkbox" name="option3" value="I'm not taking any" style="display:none" checked>
                        <p>❌ I'm not taking any</p>
                    </button>
                    <button type="button" class="choice-btn selected" onclick="toggleChoice(this)">
                        <input type="checkbox" name="option4" value="Prefer not to say" style="display:none" checked>
                        <p>🤐 Prefer not to say</p>
                    </button>
                </div>
                
                <div class="animateImage">
                    <img src="animate4.png" alt="animatePicture">
                </div>
                
                <button type="submit" class="save-btn">Save</button>
            </form>
        </div>
    </div>

    <script>
        function toggleChoice(button) {
            button.classList.toggle('selected');
            const checkbox = button.querySelector('input[type="checkbox"]');
            checkbox.checked = !checkbox.checked;
        }
    </script>
</body>
</html>