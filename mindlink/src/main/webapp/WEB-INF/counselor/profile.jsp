<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-orange: #F77F00;
            --btn-hover: #D62828;
            --input-border: #E0E0E0;
            --input-focus: #F77F00;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            background-image: 
                radial-gradient(circle at 10% 20%, rgba(247, 127, 0, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 90% 80%, rgba(72, 201, 176, 0.1) 0%, transparent 50%);
            margin: 0; min-height: 100vh;
            color: var(--text-dark);
            position: relative; overflow-x: hidden;
        }

        /* 🟢 ANIMATED BLOBS */
        .blob {
            position: absolute; filter: blur(50px); z-index: -1; opacity: 0.6;
            animation: float 10s ease-in-out infinite;
        }
        .blob-1 {
            top: -100px; left: -100px; width: 500px; height: 500px;
            background: rgba(247, 127, 0, 0.15); border-radius: 40% 60% 70% 30%;
        }
        .blob-2 {
            bottom: -150px; right: -100px; width: 600px; height: 600px;
            background: rgba(72, 201, 176, 0.15); border-radius: 60% 40% 30% 70%;
            animation-direction: reverse;
        }
        @keyframes float {
            0% { transform: translate(0, 0) rotate(0deg); }
            50% { transform: translate(30px, 20px) rotate(5deg); }
            100% { transform: translate(0, 0) rotate(0deg); }
        }

        /* --- Navbar --- */
        .navbar {
            background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(15px);
            padding: 15px 50px; display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 4px 20px rgba(0,0,0,0.03); position: sticky; top: 0; z-index: 100;
        }
        .nav-center-logo {
            font-size: 24px; font-weight: 800; color: var(--text-dark);
            display: flex; align-items: center; gap: 10px; text-decoration: none;
        }
        .nav-links { display: flex; gap: 30px; }
        .nav-links a {
            text-decoration: none; color: #555; font-weight: 600; font-size: 16px; transition: color 0.2s;
        }
        .nav-links a:hover, .nav-links a.active-link { color: var(--text-dark); }
        .btn-logout { color: #D62828 !important; }

        /* --- Container --- */
        .container {
            max-width: 1000px; margin: 40px auto 80px; padding: 0 20px;
            display: grid; grid-template-columns: 300px 1fr; gap: 30px;
        }

        /* --- Sidebar --- */
        .profile-sidebar {
            background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(10px);
            border-radius: 20px; padding: 40px 30px; text-align: center;
            height: fit-content; box-shadow: 0 8px 30px rgba(0,0,0,0.06);
            position: sticky; top: 100px; border: 1px solid rgba(255,255,255,0.5);
        }

        .profile-img {
            width: 140px; height: 140px; border-radius: 50%; object-fit: cover;
            border: 4px solid #FFF4E6; box-shadow: 0 4px 10px rgba(0,0,0,0.1); margin-bottom: 20px;
        }

        .sidebar-name { font-size: 22px; font-weight: 800; margin-bottom: 5px; color: var(--text-dark); }
        .sidebar-role { color: #666; font-size: 14px; font-weight: 500; margin-bottom: 25px; }

        .stat-row {
            display: flex; justify-content: center; gap: 20px;
            padding-top: 20px; border-top: 1px solid #eee;
        }
        .stat-item { text-align: center; }
        .stat-val { font-weight: 800; font-size: 18px; display: block; }
        .stat-label { font-size: 12px; color: #888; text-transform: uppercase; font-weight: 600; }

        /* --- Edit Card --- */
        .edit-card {
            background: rgba(255, 255, 255, 0.95); border-radius: 20px; padding: 40px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.06);
        }

        .form-title { font-size: 24px; font-weight: 800; margin-bottom: 30px; color: var(--text-dark); }
        .section-header {
            font-size: 16px; font-weight: 700; color: var(--text-dark);
            margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #FFF0E5;
            display: flex; align-items: center; gap: 10px;
        }

        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 30px; }
        .form-group { margin-bottom: 5px; }
        .form-group.full-width { grid-column: span 2; }

        label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; color: #555; text-transform: uppercase; }
        input, textarea {
            width: 100%; padding: 12px 15px; border-radius: 12px;
            border: 1px solid var(--input-border); font-family: 'Inter', sans-serif;
            font-size: 15px; box-sizing: border-box; transition: 0.2s; background: #FAFAFA;
        }
        input:focus, textarea:focus {
            outline: none; border-color: var(--input-focus); background: #FFF;
            box-shadow: 0 0 0 4px rgba(247, 127, 0, 0.1);
        }

        .btn-save {
            background-color: var(--btn-orange); color: white; border: none;
            padding: 15px 40px; border-radius: 50px; font-size: 16px; font-weight: 700;
            cursor: pointer; transition: 0.2s; display: block; width: 100%; margin-top: 10px;
            box-shadow: 0 4px 10px rgba(247, 127, 0, 0.3);
        }
        .btn-save:hover { background-color: var(--btn-hover); transform: translateY(-2px); }

        /* 🟢 SUCCESS MODAL STYLES */
        .modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5); z-index: 999;
            display: none; justify-content: center; align-items: center;
            backdrop-filter: blur(5px);
        }

        .success-modal {
            background: white; padding: 40px; border-radius: 20px;
            text-align: center; max-width: 400px; width: 90%;
            box-shadow: 0 20px 50px rgba(0,0,0,0.2);
            animation: popIn 0.3s ease-out;
        }

        .success-icon {
            width: 80px; height: 80px; background: #D1FAE5; color: #10B981;
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            font-size: 40px; margin: 0 auto 20px;
        }

        .success-title { font-size: 24px; font-weight: 800; color: #064E3B; margin-bottom: 10px; }
        .success-desc { color: #666; margin-bottom: 20px; }
        .redirect-text { font-size: 13px; color: #999; font-style: italic; }

        @keyframes popIn {
            0% { transform: scale(0.8); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

    </style>
</head>
<body>

    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>

    <c:if test="${not empty param.success}">
        <div class="modal-overlay" id="successModal" style="display: flex;">
            <div class="success-modal">
                <div class="success-icon"><i class="fas fa-check"></i></div>
                <div class="success-title">Profile Updated!</div>
                <div class="success-desc">Your changes have been saved successfully.</div>
                <div class="redirect-text">Redirecting to Dashboard in <span id="countdown">3</span>s...</div>
            </div>
        </div>
        <script>
            let seconds = 3;
            const countdownEl = document.getElementById('countdown');
            const interval = setInterval(() => {
                seconds--;
                countdownEl.innerText = seconds;
                if (seconds <= 0) {
                    clearInterval(interval);
                    window.location.href = "${pageContext.request.contextPath}/counselor/dashboard";
                }
            }, 1000);
        </script>
    </c:if>

    <nav class="navbar">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/dashboard">Home</a>
            <a href="${pageContext.request.contextPath}/counselor/appointments">Appointment</a>
        </div>
        <a href="#" class="nav-center-logo">
            <i class="fas fa-heart" style="color: #F77F00;"></i> MindLink
        </a>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/counselor/profile" class="active-link">Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a>
        </div>
    </nav>

    <div class="container">
        <div class="profile-sidebar">
            <img src="${not empty sessionScope.loggedInCounselor.imageUrl ? pageContext.request.contextPath.concat(sessionScope.loggedInCounselor.imageUrl) : 'https://via.placeholder.com/150'}" 
                 alt="Profile" class="profile-img">
            <div class="sidebar-name">${sessionScope.loggedInCounselor.name}</div>
            <div class="sidebar-role">Licensed Counselor</div>
            <div class="stat-row">
                <div class="stat-item"><span class="stat-val">#${sessionScope.loggedInCounselor.id}</span><span class="stat-label">ID</span></div>
                <div class="stat-item"><span class="stat-val">Active</span><span class="stat-label">Status</span></div>
            </div>
        </div>

        <div class="edit-card">
            <h2 class="form-title">Edit Profile</h2>
            
            <form action="${pageContext.request.contextPath}/counselor/updateProfile" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${sessionScope.loggedInCounselor.id}">

                <div class="section-header">
                    <i class="far fa-user"></i> Personal Information
                </div>
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
                        <label>Location</label>
                        <input type="text" name="location" value="${sessionScope.loggedInCounselor.location}">
                    </div>
                </div>

                <div class="section-header">
                    <i class="fas fa-graduation-cap"></i> Professional Details
                </div>
                <div class="form-grid">
                    <div class="form-group">
                        <label>University</label>
                        <input type="text" name="university" value="${sessionScope.loggedInCounselor.university}" placeholder="e.g. University of Malaya">
                    </div>
                    <div class="form-group">
                        <label>Degree / Qualification</label>
                        <input type="text" name="education" value="${sessionScope.loggedInCounselor.education}" placeholder="e.g. Masters in Psychology">
                    </div>
                    <div class="form-group full-width">
                        <label>Languages Spoken</label>
                        <input type="text" name="languages" value="${sessionScope.loggedInCounselor.languages}" placeholder="e.g. English, Malay, Mandarin">
                    </div>
                </div>

                <div class="section-header">
                    <i class="fas fa-id-card"></i> Public Profile
                </div>
                <div class="form-group" style="margin-bottom: 20px;">
                    <label>Profile Image</label>
                    <div style="background: #FAFAFA; padding: 10px; border-radius: 12px; border: 1px solid #E0E0E0;">
                        <input type="file" name="imageFile" accept="image/*" style="border: none; background: transparent; width: 100%;">
                    </div>
                    <small style="color: #888; font-size: 12px; margin-top: 5px; display: block;">
                        Recommended: Square image (JPG/PNG), max 2MB.
                    </small>
                    <input type="hidden" name="existingImage" value="${sessionScope.loggedInCounselor.imageUrl}">
                </div>

                <div class="form-group" style="margin-bottom: 20px;">
                    <label>Favorite Quote</label>
                    <input type="text" name="quote" value="${sessionScope.loggedInCounselor.quote}">
                </div>
                <div class="form-group" style="margin-bottom: 20px;">
                    <label>Bio / About Me</label>
                    <textarea name="bio" rows="4">${sessionScope.loggedInCounselor.bio}</textarea>
                </div>

                <button type="submit" class="btn-save">Save Changes</button>
            </form>
        </div>
    </div>

</body>
</html>