<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Admin Module Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', 'DM Sans', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #fff5e6 0%, #ffe4cc 100%);
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
            color: #4ac1c0;
            margin-right: 5px;
        }

        .admin-badge {
            display: inline-block;
            background: #764ba2;
            color: white;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 10px;
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
            background: linear-gradient(135deg, #fff5e6 0%, #ffe4cc 100%);
            min-height: calc(100vh - 91px);
            padding: 40px 63px;
            position: relative;
        }

        /* Page Header */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-title {
            font-size: 36px;
            font-weight: bold;
            color: #102d47;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
        }

        .icon-btn {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            border: 2px solid #e0e0e0;
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 20px;
        }

        .icon-btn:hover {
            border-color: #4ac1c0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(74, 193, 192, 0.3);
        }

        .icon-btn.search { color: #666; }
        .icon-btn.download { color: #4ac1c0; }
        .icon-btn.edit { color: #ff6b6b; }

        /* Learning Module Card */
        .learning-module {
            background: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 25px;
            display: flex;
            gap: 25px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .learning-module:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
        }

        .module-content-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .module-title {
            font-size: 26px;
            font-weight: bold;
            color: #102d47;
            margin-bottom: 12px;
            letter-spacing: -0.5px;
        }

        .module-description {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .module-actions {
            display: flex;
            gap: 12px;
            margin-top: auto;
        }

        .module-btn {
            padding: 10px 20px;
            border-radius: 10px;
            border: none;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-edit {
            background: linear-gradient(135deg, #4ac1c0 0%, #2c5f5d 100%);
            color: white;
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(74, 193, 192, 0.4);
        }

        .btn-delete {
            background: #fff;
            color: #ff6b6b;
            border: 2px solid #ff6b6b;
        }

        .btn-delete:hover {
            background: #ff6b6b;
            color: white;
            transform: translateY(-2px);
        }

        .btn-view {
            background: #f8f9fa;
            color: #666;
            border: 2px solid #e0e0e0;
        }

        .btn-view:hover {
            background: #e9ecef;
            border-color: #ced4da;
        }

        /* Module Status Badge */
        .status-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-active {
            background: #d4edda;
            color: #155724;
        }

        .status-draft {
            background: #fff3cd;
            color: #856404;
        }

        /* Add Module Button */
        .add-module-btn {
            position: fixed;
            bottom: 40px;
            right: 40px;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            font-size: 28px;
            cursor: pointer;
            box-shadow: 0 4px 20px rgba(102, 126, 234, 0.4);
            transition: all 0.3s ease;
            z-index: 50;
        }

        .add-module-btn:hover {
            transform: scale(1.1) rotate(90deg);
            box-shadow: 0 6px 30px rgba(102, 126, 234, 0.6);
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
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
            max-width: 700px;
            width: 90%;
            max-height: 85vh;
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
            font-size: 32px;
            color: #666;
            cursor: pointer;
            transition: color 0.3s ease;
            line-height: 1;
        }

        .close-btn:hover {
            color: #102d47;
        }

        .form-group {
            margin-bottom: 25px;
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

        .form-input,
        .form-textarea,
        .form-select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 16px;
            font-family: inherit;
            transition: border-color 0.3s ease;
        }

        .form-textarea {
            min-height: 120px;
            resize: vertical;
        }

        .form-input:focus,
        .form-textarea:focus,
        .form-select:focus {
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
            padding: 14px 20px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
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

            .page-header {
                flex-direction: column;
                gap: 20px;
                align-items: flex-start;
            }

            .page-title {
                font-size: 28px;
            }

            .learning-module {
                padding: 20px;
            }

            .module-title {
                font-size: 20px;
            }

            .module-actions {
                flex-wrap: wrap;
            }

            .status-badge {
                position: static;
                display: inline-block;
                margin-bottom: 10px;
            }

            .add-module-btn {
                bottom: 20px;
                right: 20px;
            }
        }
    </style>
</head>
<body>
    <%
        String adminUsername = (session.getAttribute("username") != null) 
            ? (String) session.getAttribute("username") 
            : "Admin123";
    %>

    <div class="container">
        <header>
            <div class="header-content">
                <h1 class="logo">
                    <span class="logo-icon">●</span>Mindlink
                    <span class="admin-badge">ADMIN</span>
                </h1>
                <nav>
                    <a href="adminportal.jsp" class="nav-link">Home</a>
                    <a href="adminmodule.jsp" class="nav-link active">Module</a>
                    <a href="adminforum.jsp" class="nav-link">Forum</a>
                    <a href="adminprofile.jsp" class="nav-link">Profile</a>
                    <a href="admincontact.jsp" class="nav-link">Contact</a>
                </nav>
            </div>
        </header>

        <main class="main-content">
            <!-- Page Header -->
            <div class="page-header">
                <h1 class="page-title">Resources</h1>
                <div class="action-buttons">
                    <button class="icon-btn search" title="Search Modules">
                        🔍
                    </button>
                    <button class="icon-btn download" title="Export Modules">
                        📥
                    </button>
                    <button class="icon-btn edit" title="Bulk Edit">
                        ✏️
                    </button>
                </div>
            </div>

            <!-- Module 1: Introduction to Mental Health -->
            <article class="learning-module" data-module-id="1">
                <span class="status-badge status-active">Active</span>
                <div class="module-content-wrapper">
                    <h2 class="module-title">Introduction to Mental Health</h2>
                    <p class="module-description">
                        Learn the basics of mental health, reduce stigma, and understand how emotional well-being affects your daily life and success.
                    </p>
                    <div class="module-actions">
                        <button class="module-btn btn-edit" onclick="editModule(1)">
                            Edit Module
                        </button>
                        <button class="module-btn btn-view" onclick="viewModule(1)">
                            View Details
                        </button>
                        <button class="module-btn btn-delete" onclick="deleteModule(1)">
                            Delete
                        </button>
                    </div>
                </div>
            </article>

            <!-- Module 2: Emotional Awareness and Regulation -->
            <article class="learning-module" data-module-id="2">
                <span class="status-badge status-active">Active</span>
                <div class="module-content-wrapper">
                    <h2 class="module-title">Emotional Awareness and Regulation</h2>
                    <p class="module-description">
                        Recognize your emotions, understand their causes, and develop healthy strategies to manage them effectively in daily and social situations.
                    </p>
                    <div class="module-actions">
                        <button class="module-btn btn-edit" onclick="editModule(2)">
                            Edit Module
                        </button>
                        <button class="module-btn btn-view" onclick="viewModule(2)">
                            View Details
                        </button>
                        <button class="module-btn btn-delete" onclick="deleteModule(2)">
                            Delete
                        </button>
                    </div>
                </div>
            </article>

            <!-- Module 3: Stress Management Techniques -->
            <article class="learning-module" data-module-id="3">
                <span class="status-badge status-draft">Draft</span>
                <div class="module-content-wrapper">
                    <h2 class="module-title">Stress Management Techniques</h2>
                    <p class="module-description">
                        Discover practical tools and techniques to reduce stress, improve focus, and maintain balance in your academic and personal life.
                    </p>
                    <div class="module-actions">
                        <button class="module-btn btn-edit" onclick="editModule(3)">
                            Edit Module
                        </button>
                        <button class="module-btn btn-view" onclick="viewModule(3)">
                            View Details
                        </button>
                        <button class="module-btn btn-delete" onclick="deleteModule(3)">
                            Delete
                        </button>
                    </div>
                </div>
            </article>

            <!-- Module 4: Building Resilience -->
            <article class="learning-module" data-module-id="4">
                <span class="status-badge status-draft">Draft</span>
                <div class="module-content-wrapper">
                    <h2 class="module-title">Building Resilience</h2>
                    <p class="module-description">
                        Learn how to bounce back from setbacks, develop a growth mindset, and cultivate inner strength to face life's challenges.
                    </p>
                    <div class="module-actions">
                        <button class="module-btn btn-edit" onclick="editModule(4)">
                            Edit Module
                        </button>
                        <button class="module-btn btn-view" onclick="viewModule(4)">
                            View Details
                        </button>
                        <button class="module-btn btn-delete" onclick="deleteModule(4)">
                            Delete
                        </button>
                    </div>
                </div>
            </article>
        </main>

        <!-- Add Module Button -->
        <button class="add-module-btn" onclick="openAddModal()" title="Add New Module">
            +
        </button>
    </div>

    <!-- Edit/Add Module Modal -->
    <div class="modal" id="moduleModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="modalTitle">Add New Module</h3>
                <button class="close-btn" onclick="closeModal()">×</button>
            </div>
            <form id="moduleForm" onsubmit="saveModule(event)">
                <input type="hidden" id="moduleId" value="">
                
                <div class="form-group">
                    <label class="form-label" for="moduleTitle">Module Title</label>
                    <input type="text" class="form-input" id="moduleTitle" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="moduleDescription">Description</label>
                    <textarea class="form-textarea" id="moduleDescription" required></textarea>
                </div>

                <div class="form-group">
                    <label class="form-label" for="moduleStatus">Status</label>
                    <select class="form-select" id="moduleStatus" required>
                        <option value="active">Active</option>
                        <option value="draft">Draft</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label" for="moduleImage">Module Image URL</label>
                    <input type="text" class="form-input" id="moduleImage" placeholder="https://...">
                </div>

                <div class="form-actions">
                    <button type="button" class="btn btn-secondary" onclick="closeModal()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Module</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Module data
        const modules = [
            {
                id: 1,
                title: "Introduction to Mental Health",
                description: "Learn the basics of mental health, reduce stigma, and understand how emotional well-being affects your daily life and success.",
                status: "active"
            },
            {
                id: 2,
                title: "Emotional Awareness and Regulation",
                description: "Recognize your emotions, understand their causes, and develop healthy strategies to manage them effectively in daily and social situations.",
                status: "active"
            },
            {
                id: 3,
                title: "Stress Management Techniques",
                description: "Discover practical tools and techniques to reduce stress, improve focus, and maintain balance in your academic and personal life.",
                status: "draft"
            },
            {
                id: 4,
                title: "Building Resilience",
                description: "Learn how to bounce back from setbacks, develop a growth mindset, and cultivate inner strength to face life's challenges.",
                status: "draft"
            }
        ];

        // Open add module modal
        function openAddModal() {
            document.getElementById('modalTitle').textContent = 'Add New Module';
            document.getElementById('moduleForm').reset();
            document.getElementById('moduleId').value = '';
            document.getElementById('moduleModal').classList.add('active');
        }

        // Edit module
        function editModule(id) {
            const module = modules.find(m => m.id === id);
            if (!module) return;

            document.getElementById('modalTitle').textContent = 'Edit Module';
            document.getElementById('moduleId').value = id;
            document.getElementById('moduleTitle').value = module.title;
            document.getElementById('moduleDescription').value = module.description;
            document.getElementById('moduleStatus').value = module.status;
            document.getElementById('moduleModal').classList.add('active');
        }

        // View module details
        function viewModule(id) {
            window.location.href = 'question.jsp?module=' + id;
        }

        // Delete module
        function deleteModule(id) {
            if (confirm('Are you sure you want to delete this module? This action cannot be undone.')) {
                // Send delete request to server
                const formData = new URLSearchParams();
                formData.append('action', 'delete');
                formData.append('moduleId', id);

                fetch('adminModuleServlet', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Module deleted successfully!');
                        location.reload();
                    } else {
                        alert('Error deleting module: ' + (data.message || 'Unknown error'));
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Module deletion simulated (server not connected)');
                    // In demo mode, just remove from DOM
                    const moduleCard = document.querySelector(`[data-module-id="${id}"]`);
                    if (moduleCard) {
                        moduleCard.style.opacity = '0';
                        setTimeout(() => moduleCard.remove(), 300);
                    }
                });
            }
        }

        // Close modal
        function closeModal() {
            document.getElementById('moduleModal').classList.remove('active');
        }

        // Save module (add or edit)
        function saveModule(event) {
            event.preventDefault();

            const moduleId = document.getElementById('moduleId').value;
            const title = document.getElementById('moduleTitle').value;
            const description = document.getElementById('moduleDescription').value;
            const status = document.getElementById('moduleStatus').value;
            const image = document.getElementById('moduleImage').value;

            const formData = new URLSearchParams();
            formData.append('action', moduleId ? 'update' : 'add');
            if (moduleId) formData.append('moduleId', moduleId);
            formData.append('title', title);
            formData.append('description', description);
            formData.append('status', status);
            formData.append('image', image);

            fetch('adminModuleServlet', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Module saved successfully!');
                    closeModal();
                    location.reload();
                } else {
                    alert('Error saving module: ' + (data.message || 'Unknown error'));
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Module saved locally (server not connected)');
                closeModal();
            });
        }

        // Close modal when clicking outside
        document.getElementById('moduleModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeModal();
            }
        });

        // Close modal with Escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeModal();
            }
        });
    </script>
</body>
</html>