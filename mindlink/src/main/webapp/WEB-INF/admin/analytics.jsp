<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Analytics | MindLink Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        :root {
            --bg-color: #FFF3E0; /* 🟢 MATCHED: Admin Beige */
            --text-dark: #003049;
            --card-bg: #FFFFFF;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 40px; /* Added padding to body for cleaner look without header */
            color: var(--text-dark);
        }

        .container { max-width: 1100px; margin: 0 auto; }

        .btn-back {
            display: inline-flex; align-items: center; gap: 10px;
            text-decoration: none; color: #666; font-weight: 600; font-size: 16px;
            margin-bottom: 20px; transition: 0.2s;
        }
        .btn-back:hover { color: var(--text-dark); transform: translateX(-5px); }

        h2 { font-size: 32px; font-weight: 800; margin: 0 0 5px 0; color: var(--text-dark); }
        .subtitle { color: #666; margin-bottom: 40px; font-size: 16px; }

        /* --- METRIC CARDS --- */
        .metrics-grid {
            display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px; margin-bottom: 40px;
        }

        .card {
            background: var(--card-bg); padding: 30px; border-radius: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05); text-align: center;
            transition: transform 0.2s; display: flex; flex-direction: column; justify-content: center; align-items: center;
        }
        .card:hover { transform: translateY(-5px); }

        .metric-icon { font-size: 28px; margin-bottom: 15px; color: var(--text-dark); opacity: 0.8; }
        .metric-val { font-size: 36px; font-weight: 800; color: var(--text-dark); margin-bottom: 5px; }
        .metric-label { font-size: 14px; font-weight: 600; color: #888; text-transform: uppercase; }

        /* PENDING CARD (Highlighted) */
        .card-pending {
            background: #FF6B6B; color: white; cursor: pointer;
            box-shadow: 0 8px 25px rgba(255, 107, 107, 0.4); text-decoration: none;
        }
        .card-pending .metric-icon, .card-pending .metric-val, .card-pending .metric-label { color: white; opacity: 1; }
        .card-pending:hover { background: #fa5252; transform: scale(1.05); }

        /* --- CHARTS --- */
        .charts-container { display: grid; grid-template-columns: 2fr 1fr; gap: 30px; }
        .chart-box { background: white; padding: 30px; border-radius: 20px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .chart-title { font-size: 18px; font-weight: 700; margin-bottom: 20px; color: var(--text-dark); }

    </style>
</head>
<body>

    <div class="container">
        
        <a href="${pageContext.request.contextPath}/admin/home" class="btn-back">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>

        <h2>Analytics Dashboard</h2>
        <div class="subtitle">Platform performance based on real-time data.</div>

        <div class="metrics-grid">
            <div class="card">
                <i class="fas fa-users metric-icon"></i>
                <div class="metric-val">${stats.totalUsers}</div>
                <div class="metric-label">Total Students</div>
            </div>
            <div class="card">
                <i class="fas fa-calendar-check metric-icon"></i>
                <div class="metric-val">${stats.totalAppointments}</div>
                <div class="metric-label">Total Sessions</div>
            </div>
            <div class="card">
                <i class="fas fa-comments metric-icon"></i>
                <div class="metric-val">${stats.totalPosts}</div>
                <div class="metric-label">Forum Posts</div>
            </div>
            <a href="${pageContext.request.contextPath}/admin/feedback" class="card card-pending">
                <i class="fas fa-bell metric-icon"></i>
                <div class="metric-val">${stats.pendingFeedback}</div>
                <div class="metric-label">Pending Reviews</div>
                <div style="margin-top: 10px; font-size: 13px; background: rgba(0,0,0,0.2); padding: 5px 15px; border-radius: 20px;">
                    Click to Review &rarr;
                </div>
            </a>
        </div>

        <div class="charts-container">
            <div class="chart-box">
                <div class="chart-title">Appointments (Last 7 Days)</div>
                <canvas id="activityChart" height="150"></canvas>
            </div>
            <div class="chart-box">
                <div class="chart-title">Feedback Ratings</div>
                <canvas id="ratingChart" height="200"></canvas>
            </div>
        </div>

    </div>

    <script>
        const rawLabels = '${stats.chartLabels}'; 
        const rawData = '${stats.dailyAppointments}';
        const rawRatings = '${stats.ratingCounts}';

        const chartLabels = rawLabels ? JSON.parse(rawLabels) : [];
        const chartData = rawData ? JSON.parse(rawData) : [];
        const ratingData = rawRatings ? JSON.parse(rawRatings) : [0,0,0,0,0];

        const ctxActivity = document.getElementById('activityChart').getContext('2d');
        new Chart(ctxActivity, {
            type: 'line',
            data: {
                labels: chartLabels,
                datasets: [{
                    label: 'Appointments',
                    data: chartData,
                    borderColor: '#003049',
                    backgroundColor: 'rgba(0, 48, 73, 0.1)',
                    tension: 0.4, fill: true, pointBackgroundColor: '#F497AA', pointRadius: 4
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: false } },
                scales: { y: { beginAtZero: true, ticks: { stepSize: 1 } } }
            }
        });

        const ctxRating = document.getElementById('ratingChart').getContext('2d');
        new Chart(ctxRating, {
            type: 'doughnut',
            data: {
                labels: ['1 Star', '2 Stars', '3 Stars', '4 Stars', '5 Stars'],
                datasets: [{
                    data: ratingData,
                    backgroundColor: ['#FF6B6B', '#FF9F43', '#FECA57', '#48C9B0', '#1DD1A1'],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { position: 'bottom', labels: { boxWidth: 12 } } }
            }
        });
    </script>

</body>
</html>