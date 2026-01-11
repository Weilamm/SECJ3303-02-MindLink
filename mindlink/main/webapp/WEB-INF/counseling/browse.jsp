<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Find Your Counselor</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --card-bg: #FFFFFF;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
            color: var(--text-dark);
        }

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

        .container { max-width: 1100px; margin: 40px auto; }
        
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 5px; }
        .subtitle { color: #666; font-size: 16px; margin-bottom: 40px; }

        /* SEARCH BAR */
        .search-container {
            margin-bottom: 50px;
            position: relative;
        }
        .search-input {
            width: 100%;
            padding: 15px 20px;
            padding-right: 50px; /* Space for icon */
            border-radius: 30px;
            border: 1px solid #AAA;
            background: transparent;
            font-size: 16px;
            outline: none;
            font-family: inherit;
        }
        .search-icon {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            color: #555;
            cursor: pointer;
        }

        /* CARD GRID */
        .counselor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)); /* Responsive Grid */
            gap: 20px;
        }

        .card {
            background: var(--card-bg);
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            transition: transform 0.2s;
            cursor: pointer;
        }
        .card:hover { transform: translateY(-5px); }

        .counselor-name { font-size: 18px; font-weight: 700; margin-bottom: 8px; color: #000; }
        .counselor-loc { font-size: 14px; color: #666; }

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
        <h1>Find Your Counselor</h1>
        <p class="subtitle">Connect with experienced mental health professionals who care</p>

        <form action="/counseling/browse" method="get" class="search-container">
            <input type="text" name="search" class="search-input" placeholder="Type your counselor name" value="${param.search}">
            <span class="search-icon">🔍</span> </form>

        <div class="counselor-grid">
            <c:forEach items="${counselors}" var="c">
                <a href="/counseling/counselor?id=${c.id}" style="text-decoration: none;">
                    <div class="card">
                        <div class="counselor-name">${c.name}</div>
                        <div class="counselor-loc">${c.location}</div>
                    </div>
                </a>
            </c:forEach>
            
            <c:if test="${empty counselors}">
                <p style="color: #666;">No counselors found matching that name.</p>
            </c:if>
        </div>
    </div>

</body>
</html>