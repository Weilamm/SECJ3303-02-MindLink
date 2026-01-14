<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Counselor Application - MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #FDF3E7;
            display: flex; justify-content: center; align-items: center;
            min-height: 100vh; color: #003B46;
            padding: 20px;
        }
        
        .apply-card {
            background: white;
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            width: 100%;
            max-width: 500px;
        }

        .logo { font-size: 32px; font-weight: 700; margin-bottom: 10px; color: #003B46; text-align: center; }
        .logo img { width: 40px; height: 40px; vertical-align: middle; margin-right: 10px; }
        .subtitle { color: #667085; font-size: 14px; margin-bottom: 30px; text-align: center; }

        .form-group { margin-bottom: 20px; text-align: left; }
        label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; }
        
        input, textarea {
            width: 100%; padding: 12px;
            border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; outline: none; background: #F9FAFB;
            font-family: 'Poppins', sans-serif;
        }
        input:focus, textarea:focus { border-color: #003B46; background: white; }
        textarea { resize: vertical; min-height: 80px; }

        .btn-apply {
            width: 100%; padding: 12px;
            background-color: #003B46; color: white;
            border: none; border-radius: 8px;
            font-size: 16px; font-weight: 600;
            cursor: pointer; margin-top: 10px; transition: 0.3s;
        }
        .btn-apply:hover { background-color: #005566; }

        .error-msg {
            color: #d32f2f; background: #ffebee;
            padding: 10px; border-radius: 6px;
            font-size: 13px; margin-bottom: 20px;
        }

        .success-msg {
            color: #155724; background: #d4edda;
            padding: 10px; border-radius: 6px;
            font-size: 13px; margin-bottom: 20px;
        }

        .signin-link { 
            margin-top: 20px; font-size: 13px; color: #666; text-align: center; 
        }
        .signin-link a { color: #003B46; font-weight: 600; text-decoration: none; }
        .signin-link a:hover { text-decoration: underline; }

        .info-text {
            font-size: 12px; color: #888; margin-top: 5px;
        }
    </style>
</head>
<body>

    <div class="apply-card">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink Logo">MindLink
        </div>
        <p class="subtitle">Apply to become a counselor. Your application will be reviewed by an administrator.</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-msg"><%= request.getAttribute("error") %></div>
        <% } %>

        <% if (request.getAttribute("success") != null) { %>
            <div class="success-msg"><%= request.getAttribute("success") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/counselor/apply/submit" method="post">
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" placeholder="e.g. Tan Meiling" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="name@example.com" required>
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" name="phone" placeholder="e.g. +60123456789">
            </div>

            <div class="form-group">
                <label>Certification ID <span style="color: #d32f2f;">*</span></label>
                <input type="text" name="certId" placeholder="Enter your certification ID" required>
                <div class="info-text">Please provide your professional counseling certification ID for verification.</div>
            </div>

            <div class="form-group">
                <label>Location</label>
                <input type="text" name="location" placeholder="e.g. Kuala Lumpur, Malaysia">
            </div>

            <div class="form-group">
                <label>Education</label>
                <input type="text" name="education" placeholder="e.g. Master's in Psychology">
            </div>

            <div class="form-group">
                <label>University</label>
                <input type="text" name="university" placeholder="e.g. University of Malaya">
            </div>

            <div class="form-group">
                <label>Languages</label>
                <input type="text" name="languages" placeholder="e.g. English, Malay, Mandarin">
            </div>

            <div class="form-group">
                <label>Specialization</label>
                <input type="text" name="specialization" placeholder="e.g. Anxiety, Depression, Career Counseling">
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Create a password" required>
            </div>

            <button type="submit" class="btn-apply">Submit Application</button>
        </form>
        
        <div class="signin-link">
            Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in</a>
        </div>
    </div>

</body>
</html>

