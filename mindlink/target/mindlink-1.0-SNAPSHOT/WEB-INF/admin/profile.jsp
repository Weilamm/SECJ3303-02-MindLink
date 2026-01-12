<style>
    body {
        background-color: #FFF8E1; /* Your current beige background */
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .profile-container {
        max-width: 800px;
        margin: 50px auto;
        background: white;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }
    .profile-header {
        text-align: center;
        margin-bottom: 30px;
    }
    .profile-icon {
        width: 100px;
        height: 100px;
        background-color: #004D40; /* Dark Teal */
        color: white;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 40px;
        margin: 0 auto 15px;
    }
    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        color: #666;
        margin-bottom: 5px;
        font-size: 0.9em;
        font-weight: bold;
    }
    .form-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 1em;
        background-color: #f9f9f9;
    }
    .form-group input:focus {
        border-color: #004D40;
        outline: none;
        background-color: white;
    }
    .btn-container {
        margin-top: 30px;
        display: flex;
        justify-content: center;
        gap: 20px;
    }
    .btn {
        padding: 12px 30px;
        border: none;
        border-radius: 25px;
        cursor: pointer;
        font-weight: bold;
        transition: transform 0.2s;
        text-decoration: none; /* For links */
        display: inline-block;
    }
    .btn-save {
        background-color: #004D40;
        color: white;
    }
    .btn-logout {
        background-color: #dc3545; /* Red for logout */
        color: white;
    }
    .btn:hover {
        transform: scale(1.05);
        opacity: 0.9;
    }
</style>

<div class="profile-container">
    <div class="profile-header">
        <div class="profile-icon">
            <i class="fas fa-user"></i> </div>
        <h2>Admin Profile</h2>
        <p style="color: #888;">Manage your personal information</p>
    </div>

    <form action="/admin/profile/update" method="post">
        <div class="form-grid">
            <div class="form-group">
                <label>Admin ID</label>
                <input type="text" name="adminId" value="${admin.adminId}" readonly style="background-color: #e9ecef;">
            </div>

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" value="${admin.name}" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" value="${admin.email}" required>
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" name="phone" value="${admin.phone}">
            </div>

            <div class="form-group">
                <label>Department</label>
                <input type="text" name="department" value="${admin.department}">
            </div>
            
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
            <div class="form-group">
            <label>Password</label>
            <div style="position: relative;">
                <input type="password" id="passwordField" name="password" value="${admin.password}" required 
                        style="padding-right: 40px;"> <span onclick="togglePassword()" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer; color: #666;">
                    <i id="toggleIcon" class="fas fa-eye"></i>
                </span>
            </div>
            </div>
            <script>
            function togglePassword() {
                var passwordInput = document.getElementById("passwordField");
                var icon = document.getElementById("toggleIcon");

                if (passwordInput.type === "password") {
                    passwordInput.type = "text"; // Show password
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash"); // Change icon to 'crossed eye'
                } else {
                    passwordInput.type = "password"; // Hide password
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye"); // Change icon back to 'eye'
                }
            }
            </script>
        </div>

        <div class="btn-container">
            <button type="submit" class="btn btn-save">Save Changes</button>
            <a href="/logout" class="btn btn-logout">Logout</a>
        </div>
    </form>
</div>