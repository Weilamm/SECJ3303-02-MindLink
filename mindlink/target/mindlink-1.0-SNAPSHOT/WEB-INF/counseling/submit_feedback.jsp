<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Share Your Feedback</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --input-bg: #F2F7F8;
            --btn-teal: #48C9B0;
            --success-green: #6FCF97; /* Green from screenshot */
        }

        body { font-family: 'Inter', sans-serif; background-color: var(--bg-color); margin: 0; padding: 20px; color: var(--text-dark); }
        /* Header Navigation */
        .header {
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
        }

        .nav-left,
        .nav-right {
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            flex: 1;
            gap: 0;
        }

        .nav-left a, .nav-right a {
            text-decoration: none;
            color: #00313e;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-left a:hover, .nav-right a:hover {
            color: #0d4e57;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 700;
            color: #00313e;
            font-size: 32px;
            text-decoration: none;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .container { max-width: 900px; margin: 40px auto; }
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 5px; }
        .subtitle { color: #666; font-size: 16px; margin-bottom: 40px; }

        /* Form Styles */
        .form-group { margin-bottom: 25px; }
        label { display: block; font-size: 14px; font-weight: 700; margin-bottom: 8px; }
        .form-control { width: 100%; padding: 15px; background-color: var(--input-bg); border: 1px solid #E0E0E0; border-radius: 6px; font-size: 15px; outline: none; box-sizing: border-box; }
        textarea.form-control { height: 150px; resize: vertical; }
        
        .btn-submit { background-color: var(--btn-teal); color: white; width: 100%; padding: 15px; border: none; border-radius: 6px; font-size: 16px; font-weight: 600; cursor: pointer; margin-top: 20px; transition: 0.2s; }
        .btn-submit:hover { opacity: 0.9; }

        /* --- SUCCESS MODAL STYLES --- */
        .modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.4); /* Dimmed background */
            display: flex; justify-content: center; align-items: center;
            z-index: 1000;
            backdrop-filter: blur(2px); /* Blur effect */
        }

        .success-box {
            background: white;
            padding: 40px 60px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            animation: popIn 0.3s ease-out;
        }

        @keyframes popIn {
            0% { transform: scale(0.8); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        .check-icon {
            width: 80px; height: 80px;
            background-color: var(--success-green);
            border-radius: 50%;
            display: inline-flex;
            justify-content: center; align-items: center;
            margin-bottom: 20px;
            color: white;
            font-size: 40px;
        }

        .success-title { font-size: 24px; font-weight: 700; color: #003049; margin-bottom: 10px; }
        
        /* Hidden by default, shown via Java logic */
        .hidden { display: none; }

    </style>
</head>
<body>

<!-- Header Navigation -->
    <div class="header">
        <div class="nav-left">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/learning">Learning</a>
        </div>
        
        <a href="${pageContext.request.contextPath}/home" class="logo">
            <div class="logo-icon">
                <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
            </div>
            <span>MindLink</span>
        </a>
        
        <div class="nav-right">
            <a href="${pageContext.request.contextPath}/forum/welcome">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <div class="container">
        <h1>Share Your Feedback</h1>
        <p class="subtitle">Help us improve your experience. Your thoughts matter to us.</p>

        <form action="/counseling/history/feedback/submit" method="post">
            <input type="hidden" name="bookingId" value="${bookingId}">
            
            <div class="form-group">
                <label>Category</label>
                <select name="category" class="form-control">
                    <option>Counseling Session</option>
                    <option>Platform Issue</option>
                </select>
            </div>

            <div class="form-group">
                <label>Subject</label>
                <input type="text" name="subject" class="form-control" placeholder="Brief summary of your feedback">
            </div>

            <div class="form-group">
                <label>Message</label>
                <textarea name="message" class="form-control" placeholder="Share your thoughts in details"></textarea>
            </div>

            <div class="form-group">
                <label>Overall Rating (Optional)</label>
                <select name="rating" class="form-control">
                    <option>Rate your experience</option>
                    <option>5 - Excellent</option>
                    <option>4 - Good</option>
                </select>
            </div>

            <button type="submit" class="btn-submit">Submit Feedback</button>
        </form>
    </div>

    <c:if test="${success}">
        <div class="modal-overlay" id="successModal">
            <div class="success-box">
                <div class="check-icon">✓</div>
                <div class="success-title">Feedback Submitted !</div>
            </div>
        </div>

        <script>
            // Automatically redirect back to History page after 2 seconds
            setTimeout(function() {
                window.location.href = "/counseling/history";
            }, 2000);
        </script>
    </c:if>

</body>
</html>