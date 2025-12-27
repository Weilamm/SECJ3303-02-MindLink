<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Learning Modules</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --bar-bg: #E0E0E0;
            --text-grey: #666666;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
            color: var(--text-dark);
        }

        /* Navbar */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 40px; margin-bottom: 20px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); margin: 0 15px; font-weight: 500; }
        .logo { font-size: 32px; font-weight: 800; color: var(--text-dark); }

        /* Main Container */
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding-bottom: 50px;
        }

        /* Module Card */
        .module-card {
            background-color: var(--card-bg);
            border-radius: 30px;
            padding: 30px;
            display: flex;
            gap: 40px;
            align-items: center;
            margin-bottom: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.03);
            transition: transform 0.2s;
            cursor: pointer;
            text-decoration: none; /* For the anchor wrap */
            color: inherit;
        }

        .module-card:hover {
            transform: translateY(-5px);
        }

        /* Left Image */
        .module-img {
            width: 300px;
            height: 200px;
            object-fit: cover;
            border-radius: 20px;
            background-color: #eee; /* Placeholder color */
        }

        /* Right Content */
        .module-content {
            flex: 1;
        }

        .module-title {
            font-size: 24px;
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 15px;
        }

        .module-desc {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        /* Progress Bar */
        .progress-section {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .progress-label {
            font-weight: 700;
            font-size: 14px;
            color: var(--text-dark);
        }

        .progress-track {
            flex: 1;
            height: 15px;
            background-color: var(--bar-bg);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);
        }

        .progress-fill {
            height: 100%;
            background-color: #48C9B0; /* Teal fill color */
            width: 0%; /* Default 0% */
            border-radius: 10px;
        }

        .progress-text {
            font-size: 12px;
            color: #777;
            font-weight: 600;
            min-width: 80px;
            text-align: right;
        }

        /* Custom Scrollbar for the page (optional based on screenshot) */
        ::-webkit-scrollbar { width: 10px; }
        ::-webkit-scrollbar-track { background: #EEDCC8; }
        ::-webkit-scrollbar-thumb { background: #C4A484; border-radius: 5px; }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="/home">Home</a>
            <a href="/learning" style="font-weight:700;">Learning</a>
        </div>
        <div class="logo">MindLink</div>
        <div class="nav-links">
            <a href="/forum">Forum</a>
            <a href="/profile">Profile</a>
        </div>
    </nav>

    <div class="container">
        
        <a href="/learning/modules/intro" class="module-card">
            <img src="${pageContext.request.contextPath}/images/mental-health-intro.png" class="module-img" alt="Intro">
            
            <div class="module-content">
                <div class="module-title">Introduction to Mental Health</div>
                <div class="module-desc">...</div>

                <div class="progress-section">
                    <span class="progress-label">Progress :</span>
                    <div class="progress-track">
                        <div class="progress-fill" id="homeIntroBar" style="width: 0%;"></div>
                    </div>
                    <span class="progress-text" id="homeIntroText">0% Completed</span>
                </div>
            </div>
        </a>

        <a href="/learning/modules/emotional" class="module-card">
            <img src="${pageContext.request.contextPath}/images/emotional-awareness.png" class="module-img" alt="Emotions">
            
            <div class="module-content">
                <div class="module-title">Emotional Awareness and Regulation</div>
                <div class="module-desc">
                    Recognize your emotions, understand their causes, and develop healthy strategies to manage them effectively in daily and social situations.
                </div>

                <div class="progress-section">
                    <span class="progress-label">Progress :</span>
                    <div class="progress-track">
                        <div class="progress-fill" style="width: 0%;"></div>
                    </div>
                    <span class="progress-text">0% Completed</span>
                </div>
            </div>
        </a>

        </div>

        <script>
        // Check browser memory when page loads
        window.onload = function() {
            // 1. Get the saved percentage (default to 0 if nothing saved)
            const savedPercent = localStorage.getItem('intro_progress_percent') || 0;

            // 2. Update the bar width
            const bar = document.getElementById('homeIntroBar');
            if (bar) {
                bar.style.width = savedPercent + "%";
            }

            // 3. Update the text
            const text = document.getElementById('homeIntroText');
            if (text) {
                text.innerText = savedPercent + "% Completed";
            }
        };
    </script>
</body>
</html>