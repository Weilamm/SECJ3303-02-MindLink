<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Details | MindLink</title>
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
            margin: 0; padding: 20px;
            color: var(--text-dark);
        }

        /* HEADER */
        .header { padding: 20px 100px; display: flex; justify-content: space-between; align-items: center; background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .nav-links a { text-decoration: none; color: #00313e; font-weight: 500; margin: 0 15px; transition: 0.3s; }
        .logo { display: flex; align-items: center; gap: 10px; font-weight: 800; color: #00313e; font-size: 24px; text-decoration: none; }
        .logo img { height: 40px; }

        .container { max-width: 800px; margin: 40px auto; }
        
        /* BACK BUTTON */
        .btn-back { display: inline-flex; align-items: center; gap: 8px; text-decoration: none; color: #666; font-weight: 600; margin-bottom: 20px; transition: 0.2s; }
        .btn-back:hover { color: var(--text-dark); transform: translateX(-5px); }

        h1 { font-size: 32px; font-weight: 800; margin-bottom: 10px; }
        .status-badge {
            display: inline-block; background: #E0F2F1; color: #00695C; 
            padding: 5px 12px; border-radius: 20px; font-size: 14px; font-weight: 600; margin-bottom: 30px;
        }

        /* MAIN CARD */
        .card {
            background: var(--card-bg);
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        }

        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 40px;
            border-bottom: 1px solid #eee;
            padding-bottom: 30px;
        }
        
        .detail-item { margin-bottom: 20px; }
        .label { display: block; font-size: 13px; color: #888; margin-bottom: 5px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; }
        .value { font-size: 18px; font-weight: 600; color: #222; display: flex; align-items: center; gap: 10px; }
        .value i { color: var(--btn-teal); width: 20px; }

        /* BUTTONS */
        .action-area { display: flex; justify-content: center; gap: 20px; }

        .btn-feedback {
            background-color: var(--text-dark);
            color: white;
            padding: 15px 35px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            display: flex; align-items: center; gap: 10px;
            box-shadow: 0 4px 15px rgba(0, 48, 73, 0.2);
            transition: 0.2s;
        }
        .btn-feedback:hover { transform: translateY(-3px); box-shadow: 0 6px 20px rgba(0, 48, 73, 0.3); }

        /* 🟢 NEW: FEEDBACK DISPLAY STYLES */
        .feedback-container { margin-top: 20px; }
        .feedback-title { font-weight: 700; color: #003049; margin-bottom: 15px; font-size: 18px; }

        .student-msg {
            background: #f9f9f9; padding: 20px; border-radius: 12px; border-left: 5px solid #ccc;
            margin-bottom: 20px; font-size: 15px; line-height: 1.5; color: #444;
        }

        .admin-reply-box {
            background: #E0F2F1; padding: 20px; border-radius: 12px; border-left: 5px solid var(--btn-teal);
            color: #004D40; font-size: 15px; line-height: 1.5;
        }
        
        .reply-header { display: flex; align-items: center; gap: 8px; font-weight: 700; margin-bottom: 8px; color: #00695C; }
        .waiting-text { font-style: italic; color: #888; text-align: center; margin-top: 10px; }

    </style>
</head>
<body>

    <div class="header">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/learning">Learning</a>
        </div>
        <a href="${pageContext.request.contextPath}/home" class="logo">
            <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
            <span>MindLink</span>
        </a>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/forum/welcome">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <div class="container">
        <a href="${pageContext.request.contextPath}/counseling/history" class="btn-back">
            <i class="fas fa-arrow-left"></i> Back to History
        </a>

        <h1>Session Details</h1>
        <div class="status-badge"><i class="fas fa-check-circle"></i> Completed</div>

        <div class="card">

            <div class="details-grid">
                <div>
                    <div class="detail-item">
                        <span class="label">Counselor</span>
                        <span class="value"><i class="fas fa-user-md"></i> ${app.counselorName}</span>
                    </div>
                    <div class="detail-item">
                        <span class="label">Date</span>
                        <span class="value"><i class="far fa-calendar-alt"></i> ${app.date}</span>
                    </div>
                    <div class="detail-item">
                        <span class="label">Session Type</span>
                        <span class="value"><i class="fas fa-laptop-medical"></i> ${app.type}</span>
                    </div>
                </div>

                <div>
                    <div class="detail-item">
                        <span class="label">Booking ID</span>
                        <span class="value" style="font-family: monospace; font-size: 16px;">#${app.id}</span>
                    </div>
                    <div class="detail-item">
                        <span class="label">Time</span>
                        <span class="value"><i class="far fa-clock"></i> ${app.time}</span>
                    </div>
                    <div class="detail-item">
                        <span class="label">Venue / Link</span>
                        <span class="value">
                            <c:choose>
                                <c:when test="${app.venue.startsWith('http')}">
                                    <a href="${app.venue}" target="_blank" style="color: #007bff; text-decoration: underline; font-size: 16px;">
                                        Open Link <i class="fas fa-external-link-alt" style="width: auto; font-size: 12px;"></i>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-map-marker-alt"></i> ${app.venue}
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                </div>
            </div>

            <c:choose>
                
                <%-- CASE 1: Feedback already exists -> Show Student Msg & Admin Reply --%>
                <c:when test="${not empty feedback}">
                    <div class="feedback-container">
                        <div class="feedback-title"><i class="fas fa-comments"></i> Session Feedback</div>
                        
                        <div class="student-msg">
                            <strong>Your Review (${feedback.rating}/5):</strong><br>
                            "${feedback.message}"
                        </div>

                        <c:if test="${not empty feedback.adminReply}">
                            <div class="admin-reply-box">
                                <div class="reply-header">
                                    <i class="fas fa-check-circle"></i> Admin Response
                                </div>
                                "${feedback.adminReply}"
                            </div>
                        </c:if>

                        <c:if test="${empty feedback.adminReply}">
                            <p class="waiting-text">Your feedback has been submitted. Waiting for admin response...</p>
                        </c:if>
                    </div>
                </c:when>

                <%-- CASE 2: No Feedback yet -> Show Button --%>
                <c:otherwise>
                    <div class="action-area">
                        <a href="${pageContext.request.contextPath}/counseling/history/feedback?id=${app.id}" class="btn-feedback">
                            <i class="far fa-comment-dots"></i> Write Feedback
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </div>

</body>
</html>