<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;      /* Beige Background */
            --text-dark: #003049;     /* Dark Navy */
            --text-blue: #2F80ED;     /* Bright Blue for values */
            --card-bg: #FDF3E7;       /* Lighter beige for the card */
            --btn-dark: #003B46;      /* Dark Teal for Edit button */
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
            color: var(--text-dark);
        }

        /* Header Navigation */
        .header {
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
        }

        .nav-left,
        .nav-right {
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            flex: 1;
            gap: 0;
        }

        .nav-left a, .nav-right a {
            text-decoration: none;
            color: #00313e;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-left a:hover, .nav-right a:hover {
            color: #0d4e57;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 700;
            color: #00313e;
            font-size: 32px;
            text-decoration: none;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        /* Main Layout */
        .container {
            max-width: 1000px;
            margin: 40px auto;
            background-color: var(--card-bg); /* The lighter card background */
            border-radius: 50px; /* Big rounded corners */
            padding: 60px 80px;
            position: relative;
            min-height: 500px;
        }

        /* Back Button Arrow */
        .back-btn {
            position: absolute;
            top: 40px;
            left: 40px;
            font-size: 32px;
            text-decoration: none;
            color: #000;
            cursor: pointer;
        }

        /* Grid Layout */
        .profile-layout {
            display: flex;
            gap: 60px;
            align-items: flex-start;
            margin-top: 20px;
        }

        /* Profile Icon */
        .profile-icon {
            width: 150px;
            height: 150px;
            border: 6px solid #000; /* Bold outline */
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 80px; /* Size of the icon inside */
        }

        /* Text Details */
        .details-section {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 25px; /* Spacing between rows */
        }

        .row {
            display: flex;
            align-items: center;
            font-size: 20px;
        }

        /* Label Styles */
        .label {
            font-weight: 800;
            color: var(--text-dark);
            margin-right: 10px;
        }

        /* Value Styles */
        .value {
            font-weight: 700;
            color: var(--text-blue);
        }

        /* Special Layout for the Top Row (Name + ID) */
        .top-row {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }

        /* Edit Button */
        .btn-edit {
            background-color: var(--btn-dark);
            color: white;
            width: 300px;
            padding: 15px;
            border-radius: 30px;
            font-size: 18px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            display: block;
            margin: 60px auto 0 auto; /* Center at bottom */
            transition: 0.2s;
        }
        .btn-edit:hover { opacity: 0.9; }

    </style>
</head>
<body>

<!-- Header Navigation -->
    <div class="header">
        <div class="nav-left">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/learning">Learning</a>
        </div>
        
        <a href="${pageContext.request.contextPath}/home" class="logo">
            <div class="logo-icon">
                <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
            </div>
            <span>MindLink</span>
        </a>
        
        <div class="nav-right">
            <a href="${pageContext.request.contextPath}/forum/welcome">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <div class="container">
        <a href="/home" class="back-btn">
            <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M9 14L4 9l5-5"/> <path d="M4 9h10c4 0 7 3 7 7v1"/> </svg>
        </a>

        <div class="profile-layout">
            
            <div>
                <div class="profile-icon">
                    <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                </div>
            </div>

            <div class="details-section">
                
                <div class="top-row">
                    <div class="row">
                        <span class="label">Full Name :</span>
                        <span class="value">${p.fullName}</span>
                    </div>
                    <div class="row">
                        <span class="label">Student ID :</span>
                        <span class="value">${p.studentId}</span>
                    </div>
                </div>

                <div class="row">
                    <span class="label">Age :</span>
                    <span class="value">${p.age}</span>
                </div>

                <div class="row">
                    <span class="label">Email Address :</span>
                    <span class="value">${p.email}</span>
                </div>

                <div class="row">
                    <span class="label">Phone Number :</span>
                    <span class="value">${p.phoneNumber}</span>
                </div>

                <div class="row">
                    <span class="label">Faculty :</span>
                    <span class="value">${p.faculty}</span>
                </div>

            </div>
        </div>

        <button class="btn-edit">Edit</button>

    </div>

</body>
</html>