<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MindLink Analytics</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        /* --- CSS STYLES --- */
        :root {
            --bg-color: #FFF3E0; 
            --primary-blue: #2F80ED;
            --primary-green: #27AE60;
            --text-dark: #333;
            --text-grey: #666;
            --card-bg: #FFFFFF;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            padding: 0;
            color: var(--text-dark);
        }

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

        /* Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h2 { margin-bottom: 10px; }
        .subtitle { color: var(--text-grey); margin-bottom: 30px; font-size: 14px; }

        /* Key Metrics Grid */
        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: var(--card-bg);
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: relative;
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 10px;
        }
        
        .card-title { font-size: 14px; font-weight: 600; color: #333; }
        .card-icon { color: var(--text-grey); font-size: 18px; }

        .big-number {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .trend-tag {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
        }
        .trend-positive { background-color: #E6F4EA; color: var(--primary-green); }
        .sub-text { font-size: 12px; color: var(--text-grey); margin-top: 5px; }

        /* Progress Bar used in Card 2 */
        .mini-progress {
            height: 6px;
            background: #eee;
            border-radius: 3px;
            margin-top: 10px;
            width: 100%;
        }
        .mini-progress-bar {
            height: 100%;
            background: var(--primary-blue);
            border-radius: 3px;
        }

        /* Section: Module Performance */
        .performance-section {
            background: var(--card-bg);
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 30px;
        }

        .module-item { margin-bottom: 20px; }
        .module-info {
            display: flex;
            justify-content: space-between;
            font-size: 13px;
            margin-bottom: 5px;
        }
        .progress-track {
            background: #F0F0F0;
            height: 8px;
            border-radius: 4px;
            width: 100%;
        }
        .progress-fill {
            height: 100%;
            background: var(--primary-blue);
            border-radius: 4px;
        }

        /* Charts Layout */
        .chart-row {
            display: grid;
            grid-template-columns: 1fr;
            gap: 30px;
            margin-bottom: 30px;
        }

        .chart-card {
            background: var(--card-bg);
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        /* Utility */
        .green-text { color: var(--primary-green); }
        .purple-text { color: #9B51E0; }
        
    </style>
</head>
<body>
<!-- Header Navigation -->
    <div class="header">
        <div class="nav-left">
            <a href="${pageContext.request.contextPath}/admin/home">Home</a>
            <a href="${pageContext.request.contextPath}/admin/modules">Module</a>
            <a href="${pageContext.request.contextPath}/admin/tips">Tips</a>
        </div>
        
        <a href="${pageContext.request.contextPath}/admin/home" class="logo">
            <div class="logo-icon">
                <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
            </div>
            <span>MindLink</span>
        </a>
        
        <div class="nav-right">
            <a href="${pageContext.request.contextPath}/admin/chatbot">Chatbot</a>
            <a href="${pageContext.request.contextPath}/admin/forum/manage">Forum</a>
            <a href="${pageContext.request.contextPath}/admin/profile">Profile</a>
        </div>
    </div>

    <div class="container">
        
        <h2>Key Metrics</h2>
        <p class="subtitle">Overview of platform performance and user engagement</p>

        <div class="metrics-grid">
            <div class="card">
                <div class="card-header">
                    <span class="card-title">Active Users</span>
                    <span class="card-icon">👥</span>
                </div>
                <div class="big-number">${stats.activeUsers}</div>
                <div class="sub-text">78.9% of total users</div>
                <div style="margin-top:5px;">
                    <span class="trend-tag trend-positive">+12.3% this week</span>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span class="card-title">Avg. Completion Rate</span>
                    <span class="card-icon">⏱️</span>
                </div>
                <div class="big-number">${stats.avgCompletionRate}%</div>
                <div class="sub-text">Across all 12 modules</div>
                <div class="mini-progress">
                    <div class="mini-progress-bar" style="width: ${stats.avgCompletionRate}%;"></div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span class="card-title">Module Completions</span>
                    <span class="card-icon">📖</span>
                </div>
                <div class="big-number">${stats.totalCompletions}</div>
                <div class="sub-text">Total modules completed</div>
            </div>

            <a href="/admin/feedback" style="text-decoration: none; color: inherit;">
                <div class="card" style="cursor: pointer; transition: transform 0.2s;">
                    <div class="card-header">
                        <span class="card-title">Feedback Received</span>
                        <span class="card-icon">💬</span>
                    </div>
                    <div class="big-number">${stats.feedbackReceived}</div>
                    <div class="sub-text">Pending review</div>
                    <div style="margin-top:5px; color: #2F80ED; font-size: 12px; font-weight: 600;">
                        View All &rarr;
                    </div>
                </div>
            </a>
        </div>

        <div class="performance-section">
            <h2>Module Performance</h2>
            <p class="subtitle">Completion rates by module category</p>

            <div class="module-item">
                <div class="module-info">
                    <span>Stress Management</span>
                    <span>892 enrolled <span class="green-text">78%</span></span>
                </div>
                <div class="progress-track"><div class="progress-fill" style="width: 78%;"></div></div>
            </div>

            <div class="module-item">
                <div class="module-info">
                    <span>Anxiety Support</span>
                    <span>756 enrolled <span class="green-text">72%</span></span>
                </div>
                <div class="progress-track"><div class="progress-fill" style="width: 72%;"></div></div>
            </div>

            <div class="module-item">
                <div class="module-info">
                    <span>Mindfulness & Meditation</span>
                    <span>923 enrolled <span class="green-text">81%</span></span>
                </div>
                <div class="progress-track"><div class="progress-fill" style="width: 81%;"></div></div>
            </div>
        </div>

        <div class="chart-card" style="margin-bottom: 30px;">
            <h2>Weekly Activity Overview</h2>
            <p class="subtitle">User engagement and module completions for the past week</p>
            <canvas id="weeklyActivityChart" height="100"></canvas>
        </div>

        <div class="chart-card">
            <h2>Monthly Trends</h2>
            <p class="subtitle">Growth and engagement trends over the past 7 months</p>
            <canvas id="monthlyTrendsChart" height="100"></canvas>
        </div>

    </div>

    <script>
        // Chart 1: Weekly Activity (Line Chart)
        const ctxWeekly = document.getElementById('weeklyActivityChart').getContext('2d');
        new Chart(ctxWeekly, {
            type: 'line',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [
                    {
                        label: 'Active Users',
                        data: [900, 1050, 1200, 1150, 950, 780, 850],
                        borderColor: '#2F80ED',
                        backgroundColor: 'rgba(47, 128, 237, 0.1)',
                        tension: 0.4,
                        fill: false
                    },
                    {
                        label: 'Completions',
                        data: [250, 300, 290, 300, 270, 220, 240],
                        borderColor: '#27AE60',
                        tension: 0.4,
                        fill: false
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: { legend: { position: 'bottom' } },
                scales: {
                    y: { beginAtZero: true, max: 1300 }
                }
            }
        });

        // Chart 2: Monthly Trends (Bar Chart)
        const ctxMonthly = document.getElementById('monthlyTrendsChart').getContext('2d');
        new Chart(ctxMonthly, {
            type: 'bar',
            data: {
                labels: ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov'],
                datasets: [
                    {
                        label: 'Active Users',
                        data: [850, 900, 1100, 1200, 1300, 1450, 1250],
                        backgroundColor: '#2F80ED'
                    },
                    {
                        label: 'Total Completions',
                        data: [1800, 2100, 2400, 2800, 3000, 3300, 2900],
                        backgroundColor: '#27AE60'
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: { legend: { position: 'bottom' } },
                scales: { y: { beginAtZero: true } }
            }
        });
    </script>

</body>
</html>