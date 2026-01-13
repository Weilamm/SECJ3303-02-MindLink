<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Appointments | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --bg-peach: #FFF0E5;       
            --text-dark: #003B46;      
            --text-body: #666;         
            --card-white: #FFFFFF;
            --btn-orange: #FF9F1C;     
            --btn-hover: #E68A00;
        }

        body {
            font-family: 'Quicksand', sans-serif;
            background-color: var(--bg-peach);
            margin: 0;
            color: var(--text-dark);
            min-height: 100vh;
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 15px 50px;
            display: flex; justify-content: space-between; align-items: center;
            position: sticky; top: 0; z-index: 100;
            box-shadow: 0 4px 20px rgba(0,0,0,0.02);
        }
        .nav-center-logo {
            font-size: 24px; font-weight: 700; color: var(--text-dark);
            position: absolute; left: 50%; transform: translateX(-50%);
            display: flex; align-items: center; gap: 10px;
        }
        .nav-links { display: flex; gap: 40px; align-items: center; }
        .nav-links a { text-decoration: none; color: var(--text-dark); font-weight: 700; transition: 0.2s; position: relative; }
        
        .active-link { color: var(--btn-orange) !important; }
        .active-link::after {
            content: ''; position: absolute; width: 100%; height: 3px;
            bottom: -5px; left: 0; background-color: var(--btn-orange); border-radius: 2px;
        }
        .btn-logout { color: #d9534f !important; }

        /* Container */
        .container { max-width: 800px; margin: 0 auto; padding: 40px 20px 80px; }
        
        .page-header { margin-bottom: 30px; text-align: center; }
        .page-header h1 { font-size: 36px; margin: 0; }
        
        /* Search Form */
        .search-form {
            margin-bottom: 20px; 
            display: flex; 
            gap: 10px;
            background: white;
            padding: 15px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.02);
        }

        .search-input {
            flex: 1; 
            padding: 12px; 
            border-radius: 10px; 
            border: 1px solid #ddd;
            font-family: 'Quicksand', sans-serif;
        }

        .btn-search {
            background: var(--text-dark); 
            color: white; 
            border: none; 
            padding: 0 25px; 
            border-radius: 10px; 
            cursor: pointer;
            font-weight: 700;
        }

        /* --- TAB BUTTONS --- */
        .tab-container {
            display: flex;
            background: rgba(255,255,255,0.5);
            padding: 5px;
            border-radius: 15px;
            margin-bottom: 30px;
        }

        .tab-btn {
            flex: 1;
            padding: 12px;
            border: none;
            background: transparent;
            border-radius: 10px;
            font-family: 'Quicksand', sans-serif;
            font-weight: 700;
            font-size: 16px;
            color: var(--text-body);
            cursor: pointer;
            transition: 0.2s;
        }

        .tab-btn.active {
            background: white;
            color: var(--btn-orange);
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        /* Hide sections by default if not active */
        .tab-section { display: none; }
        .tab-section.active-section { display: block; animation: fadeIn 0.3s ease; }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Cards */
        .appt-card {
            background: var(--card-white);
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 20px;
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.03);
            transition: transform 0.2s;
        }
        .appt-card:hover { transform: translateY(-3px); }

        .history-card { opacity: 0.9; background: #FAFAFA; }

        .card-left { display: flex; gap: 20px; align-items: center; }
        
        .date-box {
            background: #F0FDF4; color: #166534;
            border-radius: 15px; width: 60px; height: 60px;
            display: flex; flex-direction: column; align-items: center; justify-content: center;
            font-weight: 700;
        }
        
        .history-card .date-box { background: #E5E7EB; color: #374151; }
        
        .status-badge { padding: 5px 12px; border-radius: 20px; font-size: 12px; font-weight: 700; }
        .status-confirmed { background: #D1FAE5; color: #065F46; } 
        .status-booked { background: #E0F2F1; color: #00695C; }    
        .status-cancelled { background: #FEE2E2; color: #991B1B; }  
        .status-completed { background: #F3F4F6; color: #374151; }  
        
        .btn-view {
            background: var(--btn-orange); color: white;
            padding: 8px 20px; border-radius: 50px; text-decoration: none;
            font-weight: 700; font-size: 14px;
        }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/dashboard">Home</a>
            <a href="${pageContext.request.contextPath}/counselor/appointments" class="active-link">Appointment</a>
        </div>
        <div class="nav-center-logo"><i class="fas fa-heart"></i> MindLink</div>
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
            <input type="text" name="search" placeholder="Search by Student ID or Date..." 
                   value="${currentSearch}" class="search-input">
            <button type="submit" class="btn-search">Search</button>
            <c:if test="${not empty currentSearch}">
                <a href="${pageContext.request.contextPath}/counselor/appointments" 
                   style="display:flex; align-items:center; color:#d9534f; text-decoration:none; padding:0 10px;">Reset</a>
            </c:if>
        </form>

        <div class="tab-container">
            <button class="tab-btn active" onclick="switchTab('upcoming')">Upcoming Sessions</button>
            <button class="tab-btn" onclick="switchTab('history')">History</button>
        </div>

        <div id="tab-upcoming" class="tab-section active-section">
            <c:set var="hasUpcoming" value="false" />
            
            <c:forEach items="${appointments}" var="app">
                <c:if test="${app.status == 'Booked' || app.status == 'Confirmed'}">
                    <c:set var="hasUpcoming" value="true" />
                    
                    <div class="appt-card">
                        <div class="card-left">
                            <div class="date-box">
                                <i class="far fa-calendar"></i>
                            </div>
                            <div>
                                <h3 style="margin:0 0 5px 0;">Student #${app.studentId}</h3>
                                <div style="color:#666; font-size:14px;">
                                    <span>${app.date} @ ${app.time}</span>
                                    <span style="margin: 0 8px;">•</span>
                                    <span>${app.type}</span>
                                </div>
                            </div>
                        </div>

                        <div style="display: flex; flex-direction: column; align-items: flex-end; gap: 8px;">
                            <span class="status-badge ${app.status == 'Confirmed' ? 'status-confirmed' : 'status-booked'}">
                                ${app.status}
                            </span>
                            <a href="${pageContext.request.contextPath}/counselor/appointment?id=${app.id}" class="btn-view">View Details</a>
                        </div>
                    </div>
                </c:if>
            </c:forEach>

            <c:if test="${not hasUpcoming}">
                <div style="text-align: center; padding: 40px; color: #999;">
                    <i class="far fa-calendar-check" style="font-size: 32px; margin-bottom: 10px; display:block;"></i>
                    No upcoming sessions found.
                </div>
            </c:if>
        </div>

        <div id="tab-history" class="tab-section">
            <c:set var="hasHistory" value="false" />

            <c:forEach items="${appointments}" var="app">
                <c:if test="${app.status == 'Completed' || app.status == 'Cancelled'}">
                    <c:set var="hasHistory" value="true" />

                    <div class="appt-card history-card">
                        <div class="card-left">
                            <div class="date-box">
                                <i class="fas fa-history"></i>
                            </div>
                            <div>
                                <h3 style="margin:0 0 5px 0; color: #666;">Student #${app.studentId}</h3>
                                <div style="color:#888; font-size:14px;">
                                    <span>${app.date} @ ${app.time}</span>
                                </div>
                            </div>
                        </div>

                        <div style="display: flex; flex-direction: column; align-items: flex-end; gap: 8px;">
                            <c:choose>
                                <c:when test="${app.status == 'Cancelled'}">
                                    <span class="status-badge status-cancelled">Cancelled</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge status-completed">Completed</span>
                                </c:otherwise>
                            </c:choose>
                            <a href="${pageContext.request.contextPath}/counselor/appointment?id=${app.id}" 
                               style="font-size: 13px; color: #888; text-decoration: none;">View Summary</a>
                        </div>
                    </div>
                </c:if>
            </c:forEach>

            <c:if test="${not hasHistory}">
                <div style="text-align: center; padding: 40px; color: #999;">
                    <i class="fas fa-history" style="font-size: 32px; margin-bottom: 10px; display:block;"></i>
                    No history found.
                </div>
            </c:if>
        </div>

    </div>

    <script>
        function switchTab(tabName) {
            // 1. Hide all sections
            document.querySelectorAll('.tab-section').forEach(el => {
                el.classList.remove('active-section');
            });

            // 2. Deactivate all buttons
            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.classList.remove('active');
            });

            // 3. Show selected section
            document.getElementById('tab-' + tabName).classList.add('active-section');

            // 4. Highlight clicked button (need to find which button was clicked)
            // Simple hack: We know the order, or we can use event.target
            if(tabName === 'upcoming') {
                document.querySelector('.tab-btn:nth-child(1)').classList.add('active');
            } else {
                document.querySelector('.tab-btn:nth-child(2)').classList.add('active');
            }
        }
    </script>

</body>
</html>