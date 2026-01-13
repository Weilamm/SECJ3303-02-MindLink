<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --bg-peach: #FFF0E5;       
            --text-dark: #003B46;      
            --text-body: #666;         
            --card-white: #FFFFFF;
            --btn-orange: #FF9F1C;     
            --btn-hover: #E68A00;
        }

        body {
            font-family: 'Quicksand', sans-serif;
            background-color: var(--bg-peach);
            margin: 0;
            color: var(--text-dark);
        }

        /* --- Navbar (Same as Dashboard) --- */
        .navbar {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 15px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 4px 20px rgba(0,0,0,0.02);
        }

        .nav-center-logo {
            font-size: 24px; font-weight: 700; color: var(--text-dark);
            position: absolute; left: 50%; transform: translateX(-50%);
            display: flex; align-items: center; gap: 10px;
        }

        .nav-links { display: flex; gap: 40px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); font-weight: 700; font-size: 16px; position: relative; }
        .nav-links a:hover { color: var(--btn-orange); }

        /* --- Profile Layout --- */
        .container {
            max-width: 900px;
            margin: 40px auto 80px;
            padding: 0 20px;
            display: grid;
            grid-template-columns: 280px 1fr; /* Sidebar + Form */
            gap: 30px;
        }

        /* Left Sidebar: Photo & Basics */
        .profile-sidebar {
            background: var(--card-white);
            border-radius: 20px;
            padding: 30px;
            text-align: center;
            height: fit-content;
            box-shadow: 0 5px 15px rgba(0,0,0,0.03);
        }

        .profile-img {
            width: 150px; height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #FFE0B2;
            margin-bottom: 15px;
        }

        .sidebar-name { font-size: 20px; font-weight: 700; margin-bottom: 5px; }
        .sidebar-role { color: var(--text-body); font-size: 14px; margin-bottom: 20px; }

        /* Right Side: Edit Form */
        .edit-card {
            background: var(--card-white);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.03);
        }

        .section-header {
            font-size: 18px; font-weight: 700; color: var(--text-dark);
            margin-bottom: 20px; padding-bottom: 10px;
            border-bottom: 2px solid #FFF0E5;
        }

        .form-grid {
            display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 30px;
        }

        .form-group { margin-bottom: 15px; }
        .form-group.full-width { grid-column: span 2; }

        label { display: block; font-size: 14px; font-weight: 600; margin-bottom: 8px; color: var(--text-dark); }
        
        input, textarea, select {
            width: 100%;
            padding: 12px 15px;
            border-radius: 12px;
            border: 2px solid #F3F4F6;
            font-family: 'Quicksand', sans-serif;
            font-size: 15px;
            box-sizing: border-box; /* Fixes padding issues */
            transition: 0.2s;
        }

        input:focus, textarea:focus {
            outline: none; border-color: var(--btn-orange); background: #FFFBF5;
        }

        .btn-save {
            background-color: var(--btn-orange);
            color: white;
            border: none;
            padding: 15px 40px;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
            display: block;
            width: 100%;
        }
        .btn-save:hover { background-color: var(--btn-hover); transform: translateY(-2px); }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/dashboard">Home</a>
            <a href="${pageContext.request.contextPath}/counselor/appointments">Appointment</a>
        </div>

        <div class="nav-center-logo">
            <i class="fas fa-heart"></i> MindLink
        </div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/profile">Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a>
        </div>
    </nav>

    <div class="container">
        <div class="profile-sidebar">
            <img src="${not empty sessionScope.loggedInCounselor.imageUrl ? sessionScope.loggedInCounselor.imageUrl : 'https://via.placeholder.com/150'}" 
                 alt="Profile" class="profile-img">
            
            <div class="sidebar-name">${sessionScope.loggedInCounselor.name}</div>
            <div class="sidebar-role">Licensed Counselor</div>
            
            <div style="margin-top: 20px; font-size: 13px; color: #999;">
                ID: ${sessionScope.loggedInCounselor.id}
            </div>
        </div>

        <div class="edit-card">
            <form action="${pageContext.request.contextPath}/counselor/updateProfile" method="post">
                
                <input type="hidden" name="id" value="${sessionScope.loggedInCounselor.id}">

                <div class="section-header">Personal Information</div>
                <div class="form-grid">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="name" value="${sessionScope.loggedInCounselor.name}" required>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" value="${sessionScope.loggedInCounselor.email}" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" value="${sessionScope.loggedInCounselor.password}" required>
                    </div>
                    <div class="form-group">
                        <label>Location / City</label>
                        <input type="text" name="location" value="${sessionScope.loggedInCounselor.location}">
                    </div>
                </div>

                <div class="section-header">Professional Details</div>
                <div class="form-grid">
                    <div class="form-group">
                        <label>University / Alma Mater</label>
                        <input type="text" name="university" value="${sessionScope.loggedInCounselor.university}">
                    </div>
                    <div class="form-group">
                        <label>Degree / Education</label>
                        <input type="text" name="education" value="${sessionScope.loggedInCounselor.education}" placeholder="e.g. PhD in Psychology">
                    </div>
                    <div class="form-group full-width">
                        <label>Languages Spoken</label>
                        <input type="text" name="languages" value="${sessionScope.loggedInCounselor.languages}" placeholder="e.g. English, Mandarin, Malay">
                    </div>
                </div>

                <div class="section-header">Public Profile</div>
                <div class="form-group">
                    <label>Profile Image URL</label>
                    <input type="text" name="imageUrl" value="${sessionScope.loggedInCounselor.imageUrl}" placeholder="https://...">
                </div>
                <div class="form-group">
                    <label>Favorite Quote</label>
                    <input type="text" name="quote" value="${sessionScope.loggedInCounselor.quote}" placeholder="A short uplifting quote...">
                </div>
                <div class="form-group">
                    <label>Bio / About Me</label>
                    <textarea name="bio" rows="4" placeholder="Tell students about your approach...">${sessionScope.loggedInCounselor.bio}</textarea>
                </div>

                <button type="submit" class="btn-save">Save Changes</button>
            </form>
        </div>
    </div>

</body>
</html>