<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Admin Portal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', 'DM Sans', Tahoma, Geneva, Verdana, sans-serif;
            /* Left and right decorative backgrounds centered to align with page content */
            background-image: url('../images/background-left.png'), url('../images/background-right.png'), linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            background-position: center left, center right, center;
            background-repeat: no-repeat, no-repeat, no-repeat;
            background-size: auto, 40%, cover;
            min-height: 100vh;
            overflow-x: hidden;
            margin: 0;
            padding-top: 91px;
        }

        .container {
            max-width: 1400px;
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

        .admin-badge {
            display: inline-block;
            background: #764ba2;
            color: white;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 10px;
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

        .nav-link.active {
            color: #4ac1c0;
            font-weight: 600;
        }

        /* Main Content */
        .main-content {
            min-height: calc(100vh - 91px);
            padding: 40px 63px;
            position: relative;
        }

        /* Welcome Section */
        .welcome-section {
            background: white;
            border-radius: 28px;
            padding: 40px 50px;
            margin-bottom: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .welcome-text h1 {
            font-size: 42px;
            font-weight: bold;
            color: #102d47;
            margin-bottom: 10px;
        }

        .welcome-text p {
            font-size: 18px;
            color: #666;
        }

        .welcome-illustration {
            width: 200px;
            height: 200px;
            object-fit: contain;
        }

        /* Resource Cards Grid */
        .resources-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }

        .resource-card {
            background: white;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .resource-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
        }

        .resource-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .resource-card.module::before {
            background: linear-gradient(90deg, #4ac1c0 0%, #2c5f5d 100%);
        }

        .resource-card.assessment::before {
            background: linear-gradient(90deg, #f093fb 0%, #f5576c 100%);
        }

        .resource-card.forum::before {
            background: linear-gradient(90deg, #fa709a 0%, #fee140 100%);
        }

        .resource-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .resource-card.module .resource-icon {
            background: linear-gradient(135deg, #4ac1c0 0%, #2c5f5d 100%);
        }

        .resource-card.assessment .resource-icon {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        .resource-card.forum .resource-icon {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
        }

        .resource-title {
            font-size: 24px;
            font-weight: bold;
            color: #102d47;
            margin-bottom: 15px;
        }

        .resource-description {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 25px;
            min-height: 60px;
        }

        .resource-button {
            width: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 14px 20px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .resource-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .resource-card.module .resource-button {
            background: linear-gradient(135deg, #4ac1c0 0%, #2c5f5d 100%);
        }

        .resource-card.module .resource-button:hover {
            box-shadow: 0 4px 15px rgba(74, 193, 192, 0.4);
        }

        .resource-card.assessment .resource-button {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        .resource-card.assessment .resource-button:hover {
            box-shadow: 0 4px 15px rgba(240, 147, 251, 0.4);
        }

        .resource-card.forum .resource-button {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
        }

        .resource-card.forum .resource-button:hover {
            box-shadow: 0 4px 15px rgba(250, 112, 154, 0.4);
        }

        /* Stats Section */
        .stats-section {
            background: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .stats-title {
            font-size: 24px;
            font-weight: bold;
            color: #102d47;
            margin-bottom: 25px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .stat-item {
            padding: 20px;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 15px;
            text-align: center;
        }

        .stat-number {
            font-size: 36px;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 14px;
            color: #666;
            font-weight: 500;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .header-content {
                padding: 0 30px;
            }

            .main-content {
                padding: 30px 40px;
            }

            .resources-grid {
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
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

            .welcome-section {
                flex-direction: column;
                text-align: center;
                padding: 30px 25px;
            }

            .welcome-text h1 {
                font-size: 32px;
            }

            .welcome-illustration {
                margin-top: 20px;
            }

            .resources-grid {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <%
        // Get admin username from session
        String adminUsername = (session.getAttribute("username") != null) 
            ? (String) session.getAttribute("username") 
            : "Admin123";
    %>

    <div class="container">
        <header>
            <div class="header-content">
                <h1 class="logo">
                    <img src="/images/mindlink.png" alt="Mindlink logo" class="logo-icon">
                    <span class="logo-text">Mindlink</span>
                    <span class="admin-badge">ADMIN</span>
                </h1>
                <nav>
                    <a href="adminportal.jsp" class="nav-link active">Home</a>
                    <a href="adminmodule.jsp" class="nav-link">Module</a>
                    <a href="adminforum.jsp" class="nav-link">Forum</a>
                    <a href="adminprofile.jsp" class="nav-link">Profile</a>
                    <a href="admincontact.jsp" class="nav-link">Contact</a>
                </nav>
            </div>
        </header>

        <main class="main-content">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <div class="welcome-text">
                    <h1>Welcome back, <%= adminUsername %>! 👋</h1>
                    <p>Manage your mental health platform efficiently</p>
                </div>
                <img 
                    src="images/admin-illustration.png" 
                    alt="Admin Dashboard" 
                    class="welcome-illustration"
                    onerror="this.style.display='none'"
                >
            </div>

            <!-- Quick Stats -->
            <div class="stats-section">
                <h2 class="stats-title">Platform Overview</h2>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-number">248</div>
                        <div class="stat-label">Total Students</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">12</div>
                        <div class="stat-label">Active Modules</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">45</div>
                        <div class="stat-label">Forum Posts</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">3</div>
                        <div class="stat-label">Pending Reports</div>
                    </div>
                </div>
            </div>

            <!-- Resource Cards -->
            <div class="resources-grid">
                <!-- Learning Module Card -->
                <div class="resource-card module">
                    <div class="resource-icon">📚</div>
                    <h3 class="resource-title">Learning Module</h3>
                    <p class="resource-description">
                        Practical tips on stress management, mindfulness, and emotional resilience.
                    </p>
                    <button class="resource-button" onclick="window.location.href='adminmodule.jsp'">
                        Update Modules
                    </button>
                </div>

                <!-- Self Assessment Card -->
                <div class="resource-card assessment">
                    <div class="resource-icon">✏️</div>
                    <h3 class="resource-title">Self Assessment</h3>
                    <p class="resource-description">
                        Set up self assessment questions for students to know more about mental health.
                    </p>
                    <button class="resource-button" onclick="window.location.href='adminassessment.jsp'">
                        Update Assessment
                    </button>
                </div>

                <!-- Forum Report Card -->
                <div class="resource-card forum">
                    <div class="resource-icon">🚩</div>
                    <h3 class="resource-title">Forum Report</h3>
                    <p class="resource-description">
                        Review reported posts, mark them as handled, or delete them if necessary.
                    </p>
                    <button class="resource-button" onclick="window.location.href='adminforum.jsp'">
                        Review Reports
                    </button>
                </div>
            </div>
        </main>
    </div>

    <script>
        // Load platform statistics
        function loadStats() {
            fetch('adminServlet?action=getStats')
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Update stat numbers with actual data
                        const stats = document.querySelectorAll('.stat-number');
                        if (data.totalStudents) stats[0].textContent = data.totalStudents;
                        if (data.totalModules) stats[1].textContent = data.totalModules;
                        if (data.totalPosts) stats[2].textContent = data.totalPosts;
                        if (data.pendingReports) stats[3].textContent = data.pendingReports;
                    }
                })
                .catch(error => {
                    console.log('Using default stats:', error);
                });
        }

        // Load stats on page load
        window.addEventListener('DOMContentLoaded', loadStats);

        // Add animation to cards on scroll
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        // Observe all resource cards
        document.querySelectorAll('.resource-card').forEach(card => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            card.style.transition = 'all 0.6s ease';
            observer.observe(card);
        });
    </script>
</body>
</html>