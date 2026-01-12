<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Portal - MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-yellow: #F2C94C;
            --btn-teal: #48C9B0;
            --btn-pink: #F497AA;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 0;
            color: var(--text-dark);
            overflow-x: hidden;
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

        /* Main Container */
        .container {
            max-width: 1400px; /* Increased width to give cards breathing room */
            margin: 60px auto;
            text-align: center;
            position: relative;
            z-index: 10;
            padding: 0 40px;
        }

        h1 {
            font-size: 48px;
            font-weight: 800;
            margin-bottom: 60px;
            color: var(--text-dark);
        }

        /* --- UPDATED GRID LAYOUT --- */
        .cards-grid {
            display: grid;
            /* Force exactly 3 columns of equal width */
            grid-template-columns: repeat(3, 1fr);
            gap: 40px; /* Space between cards */
            width: 100%;
        }

        .admin-card {
            background: var(--card-bg);
            border-radius: 40px;
            padding: 50px 30px;
            /* Remove fixed width so it fills the grid column */
            width: auto; 
            min-height: 400px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            transition: transform 0.2s;
        }

        .admin-card:hover { transform: translateY(-5px); }

        .card-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--text-dark);
        }

        .card-desc {
            font-size: 15px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        /* Buttons */
        .btn {
            padding: 12px 50px;
            border-radius: 30px;
            border: none;
            color: white;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn-yellow { background-color: var(--btn-yellow); }
        .btn-teal { background-color: var(--btn-teal); }
        .btn-pink { background-color: var(--btn-pink); }
        .btn:hover { opacity: 0.9; }

        /* Decorative Background Shapes */
        .shape { position: absolute; z-index: 1; pointer-events: none; }
        
        .shape-left { top: 20%; left: -5%; width: 250px; opacity: 0.8; }
        .shape-right-bottom { bottom: -10%; right: -5%; width: 300px; opacity: 0.8; }

        /* Responsive: Switch to vertical stack only on small screens */
        @media (max-width: 900px) {
            .cards-grid {
                grid-template-columns: 1fr; /* 1 Column stack */
                max-width: 400px;
                margin: 0 auto;
            }
        }

    </style>
</head>
<body>
<!-- Header Navigation -->
    <div class="header">
        <div class="nav-left">
            <a href="/admin/home">Home</a>
            <a href="/admin/modules">Module</a>
        </div>
        
        <a href="${pageContext.request.contextPath}/home" class="logo">
            <div class="logo-icon">
                <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
            </div>
            <span>MindLink</span>
        </a>
        
        <div class="nav-right">
            <a href="/admin/forum/reports">Forum</a>
            <a href="/admin/profile">Profile</a>
        </div>
    </div>

    <img src="${pageContext.request.contextPath}/images/assessment-left.png" class="shape shape-left" alt="">
    <img src="${pageContext.request.contextPath}/images/assessment-right.png" class="shape shape-right-bottom" alt="">

    <div class="container">
        
        <h1>Welcome back, Admin123!</h1>

        <div class="cards-grid">
            
            <div class="admin-card">
                <div>
                    <div class="card-title">Learning<br>Module</div>
                    <p class="card-desc">Practical tips on stress management, mindfulness, and emotional resilience.</p>
                </div>
                <a href="/admin/modules" class="btn btn-yellow">Update</a>
            </div>

            <div class="admin-card">
                <div>
                    <div class="card-title">Self<br>Assessment</div>
                    <p class="card-desc">Set up self assessment question for student to know more about mental health.</p>
                </div>
                <a href="/admin/assessment" class="btn btn-teal">Update</a>
            </div>

            <div class="admin-card">
                <div>
                    <div class="card-title">Analytics</div>
                    <p class="card-desc">Reviews graphs</p>
                </div>
                <a href="/admin/analytics" class="btn btn-pink">Review</a>
            </div>

        </div>
    </div>

</body>
</html>