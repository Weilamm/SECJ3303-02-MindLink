<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UC11 RECEIVE AUTOMATE TIPS - MindLink</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #FFE6D0;
            min-height: 100vh;
            overflow-x: hidden; /* ensure page fits laptop browser width */
        }

        /* Header - same as home / forum / chatbot */
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
            justify-content: space-evenly;
            flex: 1;
            gap: 0;
        }

        .nav-left a,
        .nav-right a {
            text-decoration: none;
            color: #00313e;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-left a:hover,
        .nav-right a:hover {
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
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        @media (max-width: 1200px) {
            .header {
                padding: 20px 50px;
            }
        }

        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
            }
        }

        /* Back Button */
        .back-button {
            position: absolute;
            top: 80px;
            left: 40px;
            background: white;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: all 0.3s;
        }

        .back-button:hover {
            background-color: #f0f0f0;
            transform: translateX(-3px);
        }

        /* Tips Container */
        .tips-container {
            max-width: 600px;
            margin: 100px auto 40px;
            position: relative;
        }

        .tip-card {
            background: white;
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            position: relative;
            min-height: 350px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .tip-number {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }

        .tip-title {
            font-size: 22px;
            font-weight: 700;
            color: #0d5555;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .tip-emoji {
            font-size: 28px;
        }

        .tip-content {
            color: #555;
            line-height: 1.8;
            font-size: 15px;
            margin-bottom: 30px;
        }

        /* Decorative Elements */
        .heart-decoration {
            position: absolute;
            right: 40px;
            bottom: 80px;
            width: 80px;
            height: 80px;
            font-size: 60px;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .flower-decoration {
            position: absolute;
            right: 100px;
            bottom: 150px;
            width: 50px;
            height: 50px;
            font-size: 40px;
            animation: rotate 10s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Progress Dots */
        .progress-dots {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 30px;
        }

        .dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: #ddd;
            cursor: pointer;
            transition: all 0.3s;
        }

        .dot.active {
            background-color: #0d5555;
            width: 30px;
            border-radius: 5px;
        }

        /* Next Button */
        .next-button {
            align-self: flex-end;
            background-color: #0d5555;
            color: white;
            border: none;
            padding: 12px 35px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 12px rgba(13, 85, 85, 0.3);
        }

        .next-button:hover {
            background-color: #0a4444;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(13, 85, 85, 0.4);
        }

        /* Hidden class for tips */
        .hidden {
            display: none;
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
            <a href="${pageContext.request.contextPath}/forum/welcome">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <!-- Back Button -->
    <button class="back-button" onclick="window.history.back()">
        <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
        </svg>
    </button>

    <!-- Tips Container -->
    <div class="tips-container">
        <c:forEach var="tip" items="${randomTips}" varStatus="status">
            <div class="tip-card ${status.index == 0 ? '' : 'hidden'}" id="tip${status.index + 1}">
                <div>
                    <div class="tip-number">${status.index + 1}.</div>
                    <div class="tip-title">
                        <span class="tip-emoji">💡</span>
                        ${tip.title}
                    </div>
                    <div class="tip-content">
                        ${tip.content}
                    </div>
                </div>
                <c:choose>
                    <c:when test="${status.index < randomTips.size() - 1}">
                        <button class="next-button" onclick="nextTip(${status.index + 2})">Next</button>
                    </c:when>
                    <c:otherwise>
                        <button class="next-button" onclick="nextTip(1)">Next</button>
                    </c:otherwise>
                </c:choose>
                
                <div class="heart-decoration">💛</div>
                <div class="flower-decoration">🌸</div>
            </div>
        </c:forEach>

        <!-- Progress Dots -->
        <div class="progress-dots">
            <c:forEach var="tip" items="${randomTips}" varStatus="status">
                <div class="dot ${status.index == 0 ? 'active' : ''}" id="dot${status.index + 1}" onclick="showTip(${status.index + 1})"></div>
            </c:forEach>
        </div>
    </div>

    <script>
        const totalTips = ${randomTips.size()};
        let currentTip = 1;

        function nextTip(tipNumber) {
            // Hide current tip
            document.getElementById('tip' + currentTip).classList.add('hidden');
            const currentDot = document.getElementById('dot' + currentTip);
            if (currentDot) currentDot.classList.remove('active');
            
            // Show next tip
            document.getElementById('tip' + tipNumber).classList.remove('hidden');
            const nextDot = document.getElementById('dot' + tipNumber);
            if (nextDot) nextDot.classList.add('active');
            
            currentTip = tipNumber;
        }

        function showTip(tipNumber) {
            // Hide all tips
            for (let i = 1; i <= totalTips; i++) {
                const tipEl = document.getElementById('tip' + i);
                const dotEl = document.getElementById('dot' + i);
                if (tipEl) tipEl.classList.add('hidden');
                if (dotEl) dotEl.classList.remove('active');
            }
            
            // Show selected tip
            const selectedTip = document.getElementById('tip' + tipNumber);
            const selectedDot = document.getElementById('dot' + tipNumber);
            if (selectedTip) selectedTip.classList.remove('hidden');
            if (selectedDot) selectedDot.classList.add('active');
            
            currentTip = tipNumber;
        }
    </script>
</body>
</html>