<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Details | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body { font-family: 'Quicksand', sans-serif; background-color: #FFF0E5; color: #003B46; padding: 40px; }
        .container { max-width: 700px; margin: 0 auto; }
        
        .card {
            background: white; border-radius: 20px; padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        .header-section { text-align: center; margin-bottom: 30px; }
        .student-avatar {
            width: 80px; height: 80px; background: #E0F7FA; color: #006064;
            border-radius: 50%; font-size: 32px; display: flex; align-items: center; justify-content: center;
            margin: 0 auto 15px;
        }

        .detail-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 30px; }
        .detail-item { background: #FAFAFA; padding: 15px; border-radius: 10px; }
        .label { display: block; color: #888; font-size: 12px; font-weight: 700; margin-bottom: 5px; text-transform: uppercase; }
        .value { font-weight: 700; color: #003B46; font-size: 16px; }

        /* --- NEW: Feedback Section --- */
        .feedback-section {
            background: #FFF8E1; border: 1px solid #FFE082; 
            border-radius: 15px; padding: 20px; margin-bottom: 30px;
        }
        .star-rating { color: #FFC107; font-size: 18px; margin-bottom: 5px; }

        /* Notes Section */
        .notes-section { margin-top: 30px; border-top: 2px solid #f0f0f0; padding-top: 20px; }
        .notes-area {
            width: 100%; height: 150px; padding: 15px; border-radius: 10px;
            border: 2px solid #eee; font-family: 'Quicksand', sans-serif; font-size: 15px;
            margin-bottom: 20px; resize: vertical; box-sizing: border-box;
        }
        .notes-area:focus { outline: none; border-color: #FF9F1C; }

        .btn-group { display: flex; gap: 15px; margin-top: 20px; }
        .btn {
            flex: 1; padding: 15px; border: none; border-radius: 10px;
            font-weight: 700; cursor: pointer; font-size: 15px; transition: 0.2s;
            display: flex; align-items: center; justify-content: center; gap: 8px; text-decoration: none;
        }
        .btn-save { background: #E0F7FA; color: #006064; }
        .btn-save:hover { background: #B2EBF2; }
        
        .btn-complete { background: #059669; color: white; }
        .btn-complete:hover { background: #047857; }
        
        .btn-email { background: #3B82F6; color: white; }
        .btn-email:hover { background: #2563EB; }

        .status-badge {
            display: inline-block; padding: 5px 12px; border-radius: 20px; 
            font-size: 12px; font-weight: 700; margin-top: 5px;
            background: #FFEDD5; color: #C2410C;
        }
        .completed { background: #D1FAE5; color: #065F46; }
    </style>
</head>
<body>

<div class="container">
    <c:if test="${not empty message}">
        <div style="background: #D1FAE5; color: #065F46; padding: 15px; border-radius: 10px; margin-bottom: 20px; text-align: center;">
            ${message}
        </div>
    </c:if>

    <div class="card">
        <div class="header-section">
            <div class="student-avatar"><i class="fas fa-user"></i></div>
            <h2 style="margin:0;">${appointment.studentName != null ? appointment.studentName : 'Unknown Student'}</h2>
            
            <span class="status-badge ${appointment.status == 'Completed' ? 'completed' : ''}">
                ${appointment.status}
            </span>
        </div>

        <c:if test="${not empty feedback}">
            <div class="feedback-section">
                <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:10px;">
                    <span style="font-weight:700; color:#B45309;"><i class="fas fa-comment-alt"></i> Student Feedback</span>
                    <div class="star-rating">
                        <c:forEach begin="1" end="${feedback.rating}"><i class="fas fa-star"></i></c:forEach>
                        <c:forEach begin="${feedback.rating + 1}" end="5"><i class="far fa-star"></i></c:forEach>
                    </div>
                </div>
                <div style="font-weight:700; font-size:14px; margin-bottom:5px;">${feedback.subject}</div>
                <div style="font-style: italic; color: #555;">"${feedback.message}"</div>
            </div>
        </c:if>

        <div class="detail-grid">
            <div class="detail-item">
                <span class="label">Date & Time</span>
                <span class="value">${appointment.date} @ ${appointment.time}</span>
            </div>
            <div class="detail-item">
                <span class="label">Session Type</span>
                <span class="value">${appointment.type}</span>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/counselor/appointment/update" method="post" class="notes-section">
            <input type="hidden" name="id" value="${appointment.id}">
            
            <h3 style="margin-top:0;">Session Notes</h3>
            <textarea name="notes" class="notes-area" placeholder="Private session notes...">${appointment.notes}</textarea>

            <div class="btn-group">
                <button type="submit" name="action" value="save" class="btn btn-save">
                    <i class="far fa-save"></i> Update Notes
                </button>

                <a href="mailto:${appointment.studentId}@graduate.utm.my?subject=Follow-up: Counseling Session" class="btn btn-email">
                    <i class="fas fa-envelope"></i> Email Student
                </a>

                <c:if test="${appointment.status != 'Completed'}">
                    <button type="submit" name="action" value="complete" class="btn btn-complete"
                            onclick="return confirm('Mark as completed?');">
                        <i class="fas fa-check-circle"></i> Complete
                    </button>
                </c:if>
            </div>
        </form>
        
        <div style="text-align: center; margin-top: 20px;">
            <a href="${pageContext.request.contextPath}/counselor/appointments" style="color:#888; text-decoration: none;">Back to Schedule</a>
        </div>
    </div>
</div>

</body>
</html>