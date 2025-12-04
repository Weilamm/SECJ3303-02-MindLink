<!-- question.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Introduction to Mental Health</title>
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

        .back-button {
            background: none;
            border: none;
            font-size: 32px;
            color: #2c5f5d;
            cursor: pointer;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .back-button:hover {
            transform: translateX(-5px);
        }

        /* Module Header */
        .module-header {
            background: #fff4f4;
            border-radius: 28px;
            padding: 30px 40px;
            margin-bottom: 40px;
            display: flex;
            gap: 30px;
            align-items: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .module-image {
            width: 250px;
            height: 180px;
            object-fit: cover;
            border-radius: 15px;
            flex-shrink: 0;
        }

        .module-info {
            flex: 1;
        }

        .module-title {
            font-size: 36px;
            font-weight: bold;
            color: #102d47;
            margin-bottom: 15px;
        }

        .module-description {
            font-size: 18px;
            color: #102d47;
            opacity: 0.7;
            line-height: 1.6;
        }

        /* Chapter Section */
        .chapter-section {
            margin-bottom: 40px;
        }

        .chapter-title {
            font-size: 28px;
            font-weight: bold;
            color: #102d47;
            margin-bottom: 25px;
            padding-left: 10px;
            border-left: 5px solid #4ac1c0;
        }

        .lessons-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .lesson-item {
            background: white;
            border-radius: 15px;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            border-bottom: 3px solid #e0e0e0;
        }

        .lesson-item:hover {
            transform: translateX(5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .lesson-title {
            font-size: 18px;
            color: #102d47;
            font-weight: 600;
        }

        .lesson-title .pdf-badge {
            display: inline-block;
            background: #ff6b6b;
            color: white;
            padding: 2px 8px;
            border-radius: 5px;
            font-size: 12px;
            margin-left: 10px;
        }

        .mark-done-btn {
            background: #2c5f5d;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            white-space: nowrap;
        }

        .mark-done-btn:hover {
            background: #1f4544;
            transform: scale(1.05);
        }

        .mark-done-btn.completed {
            background: #28a745;
            cursor: default;
        }

        .mark-done-btn.completed:hover {
            transform: scale(1);
        }

        .mark-done-btn.completed::before {
            content: "✓ ";
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .header-content {
                padding: 0 30px;
            }

            .main-content {
                padding: 30px 40px;
            }

            .module-header {
                flex-direction: column;
                text-align: center;
            }

            .module-image {
                width: 100%;
                max-width: 400px;
            }
        }

        @media (max-width: 768px) {
            .logo {
                font-size: 32px;
            }

            nav {
                gap: 15px;
            }

            .nav-link {
                font-size: 14px;
            }

            .module-title {
                font-size: 28px;
            }

            .chapter-title {
                font-size: 22px;
            }

            .lesson-item {
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
            }

            .mark-done-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <%
        String moduleId = request.getParameter("module");
        if (moduleId == null) moduleId = "1";
        
        String moduleTitle = "Introduction to Mental Health";
        String moduleDescription = "Learn the basics of mental health, reduce stigma, and understand how emotional well-being affects your daily life and success.";
    %>

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
            <button class="back-button" onclick="window.location.href='learning.jsp'">
                ← 
            </button>

            <!-- Module Header -->
            <div class="module-header">
                <img 
                    src="images/download.webp" 
                    alt="<%= moduleTitle %>" 
                    class="module-image"
                    onerror="this.src='https://via.placeholder.com/250x180/4ac1c0/ffffff?text=Mental+Health'"
                >
                <div class="module-info">
                    <h2 class="module-title"><%= moduleTitle %></h2>
                    <p class="module-description"><%= moduleDescription %></p>
                </div>
            </div>

            <!-- Chapter 1 -->
            <section class="chapter-section">
                <h3 class="chapter-title">Chapter 1: What is Mental Health?</h3>
                <div class="lessons-list">
                    <div class="lesson-item" data-lesson="module<%= moduleId %>_1.1">
                        <span class="lesson-title">
                            1.1 Definition and Key Concepts
                            <span class="pdf-badge">PDF</span>
                        </span>
                        <button class="mark-done-btn" onclick="markAsDone(this)">Mark as Done</button>
                    </div>
                    <div class="lesson-item" data-lesson="module<%= moduleId %>_1.2">
                        <span class="lesson-title">
                            1.2 Mental Health vs Mental Illness
                            <span class="pdf-badge">PDF</span>
                        </span>
                        <button class="mark-done-btn" onclick="markAsDone(this)">Mark as Done</button>
                    </div>
                    <div class="lesson-item" data-lesson="module<%= moduleId %>_1.3">
                        <span class="lesson-title">
                            1.3 Mental Health Spectrum
                            <span class="pdf-badge">PDF</span>
                        </span>
                        <button class="mark-done-btn" onclick="markAsDone(this)">Mark as Done</button>
                    </div>
                </div>
            </section>

            <!-- Chapter 2 -->
            <section class="chapter-section">
                <h3 class="chapter-title">Chapter 2: Mental Health Stigma</h3>
                <div class="lessons-list">
                    <div class="lesson-item" data-lesson="module<%= moduleId %>_2.1">
                        <span class="lesson-title">
                            2.1 What is Stigma?
                            <span class="pdf-badge">PDF</span>
                        </span>
                        <button class="mark-done-btn" onclick="markAsDone(this)">Mark as Done</button>
                    </div>
                    <div class="lesson-item" data-lesson="module<%= moduleId %>_2.2">
                        <span class="lesson-title">
                            2.2 Media and Cultural Misconceptions
                            <span class="pdf-badge">PDF</span>
                        </span>
                        <button class="mark-done-btn" onclick="markAsDone(this)">Mark as Done</button>
                    </div>
                    <div class="lesson-item" data-lesson="module<%= moduleId %>_2.3">
                        <span class="lesson-title">
                            2.3 How to Challenge Stigma
                            <span class="pdf-badge">PDF</span>
                        </span>
                        <button class="mark-done-btn" onclick="markAsDone(this)">Mark as Done</button>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <div class="scrollbar">
        <div class="scrollbar-thumb"></div>
    </div>

    <script>
        // Mark lesson as done
        function markAsDone(button) {
            if (!button.classList.contains('completed')) {
                button.classList.add('completed');
                button.textContent = 'Completed';
                button.disabled = true;
                
                // Save to server
                const lessonId = button.closest('.lesson-item').getAttribute('data-lesson');
                console.log('Marking lesson as done:', lessonId);
                saveProgress(lessonId);
                
                // Show success feedback
                button.style.background = '#28a745';
                button.style.cursor = 'default';
                setTimeout(() => {
                    button.style.transition = 'all 0.3s ease';
                }, 100);
            }
        }

        // Save progress to server
        function saveProgress(lessonId) {
            const formData = new URLSearchParams();
            formData.append('action', 'mark');
            formData.append('lessonId', lessonId);
            
            console.log('Saving progress with formData:', formData.toString());
            
            fetch('progressServlet', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                console.log('Save response status:', response.status);
                if (!response.ok) throw new Error('HTTP error, status = ' + response.status);
                return response.json();
            })
            .then(data => {
                console.log('Progress saved successfully:', data);
            })
            .catch(error => console.error('Error saving progress:', error));
        }

        // Load saved progress on page load
        window.addEventListener('DOMContentLoaded', function() {
            console.log('Question page loaded, fetching completed lessons...');
            
            // Debug: log all lesson items in the DOM
            const allLessonItems = document.querySelectorAll('[data-lesson]');
            console.log('Found ' + allLessonItems.length + ' lesson items in DOM:');
            allLessonItems.forEach(item => {
                console.log('  data-lesson:', item.getAttribute('data-lesson'));
            });
            
            fetch('progressServlet?action=get')
                .then(response => {
                    console.log('Load response status:', response.status);
                    if (!response.ok) throw new Error('HTTP error, status = ' + response.status);
                    return response.json();
                })
                .then(data => {
                    console.log('Loaded progress data:', data);
                    if (data.completedLessons && Array.isArray(data.completedLessons)) {
                        console.log('Processing ' + data.completedLessons.length + ' completed lessons');
                        data.completedLessons.forEach(lessonId => {
                            console.log('Looking for lesson:', lessonId);
                            
                            // Try multiple ways to find the element
                            let lessonItem = document.querySelector(`[data-lesson="${lessonId}"]`);
                            
                            if (!lessonItem) {
                                console.log('querySelector failed, trying alternative method');
                                // Alternative: iterate through all lesson items
                                const allItems = document.querySelectorAll('.lesson-item');
                                console.log('Total lesson items found:', allItems.length);
                                lessonItem = Array.from(allItems).find(item => {
                                    const lesson = item.getAttribute('data-lesson');
                                    console.log('Comparing: ' + lesson + ' === ' + lessonId + ' ?', lesson === lessonId);
                                    return lesson === lessonId;
                                });
                            }
                            
                            if (lessonItem) {
                                console.log('Found lesson item for:', lessonId);
                                const button = lessonItem.querySelector('.mark-done-btn');
                                if (button) {
                                    button.classList.add('completed');
                                    button.textContent = 'Completed';
                                    button.style.background = '#28a745';
                                    button.style.cursor = 'default';
                                    button.disabled = true;
                                    console.log('Restored completed state for lesson:', lessonId);
                                } else {
                                    console.log('Button not found for lesson:', lessonId);
                                }
                            } else {
                                console.log('Did NOT find lesson item for:', lessonId);
                            }
                        });
                    } else {
                        console.log('No completed lessons data');
                    }
                })
                .catch(error => console.error('Error loading progress:', error));
        });

        // Add click handler to lesson items to view PDF
        document.querySelectorAll('.lesson-item').forEach(item => {
            item.addEventListener('click', function(e) {
                // Don't trigger if clicking the button
                if (!e.target.classList.contains('mark-done-btn')) {
                    const lessonId = this.getAttribute('data-lesson');
                    const lessonTitle = this.querySelector('.lesson-title').textContent.trim();
                    alert(`Opening: ${lessonTitle}\n\n(In a real application, this would open the PDF document)`);
                    // In production: window.open(`pdfs/lesson-${lessonId}.pdf`, '_blank');
                }
            });
        });
    </script>
</body>
</html>