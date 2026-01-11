<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${forum != null && forum.id > 0 ? 'Edit' : 'Create'} Forum - Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-blue: #00313e;
            --btn-grey: #E0E0E0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            padding: 20px;
            color: var(--text-dark);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .logo {
            font-size: 24px;
            font-weight: 800;
        }

        .form-card {
            max-width: 700px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        h2 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 30px;
            color: var(--text-dark);
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-dark);
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        textarea:focus {
            outline: none;
            border-color: var(--btn-blue);
        }

        textarea {
            min-height: 120px;
            resize: vertical;
        }

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
        }

        .btn-primary {
            background-color: var(--btn-blue);
            color: white;
        }

        .btn-primary:hover {
            background-color: #004d61;
        }

        .btn-secondary {
            background-color: var(--btn-grey);
            color: #333;
        }

        .btn-secondary:hover {
            background-color: #d0d0d0;
        }
    </style>
</head>
<body>

    <div class="header">
        <div class="logo">MindLink Admin</div>
        <a href="${pageContext.request.contextPath}/admin/forum/manage" class="btn btn-secondary">← Back to Forums</a>
    </div>

    <div class="form-card">
        <h2>${forum != null && forum.id > 0 ? 'Edit' : 'Create'} Forum</h2>

        <form action="${pageContext.request.contextPath}/admin/forum/${forum != null && forum.id > 0 ? 'update' : 'create'}" method="post">
            <c:if test="${forum != null && forum.id > 0}">
                <input type="hidden" name="id" value="${forum.id}">
            </c:if>

            <div class="form-group">
                <label for="title">Forum Title <span style="color: red;">*</span></label>
                <input type="text" id="title" name="title" 
                       value="${forum != null ? forum.title : ''}" 
                       placeholder="e.g., Coping with Exam Stress" required>
            </div>

            <div class="form-group">
                <label for="description">Description <span style="color: red;">*</span></label>
                <textarea id="description" name="description" 
                          placeholder="Describe what this forum is about..." required>${forum != null ? forum.description : ''}</textarea>
            </div>

            <div class="button-group">
                <button type="submit" class="btn btn-primary">
                    ${forum != null && forum.id > 0 ? 'Update Forum' : 'Create Forum'}
                </button>
                <a href="${pageContext.request.contextPath}/admin/forum/manage" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>

</body>
</html>

