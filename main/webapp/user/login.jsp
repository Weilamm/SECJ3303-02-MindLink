<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Login</title>
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

        .form-section { margin-bottom: 20px; }

        .form-title {
            font-size: 22px;
            font-weight: 600;
            color: #2c5f5d;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group { margin-bottom: 20px; }

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

        input:focus {
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
            justify-content: space-between;
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

        .info-text {
            font-size: 13px;
            color: #666;
            margin-bottom: 15px;
            line-height: 1.5;
        }

        .success-message {
            background: #d4edda;
            border: 2px solid #c3e6cb;
            color: #155724;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
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

    <%
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");

        // FIXED: Supports both parameter and attribute
        String mode = request.getParameter("mode");
        if (mode == null) {
            mode = (String) request.getAttribute("mode");
        }
        if (mode == null) mode = "login";
    %>

    <% if ("forgot".equals(mode)) { %>

        <!-- ======================= FORGOT PASSWORD ======================= -->
        <div class="form-section">
            <h2 class="form-title">Forgot Password</h2>
            <p class="info-text">
                Enter your email and we’ll send you a password reset link.
            </p>

            <% if (message != null) { %>
                <div class="success-message"><%= message %></div>
            <% } %>

            <% if (error != null) { %>
                <div class="error-message"><%= error %></div>
            <% } %>

            <form action="forgotPasswordServlet" method="post">
                <div class="form-group">
                    <label for="forgot-email">Email</label>
                    <input type="email" id="forgot-email" name="email" placeholder="user@example.com" required>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

            <div class="link-group">
                <a href="login.jsp" class="link">Back to Login</a>
            </div>
        </div>

    <% } else { %>

        <!-- ======================= LOGIN FORM ======================= -->
        <div class="form-section">
            <h2 class="form-title">Log In</h2>

            <% if (message != null) { %>
                <div class="success-message"><%= message %></div>
            <% } %>

            <% if (error != null) { %>
                <div class="error-message"><%= error %></div>
            <% } %>

            <form action="loginServlet" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="user@example.com" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="••••••••" required>
                </div>

                <button type="submit" class="btn btn-primary">Login</button>
            </form>

            <div class="link-group">
                <a href="login.jsp?mode=forgot" class="link">Forgot Password?</a>
                <a href="register.jsp" class="link">Register Here</a>
            </div>
        </div>

    <% } %>

    <div class="watermark">
        <p>Resources | MindLink © 2024</p>
    </div>

</div>
</body>
</html>
