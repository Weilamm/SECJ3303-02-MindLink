<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Share Your Feedback | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --input-bg: #F9FAFB;
            --btn-teal: #48C9B0;
            --success-green: #6FCF97;
            --star-gold: #FFD700;
        }

        body { font-family: 'Inter', sans-serif; background-color: var(--bg-color); margin: 0; padding: 20px; color: var(--text-dark); }
        
        /* HEADER */
        .header { padding: 20px 100px; display: flex; justify-content: space-between; align-items: center; background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); margin-bottom: 40px; }
        .nav-links a { text-decoration: none; color: #00313e; font-weight: 500; margin: 0 15px; transition: 0.3s; }
        .logo { display: flex; align-items: center; gap: 10px; font-weight: 800; color: #00313e; font-size: 24px; text-decoration: none; }
        .logo img { height: 40px; }

        .container { max-width: 700px; margin: 0 auto; }

        .btn-back { display: inline-flex; align-items: center; gap: 8px; text-decoration: none; color: #666; font-weight: 600; margin-bottom: 20px; transition: 0.2s; }
        .btn-back:hover { color: var(--text-dark); transform: translateX(-5px); }

        h1 { font-size: 28px; font-weight: 800; margin-bottom: 5px; text-align: center; }
        .subtitle { color: #666; font-size: 16px; margin-bottom: 30px; text-align: center; }

        /* CARD STYLE */
        .feedback-card {
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        }

        .form-group { margin-bottom: 25px; }
        label { display: block; font-size: 14px; font-weight: 700; margin-bottom: 8px; color: #444; }
        
        .form-control { 
            width: 100%; padding: 14px; background-color: var(--input-bg); 
            border: 1px solid #E0E0E0; border-radius: 8px; font-size: 15px; 
            outline: none; box-sizing: border-box; transition: 0.2s;
            font-family: inherit;
        }
        .form-control:focus { border-color: var(--btn-teal); background: white; }
        textarea.form-control { height: 120px; resize: vertical; }

        /* STAR RATING */
        .star-rating { display: flex; gap: 10px; flex-direction: row-reverse; justify-content: flex-end; }
        .star-rating input { display: none; }
        .star-rating label { 
            font-size: 30px; color: #ddd; cursor: pointer; transition: 0.2s; margin: 0;
        }
        /* Hover and Checked Logic */
        .star-rating input:checked ~ label,
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: var(--star-gold);
        }

        .btn-submit { 
            background-color: var(--text-dark); color: white; width: 100%; 
            padding: 16px; border: none; border-radius: 50px; font-size: 16px; 
            font-weight: 600; cursor: pointer; margin-top: 10px; transition: 0.2s; 
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .btn-submit:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(0,0,0,0.15); }

        /* SUCCESS MODAL */
        .modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5); display: flex; justify-content: center; align-items: center;
            z-index: 1000; backdrop-filter: blur(4px);
        }
        .success-box {
            background: white; padding: 40px 60px; border-radius: 20px; text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1); animation: popIn 0.3s ease-out;
        }
        @keyframes popIn { 0% { transform: scale(0.8); opacity: 0; } 100% { transform: scale(1); opacity: 1; } }
        .check-icon {
            width: 70px; height: 70px; background-color: var(--success-green); border-radius: 50%;
            display: inline-flex; justify-content: center; align-items: center; margin-bottom: 20px;
            color: white; font-size: 35px;
        }
        .success-title { font-size: 22px; font-weight: 700; color: #003049; }
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
        
        <a href="${pageContext.request.contextPath}/counseling/history/view?id=${bookingId}" class="btn-back">
            <i class="fas fa-arrow-left"></i> Back to Session Details
        </a>

        <h1>Share Your Feedback</h1>
        <p class="subtitle">How was your experience with session #${bookingId}?</p>

        <div class="feedback-card">
            <form action="${pageContext.request.contextPath}/counseling/history/feedback/submit" method="post">
                <input type="hidden" name="bookingId" value="${bookingId}">
                
                <div class="form-group">
                    <label>What is this regarding?</label>
                    <select name="category" class="form-control">
                        <option>Counseling Session Quality</option>
                        <option>Platform / Technical Issue</option>
                        <option>Counselor Behavior</option>
                        <option>Other Suggestion</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Subject</label>
                    <input type="text" name="subject" class="form-control" placeholder="Brief summary (e.g., Audio was clear)" required>
                </div>

                <div class="form-group">
                    <label>Your Message</label>
                    <textarea name="message" class="form-control" placeholder="Tell us more about your experience..." required></textarea>
                </div>

                <div class="form-group">
                    <label>Overall Rating</label>
                    <div class="star-rating">
                        <input type="radio" name="rating" id="star5" value="5" required><label for="star5" title="Excellent">★</label>
                        <input type="radio" name="rating" id="star4" value="4"><label for="star4" title="Good">★</label>
                        <input type="radio" name="rating" id="star3" value="3"><label for="star3" title="Average">★</label>
                        <input type="radio" name="rating" id="star2" value="2"><label for="star2" title="Poor">★</label>
                        <input type="radio" name="rating" id="star1" value="1"><label for="star1" title="Terrible">★</label>
                    </div>
                </div>

                <button type="submit" class="btn-submit">Submit Feedback</button>
            </form>
        </div>
    </div>

    <c:if test="${success}">
        <div class="modal-overlay" id="successModal">
            <div class="success-box">
                <div class="check-icon"><i class="fas fa-check"></i></div>
                <div class="success-title">Thank you!</div>
                <p style="color: #666; margin-top: 5px;">Your feedback has been saved successfully.</p>
            </div>
        </div>

        <script>
            // Redirect back to History list after 2 seconds
            setTimeout(function() {
                window.location.href = "${pageContext.request.contextPath}/counseling/history";
            }, 2000);
        </script>
    </c:if>

</body>
</html>