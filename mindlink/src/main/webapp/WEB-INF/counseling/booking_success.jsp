<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Successful | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            
            /* Button Colors from your image */
            --btn-yellow: #F6D776;
            --btn-green: #90EE90;
            --btn-red: #F497AA;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
            color: var(--text-dark);
        }

        /* MAIN CONTENT */
        .main-container { max-width: 900px; margin: 40px auto; }
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 5px; color: var(--text-dark); }
        .subtitle { color: #8CC63F; font-size: 18px; font-weight: 700; margin-bottom: 30px; }

        .success-card {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 50px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        }

        .confirmation-text { font-size: 16px; margin-bottom: 40px; color: #555; }

        /* DATA GRID */
        .details-grid {
            display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 50px;
        }
        .detail-row { margin-bottom: 15px; font-size: 15px; }
        .label { font-weight: 400; color: #666; margin-right: 5px; }
        .value { font-weight: 700; color: #000; }

        /* BUTTONS */
        .action-buttons { display: flex; justify-content: center; gap: 20px; }
        .btn {
            padding: 12px 30px; border-radius: 30px; border: none; font-weight: 600; font-size: 14px;
            cursor: pointer; display: flex; align-items: center; gap: 8px;
            text-decoration: none; color: #333; transition: 0.2s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .btn:hover { transform: translateY(-3px); box-shadow: 0 6px 12px rgba(0,0,0,0.15); opacity: 0.95; }

        .btn-reschedule { background-color: var(--btn-yellow); }
        .btn-confirm { background-color: var(--btn-green); }
        .btn-cancel { background-color: var(--btn-red); }
    </style>
</head>
<body>
    <div class="main-container">
        <h1>Appointment Details</h1>
        <div class="subtitle">Booking Succesful!</div>

        <div class="success-card">
            
            <c:if test="${not empty bookingId}">
                <p class="confirmation-text">
                    Your counseling session has been booked successfully. Below are the details of your appointment.
                </p>

                <div class="details-grid">
                    <div>
                        <div class="detail-row">
                            <span class="label">Booking ID:</span>
                            <span class="value">${bookingId}</span>
                        </div>
                        <div class="detail-row">
                            <span class="label">Session Type:</span>
                            <span class="value">${sessionType}</span>
                        </div>
                        <div class="detail-row">
                            <span class="label">Date:</span>
                            <span class="value">${date}</span>
                        </div>
                    </div>

                    <div>
                        <div class="detail-row">
                            <span class="label">Counselor Name:</span>
                            <span class="value">${counselorName}</span>
                        </div>
                        <div class="detail-row">
                            <span class="label">Venue:</span>
                            
                            <c:choose>
                                <%-- If it's a link (Online Mode) --%>
                                <c:when test="${venue.startsWith('http')}">
                                    <span class="value">
                                        <a href="${venue}" target="_blank" style="color: #007bff; text-decoration: underline; word-break: break-all;">
                                            ${venue} </a>
                                    </span>
                                </c:when>
                                
                                <%-- If it's text (Physical Mode) --%>
                                <c:otherwise>
                                    <span class="value">${venue}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="detail-row">
                            <span class="label">Time:</span>
                            <span class="value">${time}</span>
                        </div>
                    </div>
                </div>

                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/counseling/booking?rescheduleId=${bookingId}" class="btn btn-reschedule">
                        Reschedule 📅
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/counseling/home" class="btn btn-confirm">
                        Confirm ✅
                    </a>

                    <a href="${pageContext.request.contextPath}/counseling/booking/cancel?id=${bookingId}" 
                       class="btn btn-cancel" 
                       onclick="return confirm('Are you sure you want to cancel this booking?');">
                        Cancel ❌
                    </a>
                </div>
            </c:if>

            <c:if test="${empty bookingId}">
                <p style="text-align: center; color: red;">No booking details found. Please book an appointment first.</p>
                <div style="text-align: center;">
                    <a href="${pageContext.request.contextPath}/counseling/booking" class="btn btn-confirm" style="display:inline-flex;">Go to Booking</a>
                </div>
            </c:if>

        </div>
    </div>

</body>
</html>