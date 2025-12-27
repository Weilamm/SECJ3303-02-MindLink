<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Expression Analysis</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --input-bg: #013B46; /* Dark Teal background for textarea */
            --highlight: #4E8692; /* Lighter teal for highlighted text */
            --btn-green: #86E393;
            --btn-red: #FF6B6B;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
            color: var(--text-dark);
        }

        /* Navbar */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 40px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); margin: 0 15px; font-weight: 600; }
        .logo { font-size: 32px; font-weight: 800; color: var(--text-dark); }

        /* Main Container */
        .container {
            display: flex; justify-content: center; align-items: center;
            min-height: 80vh;
        }

        /* The White Card */
        .assessment-card {
            background: white;
            width: 1000px;
            border-radius: 40px;
            padding: 40px;
            position: relative;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        /* Header Elements */
        .close-btn {
            position: absolute;
            top: 40px; left: 40px;
            width: 40px; height: 40px;
            background-color: var(--btn-red);
            border-radius: 50%;
            display: flex; justify-content: center; align-items: center;
            color: white; font-weight: bold; font-size: 20px;
            text-decoration: none; cursor: pointer;
        }

        .progress-pill {
            position: absolute;
            top: 40px; right: 40px;
            background-color: var(--input-bg);
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
        }

        .card-header { text-align: center; margin-bottom: 40px; }
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 10px; }
        .subtitle { color: #666; font-size: 16px; }

        /* Content Layout */
        .content-row {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 50px;
            margin-bottom: 40px;
        }

        .illustration img { width: 250px; height: auto; }

        /* Input Area Styling */
        .input-box {
            background-color: var(--input-bg);
            border-radius: 20px;
            padding: 30px;
            width: 450px;
            position: relative;
        }

        textarea {
            width: 100%;
            height: 150px;
            background: transparent;
            border: none;
            color: white;
            font-size: 20px;
            font-family: inherit;
            resize: none;
            outline: none;
            line-height: 1.5;
        }
        
        textarea::placeholder { color: rgba(255,255,255,0.5); }

        .char-count {
            position: absolute;
            bottom: 15px; right: 20px;
            color: rgba(255,255,255,0.6);
            font-size: 12px;
            display: flex; align-items: center; gap: 5px;
        }

        /* Voice Button */
        .voice-btn {
            display: block;
            margin: 20px auto 0 auto;
            background-color: var(--btn-green);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 30px;
            font-weight: 600;
            cursor: pointer;
            display: flex; align-items: center; gap: 8px;
            width: fit-content;
        }

        /* Footer Navigation */
        .footer-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
        }

        .back-arrow {
            background-color: var(--input-bg);
            width: 80px; height: 40px;
            border-radius: 20px;
            display: flex; justify-content: center; align-items: center;
            color: white; font-size: 24px;
            text-decoration: none;
        }

        .submit-btn {
            background-color: var(--input-bg);
            color: white;
            padding: 12px 40px;
            border-radius: 30px;
            font-weight: 700;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="/home">Home</a>
            <a href="/learning">Learning</a>
        </div>
        <div class="logo">❤️ MindLink</div>
        <div class="nav-links">
            <a href="/forum">Community</a>
            <a href="/profile">Profile</a>
        </div>
    </nav>

    <div class="container">
        <div class="assessment-card">
            
            <a href="/assessment" class="close-btn">✕</a>
            <div class="progress-pill">10 Of 10</div>

            <div class="card-header">
                <h1>Expression Analysis</h1>
                <p class="subtitle">Freely write down anything that's on your mind. We are here to listen...</p>
            </div>

            <form action="/assessment/submit" method="post">
                <div class="content-row">
                    
                    <div class="illustration">
                        <img src="${pageContext.request.contextPath}/images/girl-writing.png" alt="Writing">
                    </div>

                    <div class="wrapper">
                        <div class="input-box">
                            <textarea name="analysis" maxlength="250" placeholder="Type here..." oninput="updateCount(this)">I don’t want to be alive anymore. I feel sad. Nobody believes me...</textarea>
                            <div class="char-count">
                                📄 <span id="count">75</span>/250
                            </div>
                        </div>

                        <button type="button" class="voice-btn">
                            🎤 Use voice Instead
                        </button>
                    </div>
                </div>

                <div class="footer-nav">
                    <a href="#" class="back-arrow">&larr;</a>
                    <button type="submit" class="submit-btn">Submit</button>
                </div>
            </form>

        </div>
    </div>

    <script>
        function updateCount(textarea) {
            document.getElementById('count').innerText = textarea.value.length;
        }
    </script>

</body>
</html>