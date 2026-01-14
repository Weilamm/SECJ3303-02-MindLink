<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${c.name} - Profile | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root { 
            --bg-color: #FFF3E0; 
            --primary: #003049; 
            --accent: #F497AA; 
            --success: #81C784; /* Green for Booking */
            --white: #ffffff;
            --gray: #666;
        }
        body { font-family: 'Inter', sans-serif; background-color: var(--bg-color); margin: 0; padding: 20px; color: var(--primary); }
        
        /* HEADER */
        .header { padding: 20px 100px; display: flex; justify-content: space-between; align-items: center; background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .nav-links a { text-decoration: none; color: #00313e; font-weight: 500; margin: 0 15px; transition: 0.3s; }
        .logo { display: flex; align-items: center; gap: 10px; font-weight: 800; color: #00313e; font-size: 24px; text-decoration: none; }
        .logo img { height: 40px; }

        .container { max-width: 950px; margin: 40px auto; }

        /* BACK BUTTON */
        .btn-back { display: inline-flex; align-items: center; gap: 8px; text-decoration: none; color: #666; font-weight: 600; margin-bottom: 20px; transition: 0.2s; }
        .btn-back:hover { color: var(--primary); transform: translateX(-5px); }

        /* MAIN CARD */
        .profile-card {
            background: white; border-radius: 20px; padding: 50px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05); position: relative;
        }

        /* PROFILE HEADER GRID */
        .profile-header { display: grid; grid-template-columns: 280px 1fr; gap: 50px; margin-bottom: 40px; }

        .profile-img {
            width: 100%; height: 320px; object-fit: cover; border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .info-list { display: flex; flex-direction: column; gap: 18px; justify-content: center; }
        .info-row { display: grid; grid-template-columns: 140px 1fr; align-items: baseline; }
        .label { font-weight: 700; color: var(--primary); font-size: 15px; }
        .value { font-weight: 500; color: #444; font-size: 16px; line-height: 1.5; }

        /* --- NEW: BOOKING BUTTON --- */
        .btn-book-now {
            margin-top: 25px;
            background-color: var(--success);
            color: white;
            text-decoration: none;
            padding: 15px 30px;
            border-radius: 50px;
            font-weight: 700;
            font-size: 16px;
            display: inline-flex; align-items: center; gap: 10px;
            width: fit-content;
            box-shadow: 0 4px 15px rgba(76, 175, 80, 0.3);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-book-now:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(76, 175, 80, 0.4);
            background-color: #66BB6A;
        }

        /* SECTIONS */
        .bio-section { 
            border-top: 2px solid #f5f5f5; padding-top: 30px; margin-top: 30px;
            font-size: 16px; line-height: 1.8; color: #444; 
        }

        .quote-box {
            margin-top: 40px; background: #FFF8E7; padding: 30px; border-radius: 12px;
            text-align: center; font-style: italic; color: var(--primary); font-weight: 500; font-size: 18px;
            border-left: 5px solid var(--accent);
        }
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
        <a href="${pageContext.request.contextPath}/counseling/browse" class="btn-back">
            <i class="fas fa-arrow-left"></i> Back to Counselors
        </a>

        <div class="profile-card">

            <div class="profile-header">
                <img src="${not empty c.imageUrl ? c.imageUrl : 'https://via.placeholder.com/300'}" alt="${c.name}" class="profile-img">

                <div class="info-list">
                    <h1 style="margin: 0 0 10px 0; font-size: 32px;">${c.name}</h1>
                    
                    <div class="info-row"><span class="label">Education:</span> <span class="value">${c.education}</span></div>
                    <div class="info-row"><span class="label">University:</span> <span class="value">${c.university}</span></div>
                    <div class="info-row"><span class="label">Languages:</span> <span class="value">${c.languages}</span></div>
                    <div class="info-row"><span class="label">Location:</span> <span class="value">${c.location}</span></div>
                    <div class="info-row"><span class="label">Email:</span> <span class="value">${c.email}</span></div>

                    <a href="${pageContext.request.contextPath}/counseling/booking?preselected=${c.name}" class="btn-book-now">
                        <i class="far fa-calendar-check"></i> Book Appointment
                    </a>
                </div>
            </div>

            <div class="bio-section">
                <h3>About Me</h3>
                ${c.bio}
            </div>

            <div class="quote-box">
                “${c.quote}”
            </div>
        </div>
    </div>

</body>
</html>