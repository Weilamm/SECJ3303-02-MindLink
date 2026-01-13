<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${c.name} - Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root { --bg-color: #FFF3E0; --text-dark: #003049; }
        body { font-family: 'Inter', sans-serif; background-color: var(--bg-color); margin: 0; padding: 20px; color: var(--text-dark); }
        
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

        .container { max-width: 900px; margin: 60px auto; }

        /* PROFILE LAYOUT */
        .profile-header {
            display: flex;
            gap: 50px;
            margin-bottom: 50px;
        }

        /* 1. PHOTO */
        .profile-img {
            width: 250px;
            height: 300px;
            object-fit: cover;
            border-radius: 4px;
            background-color: #ddd;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        /* 2. DETAILS */
        .info-list { display: flex; flex-direction: column; gap: 15px; justify-content: center; }
        .info-item { font-size: 16px; }
        .label { font-weight: 800; color: #000; margin-right: 5px; }
        .value { font-weight: 600; color: #333; }

        /* 3. BIO & QUOTE */
        .bio-section { margin-top: 40px; line-height: 1.8; font-size: 16px; color: #222; }
        .quote {
            margin-top: 40px;
            font-style: italic;
            color: #555;
            text-align: center;
            font-size: 15px;
            padding: 0 50px;
        }

        .btn-back {
            display: inline-block; margin-bottom: 30px;
            text-decoration: none; color: #555; font-weight: 600;
        }
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
        
        <a href="/counseling/browse" class="btn-back">&larr; Back to List</a>

        <div class="profile-header">
            <img src="${c.imageUrl}" alt="${c.name}" class="profile-img">

            <div class="info-list">
                <div class="info-item"><span class="label">Full Name:</span> <span class="value">${c.name}</span></div>
                <div class="info-item"><span class="label">Education:</span> <span class="value">${c.education}</span></div>
                <div class="info-item"><span class="label">Psychology:</span> <span class="value">${c.university}</span></div>
                <div class="info-item"><span class="label">Languages:</span> <span class="value">${c.languages}</span></div>
                <div class="info-item"><span class="label">Office Location:</span> <span class="value">${c.location}</span></div>
                <div class="info-item"><span class="label">Email:</span> <span class="value">${c.email}</span></div>
            </div>
        </div>

        <div class="bio-section">
            ${c.bio}
        </div>

        <div class="quote">
            “${c.quote}”
        </div>

    </div>

</body>
</html>