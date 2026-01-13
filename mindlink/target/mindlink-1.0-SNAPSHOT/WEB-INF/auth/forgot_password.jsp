<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password - MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #FDF3E7; /* Beige Theme */
            display: flex; justify-content: center; align-items: center;
            height: 100vh; color: #003B46;
        }
        
        .card {
            background: white;
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            width: 400px;
            text-align: center;
        }

        .logo { font-size: 32px; font-weight: 700; margin-bottom: 10px; color: #003B46; }
        .title { font-size: 20px; font-weight: 700; margin-bottom: 5px; }
        .subtitle { color: #667085; font-size: 14px; margin-bottom: 30px; line-height: 1.5; }

        .form-group { margin-bottom: 20px; text-align: left; }
        label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; }
        
        input {
            width: 100%; padding: 12px;
            border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; outline: none; background: #F9FAFB;
        }
        input:focus { border-color: #003B46; background: white; }

        .btn-submit {
            width: 100%; padding: 12px;
            background-color: #003B46; color: white;
            border: none; border-radius: 8px;
            font-size: 16px; font-weight: 600;
            cursor: pointer; margin-top: 10px; transition: 0.3s;
        }
        .btn-submit:hover { background-color: #005566; }

        .back-link {
            display: block; margin-top: 20px;
            font-size: 13px; color: #666; text-decoration: none;
        }
        .back-link:hover { text-decoration: underline; color: #003B46; }
    </style>
</head>
<body>

    <div class="card">
        <div class="logo"><img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink Logo">MindLink</div>
        <div class="title">Forgot Password?</div>
        <p class="subtitle">No worries! Enter your email and we will send you a reset link.</p>

        <form action="/forgot-password/submit" method="post">
            
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="name@example.com" required>
            </div>

            <button type="submit" class="btn-submit">Send Reset Link</button>
        </form>
        
        <a href="/login" class="back-link">← Back to Login</a>
    </div>

</body>
</html>