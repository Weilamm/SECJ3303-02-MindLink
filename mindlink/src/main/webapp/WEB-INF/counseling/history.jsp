<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Appointment History | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-teal: #48C9B0;
            --accent: #F497AA;
            --gray: #666;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 40px 20px; /* Increased top padding since header is gone */
            color: var(--text-dark);
        }

        /* CONTAINER (Controls the width) */
        .container { max-width: 1000px; margin: 0 auto; }

        /* BACK BUTTON */
        .btn-back { 
            display: inline-flex; align-items: center; gap: 8px; 
            text-decoration: none; color: #666; font-weight: 600; 
            margin-bottom: 20px; transition: 0.2s; 
        }
        .btn-back:hover { color: var(--text-dark); transform: translateX(-5px); }

        /* CENTERED TITLE & SUBTITLE */
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 10px; text-align: center; }
        .subtitle { color: var(--gray); margin-bottom: 40px; font-size: 16px; text-align: center; }

        /* HISTORY LIST */
        .history-list { display: flex; flex-direction: column; gap: 20px; }

        .history-card {
            background: var(--card-bg);
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            display: grid;
            grid-template-columns: 1fr auto;
            align-items: center;
            transition: transform 0.2s;
            border-left: 5px solid var(--btn-teal);
        }
        .history-card:hover { transform: translateY(-3px); box-shadow: 0 6px 15px rgba(0,0,0,0.08); }

        .card-content { display: flex; flex-direction: column; gap: 8px; }

        .counselor-name { font-size: 18px; font-weight: 700; color: #111; display: flex; align-items: center; gap: 10px; }
        .badge { background: #E0F2F1; color: #00695C; padding: 4px 10px; border-radius: 20px; font-size: 12px; font-weight: 600; }

        .details-row { font-size: 14px; color: #555; display: flex; gap: 20px; align-items: center; margin-top: 5px; }
        .details-row i { color: var(--btn-teal); width: 20px; text-align: center; }

        .booking-id { font-size: 12px; color: #999; margin-top: 5px; font-family: monospace; }

        .btn-view {
            background-color: var(--btn-teal);
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 30px;
            font-weight: 600;
            font-size: 14px;
            transition: 0.2s;
            box-shadow: 0 4px 10px rgba(72, 201, 176, 0.3);
        }
        .btn-view:hover { background-color: #36b299; transform: translateY(-2px); }
        
        /* Empty State */
        .empty-state { text-align: center; padding: 50px; background: white; border-radius: 12px; color: #888; }
    </style>
</head>
<body>

    <div class="container">
        <a href="${pageContext.request.contextPath}/counseling/home" class="btn-back">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>

        <h1>Appointment History</h1>
        <p class="subtitle">View details of your past sessions.</p>

        <div class="history-list">
            
            <c:forEach items="${appointments}" var="app">
                <div class="history-card">
                    
                    <div class="card-content">
                        <div class="counselor-name">
                            ${app.counselorName}
                            <span class="badge">Completed</span>
                        </div>
                        
                        <div class="details-row">
                            <span><i class="far fa-calendar-alt"></i> ${app.date}</span>
                            <span><i class="far fa-clock"></i> ${app.time}</span>
                            <span>
                                <c:choose>
                                    <c:when test="${app.venue.startsWith('http')}">
                                        <i class="fas fa-video"></i> Online
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-map-marker-alt"></i> Physical
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        
                        <div class="booking-id">ID: ${app.id}</div>
                    </div>

                    <div>
                        <a href="${pageContext.request.contextPath}/counseling/history/view?id=${app.id}" class="btn-view">
                            View Details <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty appointments}">
                <div class="empty-state">
                    <i class="fas fa-history" style="font-size: 40px; margin-bottom: 15px; color: #ddd;"></i>
                    <p>No appointment history found.</p>
                    <a href="${pageContext.request.contextPath}/counseling/booking" 
                       style="color: var(--btn-teal); font-weight: 600; text-decoration: none;">
                       Book a Session
                    </a>
                </div>
            </c:if>

        </div>
    </div>

</body>
</html>