<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Introduction to Mental Health</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFF0E5; /* Light pinkish beige for chapter cards */
            --btn-default: #F6D776; /* Beige/Yellow for "Mark as Done" */
            --btn-done: #B5F0AD;    /* Green for "DONE" */
            --bar-bg: #E0E0E0;
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

        .container { max-width: 1000px; margin: 0 auto; padding-bottom: 60px; }

        /* HEADER SECTION */
        .header-section {
            display: flex; gap: 40px; align-items: center; margin-bottom: 40px;
        }
        
        .header-img {
            width: 350px; height: 220px; object-fit: cover; border-radius: 20px;
            background-color: #ddd;
        }

        .header-content { flex: 1; }
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 10px; }
        .desc { font-size: 16px; color: #555; line-height: 1.6; margin-bottom: 20px; }

        /* Progress Bar */
        .progress-row { display: flex; align-items: center; gap: 15px; font-weight: 700; }
        .progress-track {
            flex: 1; height: 20px; background-color: #E6D5CC; 
            border-radius: 10px; overflow: hidden;
        }
        .progress-fill {
            height: 100%; width: 0%; 
            background-color: #003049; /* Dark Navy Fill */
            border-radius: 10px; transition: width 0.5s ease;
        }

        /* CHAPTER CARDS */
        .chapter-card {
            background-color: var(--card-bg);
            border-radius: 30px;
            padding: 30px 40px;
            margin-bottom: 30px;
        }

        .chapter-title { font-size: 24px; font-weight: 800; margin-bottom: 25px; }

        /* Lesson Item */
        .lesson-row {
            display: flex; justify-content: space-between; align-items: center;
            padding: 15px 0; border-bottom: 2px solid rgba(0,0,0,0.05);
        }
        .lesson-row:last-child { border-bottom: none; }

        .lesson-info { display: flex; align-items: center; gap: 15px; }
        .pdf-icon { font-size: 24px; } /* Using text emoji for simplicity or replace with img */
        .lesson-name { font-size: 18px; font-weight: 600; color: #666; }

        /* THE BUTTON */
        .btn-status {
            padding: 10px 25px;
            border-radius: 20px;
            border: none;
            font-weight: 700; font-size: 14px;
            cursor: pointer;
            width: 140px; text-align: center;
            transition: 0.3s;
        }

        /* State: Pending */
        .btn-status.pending {
            background-color: var(--btn-default);
            color: #8B5E3C;
        }
        .btn-status.pending:hover { opacity: 0.9; }

        /* State: Done */
        .btn-status.done {
            background-color: var(--btn-done);
            color: #388E3C;
            cursor: default;
        }

        .back-arrow { font-size: 30px; text-decoration: none; color: #000; display: inline-block; margin-bottom: 20px; }

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
        
        <a href="/learning/modules" class="back-arrow">↩</a>

        <div class="header-section">
            <img src="${pageContext.request.contextPath}/images/mental-health-intro.png" class="header-img">
            <div class="header-content">
                <h1>Introduction to Mental Health</h1>
                <p class="desc">Learn the basics of mental health, reduce stigma, and understand how emotional well-being affects your daily life and success.</p>
                
                <div class="progress-row">
                    <span>Progress :</span>
                    <div class="progress-track">
                        <div class="progress-fill" id="mainProgressBar"></div>
                    </div>
                    <span id="progressText" style="font-size: 12px; color: #666;">0% Completed</span>
                </div>
            </div>
        </div>

        <div class="chapter-card">
            <div class="chapter-title">Chapter 1 : What is Mental Health?</div>
            
            <div class="lesson-row">
                <div class="lesson-info">
                    <span class="pdf-icon">📄</span>
                    <span class="lesson-name">1.1 Definition and Key Concepts PDF</span>
                </div>
                <button class="btn-status pending" onclick="markAsDone(this)">Mark as Done</button>
            </div>

            <div class="lesson-row">
                <div class="lesson-info">
                    <span class="pdf-icon">📄</span>
                    <span class="lesson-name">1.2 Mental Health vs Mental Illness PDF</span>
                </div>
                <button class="btn-status pending" onclick="markAsDone(this)">Mark as Done</button>
            </div>

            <div class="lesson-row">
                <div class="lesson-info">
                    <span class="pdf-icon">📄</span>
                    <span class="lesson-name">1.3 Mental Health Spectrum PDF</span>
                </div>
                <button class="btn-status pending" onclick="markAsDone(this)">Mark as Done</button>
            </div>
        </div>

        <div class="chapter-card">
            <div class="chapter-title">Chapter 2 : Mental Health Stigma</div>
            
            <div class="lesson-row">
                <div class="lesson-info">
                    <span class="pdf-icon">📄</span>
                    <span class="lesson-name">2.1 What is Stigma? PDF</span>
                </div>
                <button class="btn-status pending" onclick="markAsDone(this)">Mark as Done</button>
            </div>

            <div class="lesson-row">
                <div class="lesson-info">
                    <span class="pdf-icon">📄</span>
                    <span class="lesson-name">2.2 Media and Cultural Misconceptions PDF</span>
                </div>
                <button class="btn-status pending" onclick="markAsDone(this)">Mark as Done</button>
            </div>
        </div>

    </div>

    <script>
        // 1. Run this when page loads to restore previous clicks
        window.onload = function() {
            loadProgress();
        };

        function markAsDone(btn) {
            // Change Visuals
            if (btn.classList.contains('pending')) {
                btn.classList.remove('pending');
                btn.classList.add('done');
                btn.innerText = "DONE";
            }
            // Recalculate and Save
            updateProgressBar();
        }

        function updateProgressBar() {
            const allButtons = document.querySelectorAll('.btn-status');
            const doneButtons = document.querySelectorAll('.btn-status.done');

            const total = allButtons.length;
            const completed = doneButtons.length;
            const percentage = Math.round((completed / total) * 100);

            // Update UI on this page
            document.getElementById('mainProgressBar').style.width = percentage + "%";
            document.getElementById('progressText').innerText = percentage + "% Completed";

            // --- THE NEW PART: SAVE TO MEMORY ---
            // We save the percentage AND the number of buttons clicked
            localStorage.setItem('intro_progress_percent', percentage);
            localStorage.setItem('intro_buttons_clicked', completed);
        }

        function loadProgress() {
            // Check if we have saved data
            const clickedCount = localStorage.getItem('intro_buttons_clicked') || 0;
            const allButtons = document.querySelectorAll('.btn-status');

            // Loop through buttons and mark them as DONE based on saved count
            for (let i = 0; i < clickedCount; i++) {
                if (allButtons[i]) {
                    allButtons[i].classList.remove('pending');
                    allButtons[i].classList.add('done');
                    allButtons[i].innerText = "DONE";
                }
            }
            // Update bar visual
            updateProgressBar();
        }
    </script>

</body>
</html>