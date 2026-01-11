<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Support for Your Mental Well-being</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    
    <style>
        /* --- EMBEDDED CSS START --- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #FDF3E7; /* Light beige background */
            color: #003B46; /* Dark teal text */
            overflow-x: hidden;
        }

        a { text-decoration: none; color: inherit; }

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 5%;
            background-color: transparent;
        }

        .nav-links {
            display: flex;
            gap: 40px;
            font-weight: 600;
            font-size: 16px;
            color: #475467;
        }

        .nav-links a:hover { color: #003B46; }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 32px;
            font-weight: 700;
            color: #003B46;
        }

        .logo img { height: 40px; }

        /* Hero Section */
        .hero-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 60px 10%; /* Adjust padding to center content */
            min-height: 80vh;
        }

        /* Left Side (Image) */
        .hero-image {
            flex: 1;
            max-width: 500px;
        }

        .hero-image img {
            width: 100%;
            height: auto;
            object-fit: contain;
        }

        /* Right Side (Text) */
        .hero-text {
            flex: 1;
            max-width: 600px;
            padding-left: 50px; /* Space between image and text */
        }

        h1 {
            font-size: 48px; /* Large heading */
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 20px;
            color: #003B46;
        }

        p {
            font-size: 18px;
            color: #475467;
            margin-bottom: 40px;
            line-height: 1.6;
        }

        /* Get Started Button */
        .btn-primary {
            display: inline-block;
            background-color: #003B46;
            color: #ffffff;
            padding: 15px 40px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #005566;
            transform: translateY(-2px);
        }

        /* Footer Decoration (Optional curve at bottom) */
        .footer-decoration {
            height: 50px;
            background-color: #D0D5DD; /* Grey bottom bar if needed */
            margin-top: auto;
        }

        /* Responsive Design */
        @media (max-width: 900px) {
            .hero-section {
                flex-direction: column;
                text-align: center;
                padding-top: 40px;
            }
            .hero-text {
                padding-left: 0;
                margin-top: 40px;
            }
            .nav-links { display: none; } /* Hide menu on mobile for simplicity */
        }
        /* --- EMBEDDED CSS END --- */
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink Logo">
            MindLink
        </div>
    </nav>

    <section class="hero-section">
        <div class="hero-image">
            <img src="${pageContext.request.contextPath}/images/background-left.png" alt="Mental Well-being shapes">
        </div>

        <div class="hero-text">
            <h1>Support for Your <br> Mental Well-being</h1>
            <p>Connect with licensed therapists, counselors, <br> and wellness coaches to support your journey.</p>
            
            <a href="/login" class="btn-primary">Get Started</a>
        </div>
    </section>

</body>
</html>