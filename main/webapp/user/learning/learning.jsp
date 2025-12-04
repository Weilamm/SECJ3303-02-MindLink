<!-- learning.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Learning</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', 'DM Sans', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            min-height: 100vh;
            overflow-x: hidden;
            margin: 0;
            padding-top: 91px;
        }

        .container {
            max-width: 1254px;
            margin: 0 auto;
            position: relative;
        }

        /* Header Styles */
        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 91px;
            background: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            z-index: 100;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 50px;
            height: 100%;
        }

        .logo {
            font-size: 50px;
            font-weight: bold;
            color: #2c5f5d;
            letter-spacing: 0.5px;
            display: inline-flex;
            align-items: center;
            gap: 12px;
        }

        .logo-icon {
            width: 56px;
            height: 56px;
            object-fit: contain;
            display: inline-block;
            vertical-align: middle;
        }

        nav {
            display: flex;
            gap: 40px;
            align-items: center;
        }

        .nav-link {
            color: #2c5f5d;
            text-decoration: none;
            font-size: 18px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #4ac1c0;
        }

        /* Main Content */
        .main-content {
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            min-height: calc(100vh - 91px);
            padding: 40px 63px;
            position: relative;
        }

        /* Learning Module Card */
        .learning-module {
            background: #fff4f4;
            border-radius: 28px;
            padding: 24px 38px;
            margin-bottom: 30px;
            display: flex;
            gap: 30px;
            min-height: 259px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .learning-module:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .module-image {
            width: 359px;
            height: 210px;
            object-fit: cover;
            border-radius: 15px;
            flex-shrink: 0;
        }

        .module-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 10px 0;
        }

        .module-title {
            font-size: 32px;
            font-weight: bold;
            color: #102d47;
            text-align: center;
            margin-bottom: 15px;
            letter-spacing: -0.96px;
        }

        .module-description {
            font-size: 20px;
            color: #102d47;
            opacity: 0.6;
            text-align: center;
            line-height: 1.6;
            margin-bottom: 25px;
            letter-spacing: -0.6px;
        }

        .progress-section {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: auto;
        }

        .progress-label {
            font-size: 20px;
            font-weight: bold;
            color: #102d47;
            white-space: nowrap;
        }

        .progress-text {
            font-size: 13px;
            color: #102d47;
            opacity: 0.6;
            white-space: nowrap;
        }

        .progress-bar-container {
            flex: 1;
            height: 24px;
            background: rgba(203, 201, 201, 0.38);
            border-radius: 35px;
            box-shadow: inset 0px 4px 4px rgba(0, 0, 0, 0.25);
            position: relative;
            overflow: hidden;
        }

        .progress-bar-fill {
            height: 100%;
            background: linear-gradient(90deg, #4ac1c0 0%, #2c5f5d 100%);
            border-radius: 35px;
            transition: width 0.3s ease;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .header-content {
                padding: 0 30px;
            }

            .main-content {
                padding: 30px 40px;
            }

            .learning-module {
                flex-direction: column;
                align-items: center;
            }

            .module-image {
                width: 100%;
                max-width: 400px;
            }

            .module-content {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .logo {
                font-size: 32px;
            }

            nav {
                gap: 20px;
            }

            .nav-link {
                font-size: 14px;
            }

            .module-title {
                font-size: 24px;
            }

            .module-description {
                font-size: 16px;
            }

            .progress-section {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            .progress-bar-container {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="header-content">
                <h1 class="logo">
                    <img src="images/mindlink.png" alt="Mindlink logo" class="logo-icon">
                    <span class="logo-text">Mindlink</span>
                </h1>
                <nav>
                    <a href="home.jsp" class="nav-link">Home</a>
                    <a href="counseling.jsp" class="nav-link">Counseling</a>
                    <a href="learning.jsp" class="nav-link">Learning</a>
                    <a href="forum.jsp" class="nav-link">Forum</a>
                    <a href="profile.jsp" class="nav-link">Profile</a>
                    <a href="contact.jsp" class="nav-link">Contact</a>
                </nav>
            </div>
        </header>

        <main class="main-content">
            <!-- Module 1: Introduction to Mental Health -->
            <article class="learning-module">
                <img 
                    src="images/download.webp" 
                    alt="Introduction to Mental Health" 
                    class="module-image"
                    onerror="this.src='https://via.placeholder.com/359x210/4ac1c0/ffffff?text=Mental+Health+Intro'"
                >
                <div class="module-content">
                    <h2 class="module-title"><a href="question.jsp">Introduction to Mental Health</a></h2>
                    <p class="module-description">
                        Learn the basics of mental health, reduce stigma, and understand how emotional well-being affects your daily life and success.
                    </p>
                    <div class="progress-section">
                        <span class="progress-label">Progress:</span>
                        <span class="progress-text">0% Completed</span>
                        <div class="progress-bar-container" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar-fill" style="width: 0%;"></div>
                        </div>
                    </div>
                </div>
            </article>

            <!-- Module 2: Emotional Awareness and Regulation -->
            <article class="learning-module">
                <img 
                    src="images/Screenshot 2025-12-04 014256.png" 
                    alt="Emotional Awareness and Regulation" 
                    class="module-image"
                    onerror="this.src='https://via.placeholder.com/359x210/2c5f5d/ffffff?text=Emotional+Awareness'"
                >
                <div class="module-content">
                    <h2 class="module-title"><a href="question2.jsp">Emotional Awareness and Regulation</a></h2>
                    <p class="module-description">
                        Recognize your emotions, understand their causes, and develop healthy strategies to manage them effectively in daily and social situations.
                    </p>
                    <div class="progress-section">
                        <span class="progress-label">Progress:</span>
                        <span class="progress-text">0% Completed</span>
                        <div class="progress-bar-container" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar-fill" style="width: 0%;"></div>
                        </div>
                    </div>
                </div>
            </article>

            <!-- Module 3: Stress Management Techniques -->
            <article class="learning-module">
                <img 
                    src="images/stress-management.jpg" 
                    alt="Stress Management Techniques" 
                    class="module-image"
                    onerror="this.src='https://via.placeholder.com/359x210/ff9a56/ffffff?text=Stress+Management'"
                >
                <div class="module-content">
                    <h2 class="module-title">Stress Management Techniques</h2>
                    <p class="module-description">
                        Discover practical tools and techniques to reduce stress, improve focus, and maintain balance in your academic and personal life.
                    </p>
                    <div class="progress-section">
                        <span class="progress-label">Progress:</span>
                        <span class="progress-text">0% Completed</span>
                        <div class="progress-bar-container" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar-fill" style="width: 0%;"></div>
                        </div>
                    </div>
                </div>
            </article>

            <!-- Module 4: Building Resilience -->
            <article class="learning-module">
                <img 
                    src="images/building-resilience.jpg" 
                    alt="Building Resilience" 
                    class="module-image"
                    onerror="this.src='https://via.placeholder.com/359x210/feca57/ffffff?text=Building+Resilience'"
                >
                <div class="module-content">
                    <h2 class="module-title">Building Resilience</h2>
                    <p class="module-description">
                        Learn how to bounce back from setbacks, develop a growth mindset, and cultivate inner strength to face life's challenges.
                    </p>
                    <div class="progress-section">
                        <span class="progress-label">Progress:</span>
                        <span class="progress-text">0% Completed</span>
                        <div class="progress-bar-container" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar-fill" style="width: 0%;"></div>
                        </div>
                    </div>
                </div>
            </article>
        </main>
    </div>

    <div class="scrollbar">
        <div class="scrollbar-thumb"></div>
    </div>

    <script>
        // Module lesson counts (total lessons per module)
        const moduleLessonCounts = {
            1: 4, // Module 1: Introduction to Mental Health - 4 lessons
            2: 4, // Module 2: Emotional Awareness - 4 lessons
            3: 4, // Module 3: Stress Management - 4 lessons
            4: 4  // Module 4: Building Resilience - 4 lessons
        };

        // When a learning module is clicked, navigate to question.jsp
        // pass the module index as a query parameter (module=1..n)
        document.querySelectorAll('.learning-module').forEach((module, index) => {
            module.setAttribute('role', 'link');
            module.setAttribute('tabindex', '0');
            module.addEventListener('click', function() {
                // navigate to question.jsp with module index (1-based)
                const moduleIndex = index + 1;
                window.location.href = 'question.jsp?module=' + encodeURIComponent(moduleIndex);
            });

            // allow Enter key to activate
            module.addEventListener('keydown', function(e) {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    const moduleIndex = index + 1;
                    window.location.href = 'question.jsp?module=' + encodeURIComponent(moduleIndex);
                }
            });
        });

        // Update progress bars on page load
        window.addEventListener('DOMContentLoaded', function() {
            console.log('Learning page loaded, fetching progress...');
            updateProgressBars();
        });

        // Function to update all progress bars based on completed lessons
        function updateProgressBars() {
            fetch('progressServlet?action=get')
                .then(response => {
                    if (!response.ok) throw new Error('HTTP error, status = ' + response.status);
                    return response.json();
                })
                .then(data => {
                    console.log('Loaded progress data:', data);
                    const completedLessons = data.completedLessons || [];
                    
                    document.querySelectorAll('.learning-module').forEach((module, moduleIndex) => {
                        const moduleNum = moduleIndex + 1;
                        const totalLessons = moduleLessonCounts[moduleNum] || 4;
                        
                        // Count completed lessons for this module
                        const completedInModule = completedLessons.filter(lessonId => 
                            lessonId.toString().startsWith('module' + moduleNum + '_')
                        ).length;
                        
                        const progressPercent = Math.round((completedInModule / totalLessons) * 100);
                        
                        // Update progress bar
                        const progressFill = module.querySelector('.progress-bar-fill');
                        const progressText = module.querySelector('.progress-text');
                        const progressBar = module.querySelector('.progress-bar-container');
                        
                        if (progressFill && progressText && progressBar) {
                            progressFill.style.width = progressPercent + '%';
                            progressText.textContent = progressPercent + '% Completed';
                            progressBar.setAttribute('aria-valuenow', progressPercent);
                        }
                    });
                })
                .catch(error => console.error('Error loading progress:', error));
        }

        // Listen for storage changes (when another tab/window marks lesson as done)
        // Refresh progress every 2 seconds to keep in sync
        setInterval(updateProgressBars, 2000);
    </script>
</body>
</html>