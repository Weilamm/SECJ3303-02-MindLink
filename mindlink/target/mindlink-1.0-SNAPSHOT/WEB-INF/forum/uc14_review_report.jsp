<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UC14 Review Forum Report - MindLink</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #FFE6D0; /* match main app soft peach */
            min-height: 100vh;
            overflow-x: hidden; /* ensure page fits laptop browser width */
        }

        .header {
            padding: 20px 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #FFE6D0;
        }

        .page-title {
            color: #b8a5a5;
            font-size: 16px;
            font-weight: 400;
        }

        .nav-menu {
            display: flex;
            gap: 30px;
            align-items: center;
        }

        .nav-menu a,
        .nav-menu span {
            text-decoration: none;
            color: #333;
            font-size: 14px;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 700;
            color: #00313e;
            font-size: 22px;
        }

        .logo-icon {
            width: 24px;
            height: 24px;
            background: linear-gradient(135deg, #ffd700, #ffed4e);
            border-radius: 50%;
        }

        /* Main Container */
        .container {
            max-width: 1100px;
            margin: 40px auto 60px;
            padding: 0 20px 40px;
        }

        /* Report Card */
        .report-card {
            background: white;
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .card-header {
            font-size: 22px;
            font-weight: 700;
            color: #333;
            margin-bottom: 30px;
        }

        /* Report Details Box */
        .report-details {
            background-color: #f9f9f9;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
        }

        .detail-row {
            display: flex;
            margin-bottom: 12px;
            font-size: 14px;
        }

        .detail-label {
            font-weight: 600;
            color: #555;
            min-width: 120px;
        }

        .detail-value {
            color: #333;
            flex: 1;
        }

        /* Action Buttons */
        .action-section {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            margin-top: 25px;
        }

        .btn-view, .btn-mark-resolved, .btn-delete {
            padding: 12px 28px;
            border: none;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .btn-view {
            background-color: #2196F3;
            color: white;
        }

        .btn-view:hover {
            background-color: #1976D2;
            transform: translateY(-2px);
        }

        .btn-mark-resolved {
            background-color: #4CAF50;
            color: white;
        }

        .btn-mark-resolved:hover {
            background-color: #388E3C;
            transform: translateY(-2px);
        }

        .btn-delete {
            background-color: #f44336;
            color: white;
        }

        .btn-delete:hover {
            background-color: #d32f2f;
            transform: translateY(-2px);
        }

        /* Post Preview */
        .post-preview {
            background-color: #fff;
            border: 2px solid #e0e0e0;
            border-radius: 15px;
            padding: 25px;
            margin-top: 20px;
        }

        .preview-header {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }

        .preview-content {
            color: #555;
            line-height: 1.8;
            font-size: 14px;
        }

        /* Confirmation Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.6);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: white;
            border-radius: 25px;
            padding: 40px;
            max-width: 450px;
            width: 90%;
            text-align: center;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            animation: modalSlideIn 0.3s ease;
        }

        @keyframes modalSlideIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .modal-icon {
            font-size: 70px;
            margin-bottom: 20px;
        }

        .warning-icon {
            color: #ff9800;
        }

        .success-icon {
            color: #4CAF50;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 700;
            color: #333;
            margin-bottom: 15px;
        }

        .modal-message {
            font-size: 14px;
            color: #666;
            margin-bottom: 25px;
            line-height: 1.6;
        }

        .modal-buttons {
            display: flex;
            gap: 12px;
        }

        .btn-no, .btn-yes, .btn-confirm {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-no {
            background-color: #f0f0f0;
            color: #666;
        }

        .btn-no:hover {
            background-color: #e0e0e0;
        }

        .btn-yes {
            background-color: #0d5555;
            color: white;
        }

        .btn-yes:hover {
            background-color: #0a4444;
        }

        .btn-confirm {
            background-color: #0d5555;
            color: white;
        }

        .btn-confirm:hover {
            background-color: #0a4444;
        }

    </style>
</head>
<body>
    <!-- Header (admin-only visual, no links back to user UI) -->
    <div class="header">
        <nav class="nav-menu">
            <span>Home</span>
            <span>Portal</span>
            <div class="logo">
                <div class="logo-icon">💛</div>
                <span>MindLink Admin</span>
            </div>
            <span>Forum</span>
            <span>Profile</span>
        </nav>
    </div>

    <!-- Main Container -->
    <div class="container">
        <div class="report-card">
            <h2 class="card-header">Reported Forum:</h2>

            <!-- Report Details -->
            <div class="report-details">
                <div class="detail-row">
                    <span class="detail-label">Report ID:</span>
                    <span class="detail-value">${report.id != null ? report.id : '001'}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Post Title:</span>
                    <span class="detail-value">${report.postTitle != null ? report.postTitle : 'Exam Stress - Any Advice?'}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Forum:</span>
                    <span class="detail-value">${report.forum != null ? report.forum : 'Academic Pressure'}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Reason:</span>
                    <span class="detail-value">${report.reason != null ? report.reason : 'Harassment'}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Reporter:</span>
                    <span class="detail-value">${report.reporter != null ? report.reporter : 'Alex Wang'}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Report Date:</span>
                    <span class="detail-value">${report.reportDate != null ? report.reportDate : '07-Nov-2025'}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Reported By:</span>
                    <span class="detail-value">${report.reportedBy != null ? report.reportedBy : 'Alex Wang'}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Reported On:</span>
                    <span class="detail-value">${report.reportedOn != null ? report.reportedOn : '07-Nov-2025'}</span>
                </div>
            </div>

            <!-- Post Preview -->
            <div class="post-preview">
                <div class="preview-header">Post Content:</div>
                <div class="preview-content">
                    ${report.content != null ? report.content : 
                    'I can\'t handle all these assignments and exams. Everything feels overwhelming and I\'m starting to panic. Does anyone have advice on how to cope with academic pressure? I feel like I\'m drowning.'}
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="action-section">
                <button class="btn-view" onclick="viewOriginalPost()">
                    View Original Post
                </button>
                <button class="btn-mark-resolved" onclick="showResolvedModal()">
                    Mark As Resolved
                </button>
                <button class="btn-delete" onclick="showDeleteModal()">
                    Delete Post
                </button>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal" id="deleteModal">
        <div class="modal-content">
            <div class="modal-icon warning-icon">⚠️</div>
            <h2 class="modal-title">Confirm to delete this post?</h2>
            <p class="modal-message">
                This action cannot be undone. The post will be permanently removed from the forum.
            </p>
            <div class="modal-buttons">
                <button class="btn-no" onclick="closeDeleteModal()">No</button>
                <button class="btn-yes" onclick="deletePost()">Yes</button>
            </div>
        </div>
    </div>

    <!-- Delete Success Modal -->
    <div class="modal" id="successModal">
        <div class="modal-content">
            <div class="modal-icon success-icon">✓</div>
            <h2 class="modal-title">Post Deleted</h2>
            <p class="modal-message">
                The reported post has been successfully removed from the forum.
            </p>
            <div class="modal-buttons">
                <button class="btn-confirm" onclick="closeSuccessModal()">Confirm</button>
            </div>
        </div>
    </div>

    <!-- Mark Resolved Modal -->
    <div class="modal" id="resolvedModal">
        <div class="modal-content">
            <div class="modal-icon success-icon">✓</div>
            <h2 class="modal-title">Mark Report as Resolved?</h2>
            <p class="modal-message">
                This will mark the report as reviewed and resolved without deleting the post.
            </p>
            <div class="modal-buttons">
                <button class="btn-no" onclick="closeResolvedModal()">Cancel</button>
                <button class="btn-yes" onclick="markResolved()">Mark Resolved</button>
            </div>
        </div>
    </div>

    <script>
        // View Original Post
        function viewOriginalPost() {
            // Open post in new tab or modal
            const postId = '${report.postId != null ? report.postId : "001"}';
            window.open('uc12_post_detail.jsp?id=' + postId, '_blank');
        }

        // Show Delete Modal
        function showDeleteModal() {
            document.getElementById('deleteModal').classList.add('active');
        }

        // Close Delete Modal
        function closeDeleteModal() {
            document.getElementById('deleteModal').classList.remove('active');
        }

        // Delete Post
        function deletePost() {
            const reportId = '${report.id != null ? report.id : "001"}';
            
            fetch('ReportServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'action=deletePost&reportId=' + reportId
            })
            .then(response => response.json())
            .then(data => {
                closeDeleteModal();
                document.getElementById('successModal').classList.add('active');
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while deleting the post');
            });
        }

        // Close Success Modal
        function closeSuccessModal() {
            document.getElementById('successModal').classList.remove('active');
            // Redirect back to reports list
            window.location.href = 'uc14_table.jsp';
        }

        // Show Resolved Modal
        function showResolvedModal() {
            document.getElementById('resolvedModal').classList.add('active');
        }

        // Close Resolved Modal
        function closeResolvedModal() {
            document.getElementById('resolvedModal').classList.remove('active');
        }

        // Mark as Resolved
        function markResolved() {
            const reportId = '${report.id != null ? report.id : "001"}';
            
            fetch('ReportServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'action=markResolved&reportId=' + reportId
            })
            .then(response => response.json())
            .then(data => {
                closeResolvedModal();
                alert('Report marked as resolved');
                window.location.href = 'uc14_table.jsp';
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while marking report as resolved');
            });
        }

        // Close modals when clicking outside
        document.querySelectorAll('.modal').forEach(modal => {
            modal.addEventListener('click', function(e) {
                if (e.target === this) {
                    this.classList.remove('active');
                }
            });
        });

        // Keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                document.querySelectorAll('.modal').forEach(modal => {
                    modal.classList.remove('active');
                });
            }
        });
    </script>
</body>
</html>
