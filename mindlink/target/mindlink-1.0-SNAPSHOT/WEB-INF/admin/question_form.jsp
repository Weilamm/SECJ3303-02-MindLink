<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Question Form - MindLink Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-yellow: #F2C94C;
            --btn-teal: #48C9B0;
            --btn-pink: #F497AA;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 0;
            color: var(--text-dark);
        }

        .container {
            max-width: 800px;
            margin: 60px auto;
            padding: 0 40px;
        }

        .form-card {
            background: var(--card-bg);
            border-radius: 40px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        h2 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 30px;
            color: var(--text-dark);
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-dark);
            font-size: 16px;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 15px;
            font-family: inherit;
            font-size: 16px;
            transition: border-color 0.3s;
            box-sizing: border-box;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: var(--btn-teal);
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 30px;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: opacity 0.3s;
            margin-right: 10px;
        }

        .btn-teal {
            background-color: var(--btn-teal);
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-cancel {
            background-color: #999;
        }

        .form-actions {
            margin-top: 30px;
            display: flex;
            gap: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-card">
            <h2>${question.questionId == 0 ? 'Add New' : 'Edit'} Question</h2>
            
            <form action="${pageContext.request.contextPath}/admin/modules/questions/save" method="post">
                <input type="hidden" name="questionId" value="${question.questionId}">
                <input type="hidden" name="moduleId" value="${question.moduleId}">
                
                <div class="form-group">
                    <label>Chapter Number</label>
                    <input type="number" name="chapterNumber" value="${question.chapterNumber}" min="1" required>
                </div>
                
                <div class="form-group">
                    <label>Question Number (e.g., 1.1, 1.2, 2.1)</label>
                    <input type="text" name="questionNumber" value="${question.questionNumber}" placeholder="1.1" required>
                </div>
                
                <div class="form-group">
                    <label>Question Text</label>
                    <textarea name="questionText" rows="3" required>${question.questionText}</textarea>
                </div>
                
                <div class="form-group">
                    <label>Question Type</label>
                    <select name="questionType" required>
                        <option value="PDF" ${question.questionType == 'PDF' ? 'selected' : ''}>PDF</option>
                        <option value="text" ${question.questionType == 'text' ? 'selected' : ''}>Text</option>
                        <option value="video" ${question.questionType == 'video' ? 'selected' : ''}>Video</option>
                    </select>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-teal">Save Question</button>
                    <a href="${pageContext.request.contextPath}/admin/modules/dashboard" class="btn btn-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>



