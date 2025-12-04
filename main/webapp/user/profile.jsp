<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', 'DM Sans', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            min-height: 100vh;
            overflow-x: hidden;
            margin: 0;
            padding-top: 91px;
        }

        .container {
            max-width: 1254px;
            margin: 0 auto;
            position: relative;
        }

        /* Header Styles */
        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 91px;
            background: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            z-index: 100;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 50px;
            height: 100%;
        }

        .logo {
            font-size: 50px;
            font-weight: bold;
            color: #2c5f5d;
            letter-spacing: 0.5px;
            display: inline-flex;
            align-items: center;
            gap: 12px;
        }

        .logo-icon {
            width: 56px;
            height: 56px;
            object-fit: contain;
            display: inline-block;
            vertical-align: middle;
        }

        nav {
            display: flex;
            gap: 40px;
            align-items: center;
        }

        .nav-link {
            color: #2c5f5d;
            text-decoration: none;
            font-size: 18px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #4ac1c0;
        }

        .nav-link.active {
            color: #4ac1c0;
            font-weight: 600;
        }

        /* Main Content */
        .main-content {
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            min-height: calc(100vh - 91px);
            padding: 40px 63px;
            position: relative;
        }

        .back-button {
            background: none;
            border: none;
            font-size: 32px;
            color: #2c5f5d;
            cursor: pointer;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .back-button:hover {
            transform: translateX(-5px);
        }

        /* Profile Card */
        .profile-card {
            background: white;
            border-radius: 28px;
            padding: 50px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            max-width: 900px;
            margin: 0 auto;
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 40px;
            margin-bottom: 50px;
            padding-bottom: 30px;
            border-bottom: 2px solid #f0f0f0;
        }

        .profile-image-container {
            position: relative;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #4ac1c0;
            box-shadow: 0 4px 15px rgba(74, 193, 192, 0.3);
        }

        .profile-info-header {
            flex: 1;
        }

        .profile-name {
            font-size: 36px;
            font-weight: bold;
            color: #102d47;
            margin-bottom: 10px;
        }

        .profile-role {
            font-size: 18px;
            color: #4ac1c0;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .edit-btn {
            background: #2c5f5d;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .edit-btn:hover {
            background: #1f4544;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(44, 95, 93, 0.3);
        }

        /* Profile Details */
        .profile-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .detail-label {
            font-size: 14px;
            font-weight: 600;
            color: #666;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .detail-value {
            font-size: 18px;
            color: #102d47;
            font-weight: 500;
            padding: 12px 15px;
            background: #f8f9fa;
            border-radius: 10px;
            border-left: 3px solid #4ac1c0;
        }

        .detail-item.full-width {
            grid-column: 1 / -1;
        }

        /* Edit Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: white;
            border-radius: 20px;
            padding: 40px;
            max-width: 600px;
            width: 90%;
            max-height: 80vh;
            overflow-y: auto;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .modal-title {
            font-size: 28px;
            font-weight: bold;
            color: #102d47;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 28px;
            color: #666;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .close-btn:hover {
            color: #102d47;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #666;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 16px;
            font-family: inherit;
            transition: border-color 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: #4ac1c0;
        }

        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            flex: 1;
            padding: 12px 20px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: #2c5f5d;
            color: white;
        }

        .btn-primary:hover {
            background: #1f4544;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: #e0e0e0;
            color: #666;
        }

        .btn-secondary:hover {
            background: #d0d0d0;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .header-content {
                padding: 0 30px;
            }

            .main-content {
                padding: 30px 40px;
            }
        }

        @media (max-width: 768px) {
            .logo {
                font-size: 32px;
            }

            nav {
                gap: 15px;
            }

            .nav-link {
                font-size: 14px;
            }

            .profile-card {
                padding: 30px 20px;
            }

            .profile-header {
                flex-direction: column;
                text-align: center;
            }

            .profile-name {
                font-size: 28px;
            }

            .profile-details {
                grid-template-columns: 1fr;
            }

            .modal-content {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <%
        // Sample user data - replace with actual session data
        String fullName = "Karen Voon";
        String studentId = "A23CS0111";
        String age = "21";
        String email = "a@graduate.utm.my";
        String phone = "+60123456789";
        String faculty = "Faculty of Computing";
    %>

    <div class="container">
        <header>
            <div class="header-content">
                <h1 class="logo">
                    <img src="images/mindlink.png" alt="Mindlink logo" class="logo-icon">
                    <span class="logo-text">Mindlink</span>
                </h1>
                <nav>
                    <a href="home.jsp" class="nav-link">Home</a>
                    <a href="counseling.jsp" class="nav-link">Counseling</a>
                    <a href="learning.jsp" class="nav-link">Learning</a>
                    <a href="forum.jsp" class="nav-link">Forum</a>
                    <a href="profile.jsp" class="nav-link active">Profile</a>
                    <a href="contact.jsp" class="nav-link">Contact</a>
                </nav>
            </div>
        </header>

        <main class="main-content">
            <button class="back-button" onclick="window.history.back()">
                ← 
            </button>

            <!-- Profile Card -->
            <div class="profile-card">
                <div class="profile-header">
                    <div class="profile-image-container">
                        <img 
                            src="images/profile-avatar.jpg" 
                            alt="Profile Picture" 
                            class="profile-image"
                            onerror="this.src='https://via.placeholder.com/150/4ac1c0/ffffff?text=KV'"
                        >
                    </div>
                    <div class="profile-info-header">
                        <h2 class="profile-name" id="displayName"><%= fullName %></h2>
                        <p class="profile-role">Student</p>
                        <button class="edit-btn" onclick="openEditModal()">
                            <span>✎</span> Edit Profile
                        </button>
                    </div>
                </div>

                <!-- Profile Details -->
                <div class="profile-details">
                    <div class="detail-item">
                        <span class="detail-label">Full Name</span>
                        <span class="detail-value" id="displayFullName"><%= fullName %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Student ID</span>
                        <span class="detail-value" id="displayStudentId"><%= studentId %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Age</span>
                        <span class="detail-value" id="displayAge"><%= age %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Phone Number</span>
                        <span class="detail-value" id="displayPhone"><%= phone %></span>
                    </div>
                    <div class="detail-item full-width">
                        <span class="detail-label">Email Address</span>
                        <span class="detail-value" id="displayEmail"><%= email %></span>
                    </div>
                    <div class="detail-item full-width">
                        <span class="detail-label">Faculty</span>
                        <span class="detail-value" id="displayFaculty"><%= faculty %></span>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Edit Profile Modal -->
    <div class="modal" id="editModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Edit Profile</h3>
                <button class="close-btn" onclick="closeEditModal()">×</button>
            </div>
            <form id="editForm" onsubmit="saveProfile(event)">
                <div class="form-group">
                    <label class="form-label" for="editFullName">Full Name</label>
                    <input type="text" class="form-input" id="editFullName" value="<%= fullName %>" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="editStudentId">Student ID</label>
                    <input type="text" class="form-input" id="editStudentId" value="<%= studentId %>" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label" for="editAge">Age</label>
                    <input type="number" class="form-input" id="editAge" value="<%= age %>" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="editPhone">Phone Number</label>
                    <input type="tel" class="form-input" id="editPhone" value="<%= phone %>" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="editEmail">Email Address</label>
                    <input type="email" class="form-input" id="editEmail" value="<%= email %>" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="editFaculty">Faculty</label>
                    <input type="text" class="form-input" id="editFaculty" value="<%= faculty %>" required>
                </div>
                <div class="form-actions">
                    <button type="button" class="btn btn-secondary" onclick="closeEditModal()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Open edit modal
        function openEditModal() {
            document.getElementById('editModal').classList.add('active');
        }

        // Close edit modal
        function closeEditModal() {
            document.getElementById('editModal').classList.remove('active');
        }

        // Close modal when clicking outside
        document.getElementById('editModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeEditModal();
            }
        });

        // Save profile
        function saveProfile(event) {
            event.preventDefault();
            
            // Get form values
            const fullName = document.getElementById('editFullName').value;
            const age = document.getElementById('editAge').value;
            const phone = document.getElementById('editPhone').value;
            const email = document.getElementById('editEmail').value;
            const faculty = document.getElementById('editFaculty').value;
            
            // Update display
            document.getElementById('displayName').textContent = fullName;
            document.getElementById('displayFullName').textContent = fullName;
            document.getElementById('displayAge').textContent = age;
            document.getElementById('displayPhone').textContent = phone;
            document.getElementById('displayEmail').textContent = email;
            document.getElementById('displayFaculty').textContent = faculty;
            
            // In production, send to server
            const formData = new URLSearchParams();
            formData.append('action', 'updateProfile');
            formData.append('fullName', fullName);
            formData.append('age', age);
            formData.append('phone', phone);
            formData.append('email', email);
            formData.append('faculty', faculty);
            
            fetch('profileServlet', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log('Profile updated:', data);
                closeEditModal();
                
                // Show success message
                alert('Profile updated successfully!');
            })
            .catch(error => {
                console.error('Error updating profile:', error);
                alert('Profile updated locally. (Server connection not available)');
                closeEditModal();
            });
        }

        // Close modal with Escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeEditModal();
            }
        });
    </script>
</body>
</html>