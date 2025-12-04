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
            padding: 30px 80px;
        }
        .form-section {
            background: white;
            border-radius: 20px;
            padding: 40px;
            max-width: 900px;
            margin: 0 auto;
        }
        .back-btn {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 24px;
            color: #00313e;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        .form-group {
            margin-bottom: 25px;
        }
        .form-group label {
            display: block;
            color: #00313e;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 14px;
            font-family: Arial, sans-serif;
        }
        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }
        .choices-section {
            background: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .choices-section h3 {
            color: #00313e;
            font-size: 16px;
            margin-bottom: 15px;
        }
        .choice-item {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
            align-items: center;
        }
        .choice-item input {
            flex: 1;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
        }
        .remove-btn {
            background: #ff4444;
            color: white;
            border: none;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            cursor: pointer;
            font-size: 18px;
        }
        .add-choice-btn {
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
        }
        .button-group {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
        }
        .btn {
            padding: 12px 35px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-cancel {
            background: #e0e0e0;
            color: #333;
        }
        .btn-cancel:hover {
            background: #d0d0d0;
        }
        .btn-create {
            background: #00313e;
            color: white;
        }
        .btn-create:hover {
            background: #004455;
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
        <div class="form-section">
            <button class="back-btn" onclick="history.back()">↶</button>
            
            <form action="saveQuestion.jsp" method="post">
                <div class="form-group">
                    <label>Question Title</label>
                    <input type="text" name="questionTitle" 
                           placeholder="E.g., How would you describe your mood today?" required>
                </div>

                <div class="choices-section">
                    <h3>Choices</h3>
                    <div id="choicesContainer">
                        <div class="choice-item">
                            <input type="text" name="choice1" placeholder="Choice 1" required>
                        </div>
                        <div class="choice-item">
                            <input type="text" name="choice2" placeholder="Choice 2" required>
                        </div>
                        <div class="choice-item">
                            <input type="text" name="choice3" placeholder="Choice 3">
                            <button type="button" class="remove-btn" onclick="removeChoice(this)">×</button>
                        </div>
                        <div class="choice-item">
                            <input type="text" name="choice4" placeholder="Choice 4">
                            <button type="button" class="remove-btn" onclick="removeChoice(this)">×</button>
                        </div>
                    </div>
                    <button type="button" class="add-choice-btn" onclick="addChoice()">+ Add Choice</button>
                </div>

                <div class="form-group">
                    <label>Add red flag key</label>
                    <input type="text" name="redFlag" 
                           placeholder="E.g., suicide, self-harm">
                </div>

                <div class="button-group">
                    <button type="button" class="btn btn-cancel" onclick="history.back()">Cancel</button>
                    <button type="submit" class="btn btn-create">Create</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        let choiceCount = 4;

        function addChoice() {
            choiceCount++;
            const container = document.getElementById('choicesContainer');
            const newChoice = document.createElement('div');
            newChoice.className = 'choice-item';
            newChoice.innerHTML = `
                <input type="text" name="choice${choiceCount}" placeholder="Choice ${choiceCount}">
                <button type="button" class="remove-btn" onclick="removeChoice(this)">×</button>
            `;
            container.appendChild(newChoice);
        }

        function removeChoice(btn) {
            const choiceItem = btn.parentElement;
            choiceItem.remove();
        }
    </script>
</body>
</html>