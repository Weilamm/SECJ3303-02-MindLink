<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assessment Result</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFF9F2;
            --circle-orange: #D9863D;
            --circle-inner: #D4AF37; 
            --teal-box: #013B46;
            --btn-dark: #013B46;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
            color: var(--text-dark);
            /* Prevent full page scroll, we scroll inside the card */
            height: 100vh;
            overflow: hidden; 
        }

        /* Navbar */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 40px; margin-bottom: 20px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); margin: 0 15px; font-weight: 600; }
        .logo { font-size: 32px; font-weight: 800; color: var(--text-dark); }

        /* Main Center Container */
        .container {
            display: flex; justify-content: center; align-items: center;
            height: calc(100vh - 100px);
        }

        /* THE SCROLLABLE CARD */
        .result-card {
            background-color: var(--card-bg);
            width: 1000px;
            height: 600px; /* Fixed height to force scrolling */
            border-radius: 50px;
            padding: 20px 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            position: relative;
            
            /* Enable Vertical Scrolling */
            overflow-y: auto;
            scroll-behavior: smooth;
            
            /* Hide standard scrollbar for cleaner look */
            scrollbar-width: thin;
            scrollbar-color: #000000 #E0E0E0;
        }

        /* Custom Scrollbar Styling (Webkit) */
        .result-card::-webkit-scrollbar { width: 20px; }
        .result-card::-webkit-scrollbar-track { 
            background: #E0E0E0; 
            border-radius: 10px; 
            margin: 20px 0;
        }
        .result-card::-webkit-scrollbar-thumb { 
            background-color: #fff; 
            border: 2px solid #000;
            border-radius: 10px; 
        }

        /* --- SECTION 1: SCORE --- */
        .section-score {
            height: 600px; /* Full height of card */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        h1 { font-size: 32px; font-weight: 800; margin-bottom: 15px; }
        
        .hint-text {
            color: #4CAF50; /* Green text */
            font-size: 16px; font-weight: 600;
            margin-bottom: 40px;
        }

        /* The Score Circle */
        .score-circle-outer {
            width: 220px; height: 220px;
            background-color: var(--circle-orange);
            border-radius: 50%;
            display: flex; justify-content: center; align-items: center;
        }
        
        .score-circle-inner {
            width: 160px; height: 160px;
            background-color: #CFB562; /* Muted gold/yellow */
            border-radius: 50%;
            display: flex; justify-content: center; align-items: center;
            font-size: 80px;
            font-weight: 800;
            color: white;
        }

        /* --- SECTION 2: SUGGESTIONS --- */
        .section-suggestion {
            min-height: 600px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding-top: 20px;
        }

        .suggestion-grid {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 40px;
            width: 100%;
        }

        .teacher-img {
            width: 250px;
            height: auto;
        }

        /* The Dark Box */
        .info-box {
            background-color: var(--teal-box);
            color: white;
            padding: 40px;
            border-radius: 30px;
            width: 450px;
            position: relative;
            text-align: left;
        }

        .info-box h3 { font-size: 20px; margin-bottom: 5px; font-weight: 700; }
        .info-box p { font-size: 16px; margin-bottom: 20px; line-height: 1.4; }
        
        .suggestion-list { margin-bottom: 20px; padding-left: 20px; }
        .suggestion-list li { margin-bottom: 8px; font-size: 16px; font-weight: 600; }

        .contact-info { font-size: 16px; font-weight: 700; margin-top: 10px; }

        /* Done Button */
        .btn-done {
            display: inline-block;
            background-color: var(--btn-dark);
            color: white;
            padding: 12px 60px;
            border-radius: 10px;
            font-size: 20px; font-weight: 700;
            text-decoration: none;
            margin-top: 40px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        .btn-done:hover { opacity: 0.9; }

        /* Navigation Arrows (Visual only to match screenshot) */
        .scroll-arrow-down {
            margin-top: 20px;
            font-size: 24px; color: #000;
            animation: bounce 2s infinite;
        }
        
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
            40% {transform: translateY(-10px);}
            60% {transform: translateY(-5px);}
        }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="/home">Home</a>
            <a href="/learning">Learning</a>
        </div>
        <div class="logo">MindLink</div>
        <div class="nav-links">
            <a href="/forum">Community</a>
            <a href="/profile">Profile</a>
        </div>
    </nav>

    <div class="container">
        <div class="result-card">
            
            <div class="section-score">
                <h1>Your mental health score has been done!</h1>
                <div class="hint-text">Scroll down to view the suggesitons 🍃</div>

                <div class="score-circle-outer">
                    <div class="score-circle-inner">
                        55
                    </div>
                </div>

                <div class="scroll-arrow-down">▼</div>
            </div>

            <div class="section-suggestion">
                <h1 style="margin-bottom: 40px;">Suggestion :</h1>

                <div class="suggestion-grid">
                    <img src="${pageContext.request.contextPath}/images/teacher-pointing.png" alt="Teacher" class="teacher-img">

                    <div class="info-box">
                        <h3>Oh No !</h3>
                        <p>Your mental health is not good !</p>

                        <p>Here are some suggestions:</p>
                        <ul class="suggestion-list">
                            <li>Eat Healthy Food</li>
                            <li>Get More Sleep</li>
                        </ul>

                        <div class="contact-info">
                            You may contact:<br>
                            Dr. Amirah (+60 12 - 345 6789)
                        </div>
                    </div>
                </div>

                <a href="/home" class="btn-done">Done</a>
            </div>

        </div>
    </div>

</body>
</html>