<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Counseling Dashboard | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root { 
            --bg-color: #FFF3E0; 
            --primary: #003049; 
            --accent: #F497AA; 
            --white: #ffffff;
            --success: #81C784;
            --card-hover: #FFF8E7;
        }
        
        body { font-family: 'Inter', sans-serif; background-color: var(--bg-color); margin: 0; padding: 40px; color: var(--primary); }
        
        .container { max-width: 1100px; margin: 0 auto; }
        
        /* --- NEW: BACK BUTTON STYLE --- */
        .back-btn {
            display: inline-flex; align-items: center; gap: 8px;
            text-decoration: none; color: #666; font-weight: 600; font-size: 14px;
            margin-bottom: 20px; transition: 0.2s;
        }
        .back-btn:hover { color: var(--primary); transform: translateX(-5px); }

        /* HEADER */
        .header { margin-bottom: 40px; }
        .header h1 { font-size: 32px; font-weight: 800; margin: 0; }
        .header p { color: #666; margin-top: 5px; font-size: 16px; }

        /* DASHBOARD CARDS */
        .dashboard-grid { 
            display: grid; 
            grid-template-columns: repeat(3, 1fr); 
            gap: 25px; 
            margin-bottom: 50px; 
        }

        .action-card {
            background: var(--white);
            padding: 30px;
            border-radius: 16px;
            text-decoration: none;
            color: var(--primary);
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: transform 0.2s, box-shadow 0.2s;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: space-between;
            height: 140px;
            position: relative;
            overflow: hidden;
        }

        .action-card:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(0,0,0,0.1); }
        
        .card-icon { 
            font-size: 32px; 
            margin-bottom: 15px; 
            padding: 12px; 
            border-radius: 12px; 
        }

        .action-card h3 { margin: 0; font-size: 18px; font-weight: 700; z-index: 1; }
        .action-card p { margin: 5px 0 0 0; font-size: 13px; color: #666; z-index: 1; }
        
        /* Specific Card Styles */
        .card-book { border-bottom: 4px solid var(--accent); }
        .card-book .card-icon { background: #ffebee; color: var(--accent); }
        
        .card-browse { border-bottom: 4px solid #4FC3F7; }
        .card-browse .card-icon { background: #e1f5fe; color: #0288d1; }
        
        .card-history { border-bottom: 4px solid #AED581; }
        .card-history .card-icon { background: #f1f8e9; color: #689f38; }

        /* UPCOMING SESSIONS SECTION */
        .section-title { font-size: 20px; font-weight: 700; margin-bottom: 20px; border-left: 5px solid var(--primary); padding-left: 15px; }

        .app-grid { display: grid; gap: 20px; }
        
        .app-card {
            background: white; border-radius: 12px; padding: 25px;
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05); border-left: 5px solid var(--primary);
        }
        
        .app-info h3 { margin: 0 0 5px 0; font-size: 18px; }
        .app-detail { color: #666; font-size: 14px; margin-top: 5px; }
        .app-detail i { width: 20px; text-align: center; color: var(--accent); }

        .app-actions { display: flex; gap: 10px; }
        
        .btn-cancel {
            background: #ffebee; color: #c62828; padding: 8px 15px; border-radius: 8px;
            text-decoration: none; font-size: 13px; font-weight: 600; transition: 0.2s;
        }
        .btn-cancel:hover { background: #ffcdd2; }
        
        .btn-join {
            background: #e3f2fd; color: #1565c0; padding: 8px 15px; border-radius: 8px;
            text-decoration: none; font-size: 13px; font-weight: 600;
        }
        .btn-join:hover { background: #bbdefb; }

        /* Empty State */
        .empty-state { text-align: center; background: white; padding: 40px; border-radius: 12px; color: #888; }
    </style>
</head>
<body>

<div class="container">
    
    <a href="${pageContext.request.contextPath}/learning" class="back-btn">
        <i class="fas fa-arrow-left"></i> Back to Learning Hub
    </a>

    <div class="header">
        <h1>Counseling Dashboard</h1>
        <p>Manage your mental well-being journey.</p>
    </div>

    <div class="dashboard-grid">
        <a href="${pageContext.request.contextPath}/counseling/booking" class="action-card card-book">
            <div class="card-icon"><i class="far fa-calendar-plus"></i></div>
            <div>
                <h3>Book Session</h3>
                <p>Schedule a new appointment.</p>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/counseling/browse" class="action-card card-browse">
            <div class="card-icon"><i class="fas fa-user-md"></i></div>
            <div>
                <h3>Browse Counselors</h3>
                <p>View profiles & specialties.</p>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/counseling/history" class="action-card card-history">
            <div class="card-icon"><i class="fas fa-history"></i></div>
            <div>
                <h3>Session History</h3>
                <p>View past appointments.</p>
            </div>
        </a>
    </div>

    <div class="section-title">Upcoming Sessions</div>

    <c:if test="${empty appointments}">
        <div class="empty-state">
            <i class="far fa-calendar-check" style="font-size: 40px; margin-bottom: 15px; color: #ddd;"></i>
            <p>You have no upcoming sessions scheduled.</p>
        </div>
    </c:if>

    <div class="app-grid">
        <c:forEach items="${appointments}" var="app">
            <div class="app-card">
                <div class="app-info">
                    <h3>${app.counselorName}</h3>
                    <div class="app-detail">
                        <i class="far fa-calendar-alt"></i> ${app.date} &nbsp;|&nbsp; 
                        <i class="far fa-clock"></i> ${app.time}
                    </div>
                    <div class="app-detail">
                        <i class="fas fa-map-marker-alt"></i> ${app.venue}
                    </div>
                </div>
                
                <div class="app-actions">
                    <a href="${pageContext.request.contextPath}/counseling/view?id=${app.id}" 
                       class="btn-join" style="margin-right: 5px;">
                       View
                    </a>

                    <c:if test="${app.venue.startsWith('http')}">
                        <a href="${app.venue}" target="_blank" class="btn-join">
                            Join <i class="fas fa-external-link-alt"></i>
                        </a>
                    </c:if>

                    <a href="${pageContext.request.contextPath}/counseling/booking/cancel?id=${app.id}" 
                       class="btn-cancel"
                       onclick="return confirm('Are you sure you want to cancel this session?');">
                        Cancel
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

</body>
</html>