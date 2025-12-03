<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anxiety & Stress Support Forum - MindLink</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #FFE6D0; /* soft peach, matches design */
            min-height: 100vh;
            overflow-x: hidden; /* ensure page fits laptop browser width */
        }

        /* Header */
        .header {
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            border-bottom: 1px solid #e0e0e0;
        }

        .nav-left,
        .nav-right {
            display: flex;
            align-items: center;
            justify-content: space-evenly; /* distribute header links equally */
            flex: 1;
            gap: 0;
        }

        .nav-left a, .nav-right a {
            text-decoration: none;
            color: #00313e;
            font-size: 16px;
            font-weight: 500;
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
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        /* Container */
        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 40px 20px 60px;
        }

        /* Back Button row */
        .top-row {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 30px;
            color: #00313e;
        }

        .back-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: none;
            background: transparent;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 22px;
            transition: transform 0.2s ease;
        }

        .back-btn:hover {
            transform: translateX(-4px);
        }

        .forum-emoji {
            font-size: 34px;
            margin-right: 6px;
        }

        /* Forum Title */
        .forum-title-wrapper {
            display: flex;
            flex-direction: column;
        }

        .forum-title {
            font-size: 36px;
            color: #00313e;
            font-weight: 700;
        }

        .forum-subtitle {
            color: #555;
            font-size: 14px;
            margin-top: 6px;
        }

        .new-discussion-btn {
            background: #00313e;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 999px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .new-discussion-btn:hover {
            background: #0d4e57;
            transform: translateY(-2px);
        }

        /* Section headers with button */
        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 18px;
        }

        .section-title {
            font-size: 24px;
            color: #00313e;
            font-weight: 700;
        }

        /* Pinned Post Card */
        .pinned-card {
            background: #FFEFD9;
            border-radius: 24px;
            border: 2px solid #F3C9A4;
            padding: 26px 32px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.06);
        }

        .pinned-main {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 20px;
            color: #00313e;
            font-weight: 600;
            margin-bottom: 16px;
        }

        .pinned-meta {
            font-size: 14px;
            color: #555;
            line-height: 1.6;
        }

        /* Recent Discussion Card */
        .discussion-card {
            background: #FFEFD9;
            border-radius: 24px;
            border: 2px solid #F3C9A4;
            padding: 28px 32px 22px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.06);
            position: relative;
        }

        .discussion-title {
            font-size: 20px;
            color: #00313e;
            font-weight: 700;
            margin-bottom: 8px;
            text-align: center;
        }

        .discussion-meta {
            font-size: 13px;
            color: #666;
            text-align: center;
            margin-bottom: 18px;
        }

        .discussion-body {
            font-size: 14px;
            color: #555;
            text-align: center;
            margin-bottom: 18px;
        }

        .discussion-stats {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 18px;
            font-size: 13px;
            color: #555;
            margin-bottom: 18px;
        }

        .stat {
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .more-btn {
            position: absolute;
            top: 22px;
            right: 22px;
            width: 34px;
            height: 34px;
            border-radius: 999px;
            border: none;
            background: #00313e;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 18px;
        }

        /* Input Area inside card */
        .input-section {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .input-field {
            flex: 1;
            padding: 12px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 25px;
            font-size: 14px;
            outline: none;
        }

        .input-field:focus {
            border-color: #00313e;
        }

        .post-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: none;
            background: #00313e;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 18px;
        }

        .report-btn {
            background: transparent;
            border: none;
            color: #00313e;
            font-size: 13px;
            cursor: pointer;
            text-decoration: underline;
        }

        /* Report Modal Overlay */
        .report-modal,
        .report-success-modal {
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.4);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 1200;
        }

        .report-modal.active,
        .report-success-modal.active {
            display: flex;
        }

        .report-card {
            background: #fff;
            border-radius: 20px;
            padding: 30px 40px;
            width: 420px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.25);
            font-size: 14px;
        }

        .report-title {
            font-weight: 700;
            color: #00313e;
            margin-bottom: 18px;
            text-align: center;
        }

        .report-options {
            margin-bottom: 14px;
        }

        .report-option {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 6px;
        }

        .report-option input {
            width: 14px;
            height: 14px;
        }

        .report-textarea {
            width: 100%;
            border-radius: 8px;
            border: 1px solid #ccc;
            padding: 8px 10px;
            font-family: inherit;
            font-size: 13px;
            margin-bottom: 18px;
        }

        .report-confirm-btn {
            width: 100%;
            padding: 10px 0;
            background: #00313e;
            color: #fff;
            border-radius: 999px;
            border: none;
            cursor: pointer;
            font-weight: 600;
        }

        .success-card {
            background: #fff;
            border-radius: 20px;
            padding: 26px 40px;
            width: 400px;
            text-align: center;
            box-shadow: 0 10px 35px rgba(0,0,0,0.25);
        }

        .success-icon {
            width: 64px;
            height: 64px;
            border-radius: 50%;
            border: 4px solid #00313e;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            margin: 0 auto 18px;
        }

        .success-text {
            font-size: 14px;
            color: #333;
            margin-bottom: 20px;
        }

        .success-confirm-btn {
            width: 70%;
            padding: 10px 0;
            background: #00313e;
            color: #fff;
            border-radius: 999px;
            border: none;
            cursor: pointer;
            font-weight: 600;
        }

        /* Chat Button */
        .chat-button {
            position: fixed;
            bottom: 60px;
            right: 60px;
            background: white;
            padding: 15px;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            z-index: 1000;
            text-decoration: none;
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .chat-button-icon {
            width: 50px;
            height: 50px;
            object-fit: contain;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
                padding: 20px;
            }

            .container {
                padding: 20px 15px;
            }

            .discussion-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
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
            <a href="${pageContext.request.contextPath}/forum/welcome" style="color: #0d4e57; font-weight: 600;">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <!-- Container -->
    <div class="container">
        <!-- Back + Title row -->
        <div class="top-row">
            <button class="back-btn" onclick="window.location.href='${pageContext.request.contextPath}/forum/joined'">←</button>
            <div class="forum-emoji">😰</div>
            <div class="forum-title-wrapper">
                <div class="forum-title">Anxiety &amp; Stress Support Forum</div>
                <div class="forum-subtitle">Share your own experiences and discuss with others!</div>
            </div>
        </div>

        <!-- Pinned Posts -->
        <div style="margin-bottom: 32px;">
            <div class="section-header">
                <h2 class="section-title">Pinned Posts</h2>
                <a href="${pageContext.request.contextPath}/forum/create" class="new-discussion-btn">+ New Discussion</a>
            </div>

            <div class="pinned-card">
                <div class="pinned-main">
                    <span>📌</span>
                    <span>Forum Guidelines &amp; Support Resources</span>
                </div>
                <div class="pinned-meta">
                    By: Moderator<br>
                    • Please read before posting<br>
                    • Be kind, respectful, and keep conversations supportive.
                </div>
            </div>
        </div>

        <!-- Recent Discussions -->
        <div>
            <div class="section-header">
                <h2 class="section-title">Recent Discussions</h2>
            </div>

            <div class="discussion-card">
                <button class="more-btn">⋯</button>

                <div class="discussion-title">"Anyone else anxious about final exams?"</div>
                <div class="discussion-meta">By: Anonymous • 2 hours ago</div>

                <div class="discussion-body">
                    I'm feeling overwhelmed with upcoming finals...
                </div>

                <div class="discussion-stats">
                    <span class="stat">💬 23 replies</span>
                    <span class="stat">👍 45</span>
                    <span class="stat">👎 12</span>
                </div>

                <div class="input-section">
                    <input type="text" class="input-field" placeholder="Type comment here....">
                    <button class="post-btn">➤</button>
                </div>

                <div style="margin-top: 12px; text-align: right; font-size: 13px;">
                    <button class="report-btn" onclick="openReportModal()">Report</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Report reason modal -->
    <div class="report-modal" id="reportModal">
        <div class="report-card">
            <div class="report-title">Please select a reason for reporting this post:</div>
            <div class="report-options">
                <label class="report-option">
                    <input type="checkbox" name="reason" value="spam">
                    <span>Spam or advertisement</span>
                </label>
                <label class="report-option">
                    <input type="checkbox" name="reason" value="harassment">
                    <span>Harassment or bullying</span>
                </label>
                <label class="report-option">
                    <input type="checkbox" name="reason" value="language">
                    <span>Inappropriate language</span>
                </label>
                <label class="report-option">
                    <input type="checkbox" name="reason" value="misinformation">
                    <span>Misinformation</span>
                </label>
            </div>
            <div style="font-size: 13px; margin-bottom: 6px;">Other:</div>
            <textarea class="report-textarea" id="reportOther" placeholder="Type here..."></textarea>
            <button class="report-confirm-btn" onclick="submitReport()">Confirm</button>
        </div>
    </div>

    <!-- Success modal -->
    <div class="report-success-modal" id="reportSuccessModal">
        <div class="success-card">
            <div class="success-icon">✔</div>
            <div class="success-text">
                Thank you! Your report has been submitted for review.
            </div>
            <button class="success-confirm-btn" onclick="closeSuccessModal()">Confirm</button>
        </div>
    </div>

    <!-- Chat Button -->
    <a href="${pageContext.request.contextPath}/ai/chatbot" class="chat-button">
        <img src="${pageContext.request.contextPath}/images/chatbot.png" alt="Chat" class="chat-button-icon">
    </a>
    <script>
        function openReportModal() {
            document.getElementById('reportModal').classList.add('active');
        }

        function submitReport() {
            // in a real app you would send the reasons to the server here
            document.getElementById('reportModal').classList.remove('active');
            document.getElementById('reportSuccessModal').classList.add('active');
        }

        function closeSuccessModal() {
            document.getElementById('reportSuccessModal').classList.remove('active');
        }

        // close modals when clicking outside card
        document.getElementById('reportModal').addEventListener('click', function (e) {
            if (e.target === this) this.classList.remove('active');
        });
        document.getElementById('reportSuccessModal').addEventListener('click', function (e) {
            if (e.target === this) this.classList.remove('active');
        });
    </script>
</body>
</html>
