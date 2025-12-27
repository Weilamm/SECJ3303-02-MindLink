<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - MindLink</title>
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

        .form-group { margin-bottom: 20px; text-align: left; }
        label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; }
        
        input, select {
            width: 100%; padding: 12px;
            border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; outline: none; background: #F9FAFB;
        }
        input:focus, select:focus { border-color: #003B46; background: white; }

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
        
        .role-selector {
            display: flex; gap: 10px; margin-bottom: 20px;
        }
        .role-option { flex: 1; }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="logo"><img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink Logo">MindLink</div>
        <p class="subtitle">Welcome back! Please enter your details.</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-msg"><%= request.getAttribute("error") %></div>
        <% } %>

        <% if (request.getAttribute("success") != null) { %>
            <div style="color: #155724; background-color: #d4edda; padding: 10px; border-radius: 6px; font-size: 13px; margin-bottom: 20px;">
                <%= request.getAttribute("success") %>
            </div>
        <% } %>

        <form action="/login/submit" method="post">
            
            <div class="form-group">
                <label>I am a...</label>
                <select name="role" id="roleSelect" onchange="toggleHint()">
                    <option value="student">Student</option>
                    <option value="admin">Administrator</option>
                </select>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
                <div style="text-align: right; margin-top: 5px;">
                    <a href="/forgot-password" style="font-size: 12px; color: #003B46; text-decoration: none;">Forgot password?</a>
                </div>
                <div id="adminHint" style="font-size:11px; color:#888; margin-top:5px; display:none;">
                    (Hint: use <b>admin</b> / <b>admin123</b>)
                </div>
            </div>

            <button type="submit" class="btn-login">Sign In</button>
        </form>
        
        <p style="margin-top: 20px; font-size: 13px; color: #666;">
            Don't have an account? <a href="/register" style="color: #003B46; font-weight: 600;">Register</a>
        </p>
    </div>

    <script>
        function toggleHint() {
            var role = document.getElementById("roleSelect").value;
            var hint = document.getElementById("adminHint");
            if(role === "admin") {
                hint.style.display = "block";
            } else {
                hint.style.display = "none";
            }
        }
    </script>

</body>
</html>