<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Successful</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --success-green: #96DFA6; /* Light green for text */
            --btn-yellow: #F6D776;
            --btn-green: #90EE90;
            --btn-red: #F497AA;
            --card-bg: #FFFFFF;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
            color: var(--text-dark);
        }

        /* Navbar */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 40px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); margin: 0 15px; font-weight: 500; }
        .logo { font-size: 28px; font-weight: 800; color: var(--text-dark); }

        /* Main Container */
        .main-container { max-width: 900px; margin: 40px auto; }
        
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 5px; }
        .subtitle { 
            color: #8CC63F; /* Greenish text from screenshot */
            font-size: 18px; 
            font-weight: 700;
            margin-bottom: 30px; 
        }

        /* Card Styling */
        .success-card {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        }

        .confirmation-text {
            font-size: 16px; margin-bottom: 40px; color: #333;
        }

        /* Details Grid */
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 50px;
        }
        
        .detail-row { margin-bottom: 15px; font-size: 15px; }
        .label { font-weight: 500; color: #333; }
        .value { font-weight: 600; color: #000; margin-left: 5px; }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 30px;
            border: none;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            color: #000;
        }

        .btn-reschedule { background-color: var(--btn-yellow); }
        .btn-confirm { background-color: var(--btn-green); }
        .btn-cancel { background-color: var(--btn-red); }

        .btn:hover { opacity: 0.9; transform: translateY(-2px); transition: 0.2s; }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="/">Home</a>
            <a href="/learning">Learning</a>
        </div>
        <div class="logo">❤️ MindLink</div>
        <div class="nav-links">
            <a href="#">Forum</a>
            <a href="#">Profile</a>
        </div>
    </nav>

    <div class="main-container">
        <h1>Appointment Details</h1>
        <div class="subtitle">Booking Succesful!</div>

        <div class="success-card">
            <p class="confirmation-text">
                Your counseling session has been booked successfully.
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
                        <span class="value">${venue}</span>
                    </div>
                    <div class="detail-row">
                        <span class="label">Time:</span>
                        <span class="value">${time}</span>
                    </div>
                </div>
            </div>

            <div class="action-buttons">
                <a href="/counseling/booking" class="btn btn-reschedule">
                    Reschedule 📅
                </a>
                
                <a href="/counseling" class="btn btn-confirm">
                    Confirm ✅
                </a>

                <a href="/counseling/booking/cancel?id=${bookingId}" 
                class="btn btn-cancel" 
                onclick="return confirm('Are you sure you want to cancel this booking?');">
                    Cancel ❌
                </a>
            </div>

        </div>
    </div>

</body>
</html>