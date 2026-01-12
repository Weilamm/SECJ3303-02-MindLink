<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login - MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #FDF3E7; /* Your Beige Theme */
            display: flex; justify-content: center; align-items: center;
            height: 100vh; color: #003B46;
        }
        
        .login-card {
            background: white;
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            width: 400px;
            text-align: center;
        }

        .logo { font-size: 32px; font-weight: 700; margin-bottom: 10px; color: #003B46; }
        .subtitle { color: #667085; font-size: 14px; margin-bottom: 30px; }
        .admin-badge {
            background: #FF6B6B;
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 20px;
        }

        .form-group { margin-bottom: 20px; text-align: left; }
        label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; }
        
        input {
            width: 100%; padding: 12px;
            border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; outline: none; background: #F9FAFB;
        }
        input:focus { border-color: #003B46; background: white; }

        .btn-login {
            width: 100%; padding: 12px;
            background-color: #003B46; color: white;
            border: none; border-radius: 8px;
            font-size: 16px; font-weight: 600;
            cursor: pointer; margin-top: 10px; transition: 0.3s;
        }
        .btn-login:hover { background-color: #005566; }

        .error-msg {
            color: #d32f2f; background: #ffebee;
            padding: 10px; border-radius: 6px;
            font-size: 13px; margin-bottom: 20px;
        }
        
        .hint {
            font-size: 11px; color: #888; margin-top: 5px;
        }
        
        .back-link {
            margin-top: 20px;
            font-size: 13px;
        }
        .back-link a {
            color: #003B46; text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink Logo" style="width: 40px; height: 40px; vertical-align: middle;">
            MindLink
        </div>
        <div class="admin-badge">ADMIN PORTAL</div>
        <p class="subtitle">Administrator Access Only</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-msg"><%= request.getAttribute("error") %></div>
        <% } %>

        <% if (request.getAttribute("success") != null) { %>
            <div style="color: #155724; background-color: #d4edda; padding: 10px; border-radius: 6px; font-size: 13px; margin-bottom: 20px;">
                <%= request.getAttribute("success") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/admin/login/submit" method="post">
            
            <div class="form-group">
                <label>Admin ID or Email</label>
                <input type="text" name="username" placeholder="Enter admin ID or email" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
                <div class="hint">
                    (Example: <b>A001</b> or <b>testadmin@utm.my</b> / <b>admin123</b>)
                </div>
            </div>

            <button type="submit" class="btn-login">Sign In as Admin</button>
        </form>
        
        <div class="back-link">
            <a href="${pageContext.request.contextPath}/login">← Back to User Login</a>
        </div>
    </div>

</body>
</html>