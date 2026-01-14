<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Schedule | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        :root {
            --bg-color: #FFF3E0; 
            --text-dark: #003049; 
            --card-bg: #FFFFFF;
            --btn-orange: #F77F00;
            --btn-hover: #D62828;
            --text-grey: #555;
            --input-bg: #FFFFFF;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            color: var(--text-dark);
            min-height: 100vh;
        }

        /* --- Navbar (Exact Match) --- */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            padding: 15px 50px;
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: sticky; top: 0; z-index: 100;
        }

        .nav-center-logo {
            font-size: 24px; font-weight: 800; color: var(--text-dark);
            display: flex; align-items: center; gap: 10px;
            text-decoration: none;
        }

        .nav-links { display: flex; gap: 30px; }
        .nav-links a {
            text-decoration: none; color: #555; font-weight: 600; font-size: 16px;
            transition: color 0.2s;
        }
        .nav-links a:hover, .nav-links a.active-link { color: var(--text-dark); }
        .btn-logout { color: #D62828 !important; }

        /* --- Main Container --- */
        .container { max-width: 900px; margin: 40px auto; padding: 0 20px 80px; }
        
        .page-header { margin-bottom: 30px; text-align: center; }
        .page-header h1 { font-size: 36px; font-weight: 800; margin: 0; color: var(--text-dark); }
        
        /* --- Search Form --- */
        .search-form {
            margin-bottom: 30px; 
            display: flex; gap: 10px;
            background: var(--card-bg);
            padding: 10px;
            border-radius: 50px; /* Pill shape */
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
            border: 1px solid rgba(0,0,0,0.05);
        }

        .search-input {
            flex: 1; 
            padding: 12px 20px; 
            border: none;
            background: transparent;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            outline: none;
        }

        .btn-search {
            background: var(--text-dark); 
            color: white; 
            border: none; 
            padding: 0 30px; 
            border-radius: 50px; 
            cursor: pointer;
            font-weight: 600;
            transition: background 0.2s;
        }
        .btn-search:hover { background: #004d73; }

        /* --- TABS --- */
        .tab-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
            border-bottom: 2px solid rgba(0,0,0,0.05);
            padding-bottom: 10px;
        }

        .tab-btn {
            background: transparent;
            border: none;
            font-family: 'Inter', sans-serif;
            font-weight: 700;
            font-size: 16px;
            color: #888;
            cursor: pointer;
            padding: 10px 20px;
            border-bottom: 3px solid transparent;
            transition: all 0.2s;
        }

        .tab-btn:hover { color: var(--text-dark); }
        
        .tab-btn.active {
            color: var(--text-dark);
            border-bottom-color: var(--btn-orange);
        }

        /* --- APPOINTMENT CARDS --- */
        .tab-section { display: none; animation: fadeIn 0.3s ease; }
        .tab-section.active-section { display: block; }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(5px); } to { opacity: 1; transform: translateY(0); } }

        .appt-card {
            background: var(--card-bg);
            border-radius: 16px;
            padding: 25px 30px;
            margin-bottom: 20px;
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.03);
            transition: transform 0.2s;
        }
        .appt-card:hover { transform: translateY(-3px); box-shadow: 0 8px 20px rgba(0,0,0,0.06); }

        .card-left { display: flex; gap: 20px; align-items: center; }
        
        /* Date Box Icon */
        .date-box {
            width: 50px; height: 50px;
            background: #FFF4E6; color: var(--btn-orange);
            border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 20px;
        }
        
        .history-card .date-box { background: #E0E0E0; color: #777; }
        
        /* Typography inside Card */
        .student-name {
            margin: 0 0 5px 0; font-size: 18px; font-weight: 700; color: var(--text-dark);
        }
        
        .session-meta {
            color: var(--text-grey); font-size: 14px; font-weight: 500;
        }

        /* Action Button */
        .btn-view {
            background: var(--btn-orange); color: white;
            padding: 10px 25px; border-radius: 50px; 
            text-decoration: none; font-weight: 600; font-size: 14px;
            transition: background 0.2s;
        }
        .btn-view:hover { background: var(--btn-hover); }

        /* Empty State */
        .empty-state {
            text-align: center; padding: 50px; color: #999;
            background: rgba(255,255,255,0.5); border-radius: 16px;
        }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/dashboard">Home</a>
            <a href="${pageContext.request.contextPath}/counselor/appointments" class="active-link">Appointment</a>
        </div>
        <a href="#" class="nav-center-logo">
            <i class="fas fa-heart" style="color: #F77F00;"></i> MindLink
        </a>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/profile">Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a>
        </div>
    </nav>

    <div class="container">
        <div class="page-header">
            <h1>My Schedule</h1>
        </div>

        <form action="${pageContext.request.contextPath}/counselor/appointments" method="get" class="search-form">
            <input type="text" name="search" placeholder="Search by Student Name or Date..." 
                   value="${currentSearch}" class="search-input">
            <button type="submit" class="btn-search">Search</button>
            <c:if test="${not empty currentSearch}">
                <a href="${pageContext.request.contextPath}/counselor/appointments" 
                   style="display:flex; align-items:center; color:#D62828; text-decoration:none; padding:0 20px; font-weight: 600;">
                   Reset
                </a>
            </c:if>
        </form>

        <div class="tab-container">
            <button class="tab-btn active" onclick="switchTab('upcoming')">Upcoming Sessions</button>
            <button class="tab-btn" onclick="switchTab('history')">History</button>
        </div>

        <div id="tab-upcoming" class="tab-section active-section">
            <c:set var="hasUpcoming" value="false" />
            
            <c:forEach items="${appointments}" var="app">
                <c:if test="${app.upcoming}">
                    <c:set var="hasUpcoming" value="true" />
                    
                    <div class="appt-card">
                        <div class="card-left">
                            <div class="date-box">
                                <i class="far fa-calendar-alt"></i>
                            </div>
                            <div>
                                <h3 class="student-name">
                                    ${app.studentName != null ? app.studentName : 'Unknown Student'}
                                </h3>
                                <div class="session-meta">
                                    <span>${app.date} @ ${app.time}</span>
                                    <span style="margin: 0 8px;">•</span>
                                    <span>${app.type}</span>
                                </div>
                            </div>
                        </div>

                        <a href="${pageContext.request.contextPath}/counselor/appointment?id=${app.id}" class="btn-view">
                            View Details
                        </a>
                    </div>
                </c:if>
            </c:forEach>

            <c:if test="${not hasUpcoming}">
                <div class="empty-state">
                    <i class="far fa-calendar-check" style="font-size: 32px; margin-bottom: 10px; display:block;"></i>
                    No upcoming sessions found.
                </div>
            </c:if>
        </div>

        <div id="tab-history" class="tab-section">
            <c:set var="hasHistory" value="false" />

            <c:forEach items="${appointments}" var="app">
                <c:if test="${!app.upcoming}">
                    <c:set var="hasHistory" value="true" />

                    <div class="appt-card history-card">
                        <div class="card-left">
                            <div class="date-box">
                                <i class="fas fa-history"></i>
                            </div>
                            <div>
                                <h3 class="student-name" style="color: #666;">
                                    ${app.studentName != null ? app.studentName : 'Unknown Student'}
                                </h3>
                                <div class="session-meta">
                                    <span>${app.date} @ ${app.time}</span>
                                    <span style="margin: 0 8px;">•</span>
                                    <span>${app.status}</span>
                                </div>
                            </div>
                        </div>

                        <a href="${pageContext.request.contextPath}/counselor/appointment?id=${app.id}" 
                           style="font-size: 14px; color: #888; text-decoration: none; font-weight: 600;">
                           View Summary
                        </a>
                    </div>
                </c:if>
            </c:forEach>

            <c:if test="${not hasHistory}">
                <div class="empty-state">
                    <i class="fas fa-history" style="font-size: 32px; margin-bottom: 10px; display:block;"></i>
                    No history found.
                </div>
            </c:if>
        </div>

    </div>

    <script>
        function switchTab(tabName) {
            // Hide all sections
            document.querySelectorAll('.tab-section').forEach(el => el.classList.remove('active-section'));
            // Deactivate all buttons
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));

            // Show selected
            document.getElementById('tab-' + tabName).classList.add('active-section');

            // Highlight button
            if(tabName === 'upcoming') {
                document.querySelector('.tab-btn:nth-child(1)').classList.add('active');
            } else {
                document.querySelector('.tab-btn:nth-child(2)').classList.add('active');
            }
        }
    </script>

</body>
</html>