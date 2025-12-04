<!-- register.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Register</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: rgba(255, 250, 240, 0.95);
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            max-width: 450px;
            width: 100%;
            padding: 40px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #2c5f5d;
            margin-bottom: 10px;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            object-fit: contain;
            display: inline-block;
            vertical-align: middle;
        }

        .hero-section {
            background: linear-gradient(135deg, #ff9a56 0%, #ff6b6b 50%, #feca57 100%);
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            margin-bottom: 30px;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: pulse 4s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-title {
            font-size: 28px;
            font-weight: bold;
            color: white;
            margin-bottom: 15px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .hero-description {
            color: white;
            font-size: 14px;
            line-height: 1.6;
        }

        .emoji-decoration {
            font-size: 40px;
            margin: 10px 5px;
        }

        .form-section {
            margin-bottom: 20px;
        }

        .form-title {
            font-size: 22px;
            font-weight: 600;
            color: #2c5f5d;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            color: #555;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
            background: white;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #2c5f5d;
            box-shadow: 0 0 0 3px rgba(44, 95, 93, 0.1);
        }

        .btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-primary {
            background: #2c5f5d;
            color: white;
            box-shadow: 0 4px 15px rgba(44, 95, 93, 0.3);
        }

        .btn-primary:hover {
            background: #1f4544;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(44, 95, 93, 0.4);
        }

        .link-group {
            display: flex;
            justify-content: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .link {
            color: #2c5f5d;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .link:hover {
            color: #ff6b6b;
            text-decoration: underline;
        }

        .error-message {
            background: #f8d7da;
            border: 2px solid #f5c6cb;
            color: #721c24;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        .watermark {
            text-align: center;
            margin-top: 30px;
            color: #999;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo"><img src="images/mindlink.png" alt="Mindlink logo" class="logo-icon"><span>MindLink</span></div>
        </div>

        <div class="hero-section">
            <div class="hero-content">
                <div class="emoji-decoration">😊 🧡 🌟</div>
                <h1 class="hero-title">Support for Your Mental Well-being</h1>
                <p class="hero-description">
                    Connect with licensed therapists, access free self-help resources, 
                    and mindfulness exercises anytime, anywhere.
                </p>
            </div>
        </div>

        <div class="form-section">
            <h2 class="form-title">Create Account</h2>
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <div class="error-message"><%= error %></div>
            <% } %>
            <form action="registerServlet" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="user@example.com" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="••••••••" required>
                </div>
                <div class="form-group">
                    <label for="confirm-password">Confirm Password</label>
                    <input type="password" id="confirm-password" name="confirmPassword" placeholder="••••••••" required>
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
            </form>
            <div class="link-group">
                <a href="login.jsp" class="link">Already have an account? Login</a>
            </div>
        </div>

        <div class="watermark">
            <p>Resources | MindLink © 2024</p>
        </div>
    </div>

    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
            }
        });
    </script>
</body>
</html>
