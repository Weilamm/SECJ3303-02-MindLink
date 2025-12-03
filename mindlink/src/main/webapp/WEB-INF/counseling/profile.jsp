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
        
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 40px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); margin: 0 15px; font-weight: 500; }
        .logo { font-size: 28px; font-weight: 800; }

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