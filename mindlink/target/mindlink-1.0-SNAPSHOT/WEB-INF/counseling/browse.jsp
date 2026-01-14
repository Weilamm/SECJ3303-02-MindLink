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
            --primary: #003049; 
            --accent: #F497AA; 
            --white: #ffffff;
            --gray: #666;
        }

        body { font-family: 'Inter', sans-serif; background-color: var(--bg-color); margin: 0; padding: 0; color: var(--primary); }

        /* HEADER */
        .header { padding: 20px 100px; display: flex; justify-content: space-between; align-items: center; background: white; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .nav-links a { text-decoration: none; color: #00313e; font-weight: 500; margin: 0 15px; transition: 0.3s; }
        .nav-links a:hover { color: #0d4e57; }
        .logo { display: flex; align-items: center; gap: 10px; font-weight: 800; color: #00313e; font-size: 24px; text-decoration: none; }
        .logo img { height: 40px; }

        /* MAIN LAYOUT */
        .container { max-width: 1100px; margin: 50px auto; padding: 0 20px; }
        h1 { font-size: 36px; font-weight: 800; margin-bottom: 10px; text-align: center; }
        .subtitle { color: var(--gray); font-size: 16px; margin-bottom: 50px; text-align: center; }

        /* SEARCH BAR */
        .search-wrapper { position: relative; max-width: 600px; margin: 0 auto 50px auto; }
        .search-input {
            width: 100%; padding: 18px 25px; padding-left: 55px;
            border-radius: 50px; border: none;
            background: white; font-size: 16px; 
            box-shadow: 0 4px 20px rgba(0,0,0,0.08); outline: none; transition: 0.3s;
        }
        .search-input:focus { box-shadow: 0 6px 25px rgba(0,0,0,0.12); transform: translateY(-2px); }
        .search-icon { position: absolute; left: 25px; top: 50%; transform: translateY(-50%); color: #bbb; font-size: 18px; }

        /* COUNSELOR GRID */
        .counselor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
        }

        /* CARD DESIGN */
        .card {
            background: var(--white); border-radius: 16px; padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03); transition: transform 0.2s, box-shadow 0.2s;
            text-decoration: none; color: inherit; display: block; position: relative; overflow: hidden;
            border: 1px solid transparent;
        }
        
        /* Hover Effect: Lift card + Pink Border */
        .card:hover { transform: translateY(-5px); box-shadow: 0 10px 30px rgba(0,0,0,0.08); border-color: var(--accent); }

        .card-header { display: flex; align-items: center; gap: 15px; margin-bottom: 15px; }
        
        .avatar {
            width: 60px; height: 60px; background: #E0F7FA; color: #006064;
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            font-size: 24px; font-weight: 700;
        }

        .info h3 { margin: 0; font-size: 18px; font-weight: 700; }
        .info p { margin: 3px 0 0 0; font-size: 14px; color: #888; }

        .tags { display: flex; gap: 8px; flex-wrap: wrap; }
        .tag {
            background: #f5f5f5; color: #555; padding: 5px 12px; border-radius: 20px;
            font-size: 12px; font-weight: 600;
        }
    </style>
</head>
<body>

    <div class="header">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/learning">Learning</a>
        </div>
        <a href="${pageContext.request.contextPath}/home" class="logo">
            <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
            <span>MindLink</span>
        </a>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/forum/welcome">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <div class="container">
        <h1>Find Your Counselor</h1>
        <p class="subtitle">Connect with experienced professionals dedicated to your well-being.</p>

        <div class="search-wrapper">
            <i class="fas fa-search search-icon"></i>
            <input type="text" id="searchInput" class="search-input" placeholder="Search by name or location" onkeyup="filterCounselors()">
        </div>

        <div class="counselor-grid" id="counselorGrid">
            
            <c:forEach items="${counselors}" var="c">
                <a href="${pageContext.request.contextPath}/counseling/counselor?id=${c.id}" class="card search-item">
                    
                    <div class="card-header">
                        <div class="avatar">${c.name.charAt(0)}</div>
                        <div class="info">
                            <h3 class="name-text">${c.name}</h3>
                            <p class="loc-text"><i class="fas fa-map-marker-alt"></i> ${c.location}</p>
                        </div>
                    </div>

                    <div class="tags">
                        <span class="tag">Anxiety</span>
                        <span class="tag">Stress</span>
                        <span class="tag">Academic</span>
                    </div>
                </a>
            </c:forEach>

            <div id="noResults" style="grid-column: 1/-1; text-align: center; display: none; padding: 40px;">
                <i class="far fa-frown" style="font-size: 40px; color: #ddd; margin-bottom: 10px;"></i>
                <p style="color: #666;">No counselors found matching your search.</p>
            </div>

        </div>
    </div>

    <script>
        function filterCounselors() {
            let input = document.getElementById('searchInput').value.toLowerCase();
            let cards = document.getElementsByClassName('search-item');
            let hasResults = false;

            for (let i = 0; i < cards.length; i++) {
                let name = cards[i].querySelector('.name-text').innerText.toLowerCase();
                let location = cards[i].querySelector('.loc-text').innerText.toLowerCase();
                
                // Check if name OR location matches search
                if (name.includes(input) || location.includes(input)) {
                    cards[i].style.display = ""; // Show
                    hasResults = true;
                } else {
                    cards[i].style.display = "none"; // Hide
                }
            }

            // Show "No Results" message if needed
            document.getElementById('noResults').style.display = hasResults ? "none" : "block";
        }
    </script>

</body>
</html>