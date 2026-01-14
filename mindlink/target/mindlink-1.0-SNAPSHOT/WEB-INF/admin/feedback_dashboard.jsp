<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Feedback Portal | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #003049;
            --teal: #48C9B0;
            --bg-gray: #f4f7f6;
            --white: #ffffff;
            --pending-border: #F497AA;
            --completed-border: #48C9B0;
        }

        body { font-family: 'Inter', sans-serif; background: var(--bg-gray); padding: 40px; margin: 0; color: #333; }
        .container { max-width: 900px; margin: 0 auto; }
        
        h1 { color: var(--primary); margin-bottom: 30px; font-weight: 800; font-size: 28px; }

        /* --- FILTER BAR --- */
        .filter-bar {
            background: var(--white); padding: 15px 20px; border-radius: 12px;
            display: flex; gap: 20px; align-items: center; margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
        }
        .filter-select {
            padding: 10px 15px; border: 1px solid #e0e0e0; border-radius: 8px;
            font-size: 14px; color: #333; outline: none; cursor: pointer; transition: 0.2s;
            background-color: #fff;
        }
        .filter-select:hover { border-color: var(--primary); }
        .filter-label { font-weight: 600; color: #555; font-size: 14px; display: flex; align-items: center; gap: 8px; }

        /* --- TABS --- */
        .tabs { display: flex; gap: 20px; margin-bottom: 25px; border-bottom: 2px solid #e0e0e0; padding-bottom: 0; }
        .tab-btn {
            background: none; border: none; padding: 12px 5px;
            font-size: 16px; font-weight: 600; color: #888; cursor: pointer;
            border-bottom: 3px solid transparent; transition: all 0.2s; position: relative; top: 2px;
        }
        .tab-btn:hover { color: var(--primary); }
        .tab-btn.active { color: var(--primary); border-bottom-color: var(--primary); }
        .badge { 
            background: #eee; padding: 2px 8px; border-radius: 12px; 
            font-size: 12px; margin-left: 6px; vertical-align: middle;
        }
        .tab-btn.active .badge { background: var(--primary); color: white; }

        /* --- TAB CONTENT --- */
        .tab-content { display: none; animation: fadeIn 0.4s ease; }
        .tab-content.active { display: block; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }

        /* --- FEEDBACK CARD --- */
        .feedback-card {
            background: var(--white); border-radius: 16px; margin-bottom: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04); overflow: hidden;
            border-left: 6px solid transparent; cursor: pointer;
            transition: all 0.2s ease;
        }
        .feedback-card:hover { transform: translateY(-2px); box-shadow: 0 8px 20px rgba(0,0,0,0.08); }

        .pending-card { border-left-color: var(--pending-border); }
        .completed-card { border-left-color: var(--completed-border); }

        /* CARD HEADER */
        .card-header {
            padding: 20px 25px; display: flex; justify-content: space-between; align-items: center;
        }
        .subject { font-weight: 700; font-size: 17px; color: #222; }
        .category-badge { 
            background: #f0f4f8; padding: 5px 12px; border-radius: 20px; 
            font-size: 12px; margin-left: 12px; color: #555; font-weight: 600; letter-spacing: 0.3px;
        }
        .meta-info { display: flex; align-items: center; gap: 20px; font-size: 13px; color: #777; font-weight: 500; }
        .chevron { transition: transform 0.3s; color: #ccc; }
        .feedback-card.active .chevron { transform: rotate(180deg); color: var(--primary); }

        /* DETAILS (HIDDEN) */
        .card-details {
            display: none; padding: 0 25px 25px 25px; border-top: 1px solid #f0f0f0; background: #fafafa;
        }
        .message-box { 
            margin-top: 20px; color: #444; line-height: 1.6; font-size: 15px; 
            background: white; padding: 20px; border-radius: 12px; border: 1px solid #eee;
        }
        
        /* --- IMPROVED REPLY SECTION --- */
        .reply-section { margin-top: 20px; }
        
        .reply-container {
            position: relative;
            border: 1px solid #ddd;
            border-radius: 12px;
            background: white;
            transition: border-color 0.2s, box-shadow 0.2s;
            padding: 5px;
        }
        
        .reply-container:focus-within {
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(0, 48, 73, 0.1);
        }

        .reply-form textarea {
            width: 100%; padding: 15px; border: none; border-radius: 12px;
            font-family: inherit; resize: vertical; box-sizing: border-box;
            outline: none; font-size: 14px; min-height: 80px;
        }
        
        .form-footer {
            display: flex; justify-content: flex-end; padding: 0 10px 10px 10px;
        }

        .btn-reply {
            background: var(--primary); color: white; border: none; 
            padding: 10px 24px; border-radius: 8px; cursor: pointer; 
            font-weight: 600; font-size: 14px; transition: 0.2s;
            display: flex; align-items: center; gap: 8px;
        }
        .btn-reply:hover { background: #004d73; transform: translateY(-1px); }

        /* COMPLETED REPLY DISPLAY */
        .reply-display { 
            background: #E0F2F1; color: #004D40; padding: 20px; border-radius: 12px; 
            font-size: 14px; border: 1px solid #B2DFDB; line-height: 1.6;
        }
        
        /* Helper for Empty State */
        .empty-state { text-align: center; color: #999; margin-top: 60px; font-style: italic; }

    </style>
</head>
<body>

<div class="container">
    <h1>Feedback Management</h1>

    <div class="filter-bar">
        <span class="filter-label"><i class="fas fa-filter"></i> Filter By:</span>
        <select id="filterCategory" class="filter-select" onchange="applyFilters()">
            <option value="all">All Categories</option>
            <option value="counselor behavior">Counselor Behavior</option>
            <option value="facility">Facility</option>
            <option value="system issue">System Issue</option>
            <option value="other">Other</option>
        </select>
        <select id="filterRating" class="filter-select" onchange="applyFilters()">
            <option value="all">All Ratings</option>
            <option value="5">5 Stars</option>
            <option value="4">4 Stars</option>
            <option value="3">3 Stars</option>
            <option value="2">2 Stars</option>
            <option value="1">1 Stars</option>
        </select>
    </div>

    <div class="tabs">
        <button class="tab-btn active" onclick="openTab('pending')">
            Pending Review <span class="badge" id="pendingCount">${pendingList.size()}</span>
        </button>
        <button class="tab-btn" onclick="openTab('completed')">
            Completed <span class="badge" id="completedCount">${completedList.size()}</span>
        </button>
    </div>

    <div id="pending" class="tab-content active">
        <c:forEach items="${pendingList}" var="fb">
            <div class="feedback-card pending-card" onclick="toggleCard(this)"
                 data-category="${fb.category}" data-rating="${fb.rating}">
                
                <div class="card-header">
                    <div>
                        <span class="subject">${fb.subject}</span>
                        <span class="category-badge">${fb.category}</span>
                    </div>
                    <div class="meta-info">
                        <span><i class="fas fa-star" style="color: gold;"></i> ${fb.rating}/5</span>
                        <span>${fb.createdAt}</span>
                        <i class="fas fa-chevron-down chevron"></i>
                    </div>
                </div>

                <div class="card-details" onclick="event.stopPropagation()">
                    <div class="message-box">
                        <strong style="display:block; margin-bottom: 5px; color: #000;">Student Feedback</strong>
                        "${fb.message}"
                    </div>
                    
                    <div class="reply-section">
                        <form action="${pageContext.request.contextPath}/admin/feedback/reply" method="post" class="reply-form">
                            <input type="hidden" name="id" value="${fb.id}">
                            
                            <div class="reply-container">
                                <textarea name="reply" placeholder="Type your response to the student here..." required></textarea>
                                <div class="form-footer">
                                    <button type="submit" class="btn-reply">
                                        <i class="fas fa-paper-plane"></i> Send Reply
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty pendingList}">
            <p class="empty-state">All caught up! No pending reviews.</p>
        </c:if>
    </div>

    <div id="completed" class="tab-content">
        <c:forEach items="${completedList}" var="fb">
            <div class="feedback-card completed-card" onclick="toggleCard(this)"
                 data-category="${fb.category}" data-rating="${fb.rating}">
                
                <div class="card-header">
                    <div>
                        <span class="subject">${fb.subject}</span>
                        <span class="category-badge">${fb.category}</span>
                    </div>
                    <div class="meta-info">
                        <span><i class="fas fa-star" style="color: gold;"></i> ${fb.rating}/5</span>
                        <span>${fb.createdAt}</span>
                        <i class="fas fa-chevron-down chevron"></i>
                    </div>
                </div>

                <div class="card-details" onclick="event.stopPropagation()">
                    <div class="message-box">
                        <strong style="display:block; margin-bottom: 5px; color: #000;">Student Feedback</strong>
                        "${fb.message}"
                    </div>
                    <div class="reply-section">
                        <div class="reply-display">
                            <strong style="display: block; margin-bottom: 8px;"><i class="fas fa-check-circle"></i> Admin Response</strong>
                            ${fb.adminReply}
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty completedList}">
            <p class="empty-state">No completed reviews yet.</p>
        </c:if>
    </div>

</div>

<script>
    function toggleCard(card) {
        card.classList.toggle('active');
        let details = card.querySelector('.card-details');
        
        // Smoother Toggle
        if (details.style.display === "block") {
            details.style.display = "none";
        } else {
            // Close other open cards (Optional: nicer UX)
            document.querySelectorAll('.card-details').forEach(d => d.style.display = 'none');
            document.querySelectorAll('.feedback-card').forEach(c => c.classList.remove('active'));
            
            // Open this one
            card.classList.add('active');
            details.style.display = "block";
        }
    }

    function openTab(tabName) {
        document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        document.getElementById(tabName).classList.add('active');
        event.currentTarget.classList.add('active');
    }

    function applyFilters() {
        let category = document.getElementById('filterCategory').value.toLowerCase();
        let rating = document.getElementById('filterRating').value;
        let cards = document.querySelectorAll('.feedback-card');

        cards.forEach(card => {
            let cardCat = card.getAttribute('data-category').toLowerCase();
            let cardRate = card.getAttribute('data-rating');
            let matchCat = (category === 'all' || cardCat === category);
            let matchRate = (rating === 'all' || cardRate === rating);
            card.style.display = (matchCat && matchRate) ? 'block' : 'none';
        });
    }
</script>

</body>
</html>