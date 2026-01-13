<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Find Your Counselor | MindLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
            --btn-teal: #48C9B0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            /* 🟢 FIX: Added top padding so the button isn't stuck to the roof */
            padding: 40px 20px; 
            color: var(--text-dark);
            text-align: center;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            text-align: left; /* Keep internal content aligned left */
        }

        /* BACK BUTTON STYLE */
        .btn-back { 
            display: inline-flex; 
            align-items: center; 
            gap: 8px; 
            text-decoration: none; 
            color: #666; 
            font-weight: 600; 
            margin-bottom: 30px; /* Space below button */
            transition: 0.2s; 
        }
        .btn-back:hover { color: var(--text-dark); transform: translateX(-5px); }

        /* HEADER TEXT */
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 10px; text-align: center; }
        .subtitle { color: #666; margin-bottom: 40px; text-align: center; }

        /* SEARCH BAR */
        .search-container { text-align: center; margin-bottom: 40px; }
        .search-box {
            padding: 15px 20px;
            width: 100%;
            max-width: 500px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            outline: none;
        }

        /* COUNSELOR GRID */
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: transform 0.2s;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .card:hover { transform: translateY(-5px); box-shadow: 0 8px 20px rgba(0,0,0,0.1); }

        .avatar {
            width: 60px; height: 60px;
            background: #E0F7FA;
            color: #006064;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 24px; font-weight: bold;
        }

        .info h3 { margin: 0 0 5px 0; font-size: 18px; }
        .info p { margin: 0; color: #666; font-size: 14px; }
        
        .tags { margin-top: 10px; display: flex; gap: 8px; flex-wrap: wrap; }
        .tag { background: #f0f0f0; padding: 4px 10px; border-radius: 15px; font-size: 11px; color: #555; }

    </style>
</head>
<body>

    <div class="container">
        <a href="${pageContext.request.contextPath}/counseling/home" class="btn-back">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>

        <h1>Find Your Counselor</h1>
        <p class="subtitle">Connect with experienced professionals dedicated to your well-being.</p>

        <form action="${pageContext.request.contextPath}/counseling/browse" method="get" class="search-container">
            <input type="text" name="search" class="search-box" placeholder="Search by name or specialty..." value="${param.search}">
        </form>

        <div class="grid">
            <c:forEach items="${counselors}" var="c">
                <a href="${pageContext.request.contextPath}/counseling/booking?preselected=${c.name}" style="text-decoration: none; color: inherit;">
                    <div class="card">
                        <div class="avatar">
                            ${c.name.substring(4, 5)} </div>
                        <div class="info">
                            <h3>${c.name}</h3>
                            <p><i class="fas fa-map-marker-alt"></i> Block A Room 209</p> <div class="tags">
                                <span class="tag">Anxiety</span>
                                <span class="tag">Stress</span>
                                <span class="tag">Academic</span>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
            
            <c:if test="${empty counselors}">
                <p style="text-align: center; grid-column: 1/-1; color: #888;">No counselors found.</p>
            </c:if>
        </div>
    </div>

</body>
</html>