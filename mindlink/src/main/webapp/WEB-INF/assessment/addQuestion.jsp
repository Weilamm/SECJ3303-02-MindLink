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
        .create-section {
            background: white;
            border-radius: 20px;
            padding: 40px;
            max-width: 800px;
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
        .section-title {
            color: #00313e;
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }
        .question-type-card {
            background: #f5f5f5;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 15px;
            cursor: pointer;
            transition: all 0.3s;
            border: 2px solid transparent;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .question-type-card:hover {
            border-color: #00313e;
            transform: translateX(5px);
        }
        .question-type-card.selected {
            background: #e3f2fd;
            border-color: #00313e;
        }
        .type-icon {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
        }
        .type-info h3 {
            color: #00313e;
            font-size: 18px;
            margin-bottom: 5px;
        }
        .type-info p {
            color: #666;
            font-size: 14px;
        }
        .continue-btn {
            background: #00313e;
            color: white;
            border: none;
            border-radius: 25px;
            padding: 12px 40px;
            font-size: 16px;
            cursor: pointer;
            float: right;
            margin-top: 20px;
        }
        .continue-btn:hover {
            background: #004455;
        }
        .continue-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
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
        <div class="create-section">
            <button class="back-btn" onclick="history.back()">↶</button>
            
            <h2 class="section-title">What type of question would you like to create?</h2>
            
            <form id="questionTypeForm" action="createQuestion.jsp" method="post">
                <input type="hidden" name="questionType" id="selectedType">
                
                <div class="question-type-card" onclick="selectType(this, 'multiple')">
                    <div class="type-icon">
                        <img src="animate13.png" alt="Multiple Choice" style="width: 100%; height: 100%; object-fit: contain;">
                    </div>
                    <div class="type-info">
                        <h3>Multiple Choices</h3>
                        <p>Give students several answer alternatives to choose from.</p>
                    </div>
                </div>

                <div class="question-type-card" onclick="selectType(this, 'text')">
                    <div class="type-icon">
                        <img src="animate14.png" alt="Type Answer" style="width: 100%; height: 100%; object-fit: contain;">
                    </div>
                    <div class="type-info">
                        <h3>Type Answer</h3>
                        <p>Ask the students to type out their answer or add tags.</p>
                    </div>
                </div>

                <button type="submit" class="continue-btn" id="continueBtn" disabled>Continue</button>
            </form>
        </div>
    </div>

    <script>
        let selectedCard = null;

        function selectType(card, type) {
            if (selectedCard) {
                selectedCard.classList.remove('selected');
            }
            
            card.classList.add('selected');
            selectedCard = card;
            
            document.getElementById('selectedType').value = type;
            
            document.getElementById('continueBtn').disabled = false;
        }
    </script>
</body>
</html>