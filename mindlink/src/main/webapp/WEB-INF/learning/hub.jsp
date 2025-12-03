<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MindLink - Learning Resources</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* --- THEME COLORS --- */
        :root {
            --bg-color: #FFF3E0;      /* Beige Background */
            --text-dark: #003049;     /* Dark Navy for Headings */
            --text-body: #333333;
            --card-bg: #FFFFFF;
            --btn-yellow: #F2C94C;
            --btn-teal: #48C9B0;
            --btn-pink: #EF96AA;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            padding: 0;
            color: var(--text-body);
        }

        /* Navbar (Reused) */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 60px;
            background-color: transparent; /* Seamless blend */
        }
        .nav-links a {
            text-decoration: none;
            color: var(--text-dark);
            margin: 0 20px;
            font-weight: 500;
            font-size: 16px;
        }
        .logo {
            font-size: 32px;
            font-weight: 800;
            color: var(--text-dark);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        /* Main Container */
        .container {
            max-width: 1100px;
            margin: 40px auto;
            text-align: center;
        }

        /* Hero Text */
        h1 {
            font-size: 48px;
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 20px;
            line-height: 1.2;
        }
        .subtitle {
            font-size: 18px;
            color: var(--text-dark);
            margin-bottom: 60px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            line-height: 1.5;
        }

        /* Cards Grid */
        .cards-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }

        .card {
            background: var(--card-bg);
            border-radius: 40px; /* Big rounded corners like screenshot */
            padding: 40px 30px;
            width: 300px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            text-align: center;
            min-height: 350px;
            transition: transform 0.2s;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }

        .card h2 {
            font-size: 24px;
            color: var(--text-dark);
            margin-bottom: 15px;
        }

        .card p {
            font-size: 15px;
            line-height: 1.6;
            color: #555;
            margin-bottom: 30px;
        }

        /* Buttons */
        .btn {
            padding: 12px 40px;
            border-radius: 30px;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn-yellow { background-color: var(--btn-yellow); color: white; }
        .btn-teal { background-color: var(--btn-teal); color: white; }
        .btn-pink { background-color: var(--btn-pink); color: white; }

        .btn:hover { opacity: 0.9; }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="/">Home</a>
            <a href="/learning" style="font-weight: 700;">Learning</a>
        </div>
        <div class="logo">
             ❤️ MindLink
        </div>
        <div class="nav-links">
            <a href="#">Forum</a>
            <a href="#">Profile</a>
        </div>
    </nav>

    <div class="container">
        
        <h1>Resources for Your<br>Well-being</h1>
        <p class="subtitle">
            Explore expert insights, self-care guides, and tools to support your mental health.
        </p>

        <div class="cards-container">
            
            <div class="card">
                <div>
                    <h2>Learning<br>Module</h2>
                    <p>Practical tips on stress management, mindfulness, and emotional resilience.</p>
                </div>
                <a href="#" class="btn btn-yellow">Explore</a>
            </div>

            <div class="card">
                <div>
                    <h2>Self<br>Assessment</h2>
                    <p>Self assessment for you to know more about you and knowledge about mental.</p>
                </div>
                <a href="#" class="btn btn-teal">Explore</a>
            </div>

            <div class="card">
                <div>
                    <h2>Counseling &<br>Appointment</h2>
                    <p>Live and recorded sessions with mental health professionals.</p>
                </div>
                <a href="/counseling" class="btn btn-pink">Explore</a>
            </div>

        </div>
    </div>

</body>
</html>