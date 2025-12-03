<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mindlink - Home</title>
    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body style="background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);" class="overflow-hidden w-full min-w-[1103px] h-[649px] relative">

    <!-- WHITE NAVIGATION BAR -->
    <div class="absolute top-0 left-0 w-full h-[91px] bg-white shadow-sm"></div>

    <!-- TOP HEADER -->
    <header class="absolute top-0 left-[calc(50%_-_620px)] w-[1254px] h-[91px] relative z-10">
        <h1 class="absolute top-0 left-[calc(50%_-_122px)] h-[91px] flex items-center justify-center font-bold text-[#00373e] text-[50px] tracking-[0.50px] leading-[91px] gap-3">
            <img src="images/mindlink.png" alt="Mindlink logo" class="inline-block w-[56px] h-[56px] object-contain"/>
            <span>Mindlink</span>
        </h1>

        <!-- NAVIGATION -->
        <nav class="absolute top-[35px] w-full">
            <a href="/mindlink/home.jsp" class="absolute left-[150px] text-[#00373e] text-lg hover:text-[#2c5f5d] transition-colors">Home</a>
            <a href="/mindlink/learning.jsp" class="absolute left-[272px] text-[#00373e] text-lg hover:text-[#2c5f5d] transition-colors">Learning</a>
            <a href="/mindlink/forum.jsp" class="absolute left-[843px] text-[#00373e] text-lg hover:text-[#2c5f5d] transition-colors">Forum</a>
            <a href="/mindlink/profile.jsp" class="absolute left-[1029px] text-[#00373e] text-lg hover:text-[#2c5f5d] transition-colors">Profile</a>
        </nav>
    </header>

    <!-- TITLE SECTION -->
    <section class="absolute top-[129px] left-[calc(50%_-_256px)] w-[546px] flex flex-col items-center gap-[25px]">
        <h2 class="text-[#00373e] text-[52px] font-bold text-center leading-[normal]">
            Resources for Your Well-being
        </h2>

        <p class="text-[#00373e] text-[22px] text-center leading-[34px]">
            Explore expert insights, self-care guides, and tools to support your mental health.
        </p>
    </section>
    <!-- Resource Cards Section -->
    <section class="absolute top-[420px] left-[50%] transform -translate-x-1/2 flex gap-12">

        <!-- CARD 1 -->
        <div class="w-[250px] h-[263px] relative">
            <div class="absolute top-0 left-0 w-[250px] h-[263px] bg-white rounded-[59px]"></div>

            <h3 class="absolute top-[31px] left-0 w-full text-center text-[28px] font-semibold text-[#00373e] px-4">
                Learning Module
            </h3>

            <p class="absolute top-[99px] left-[26px] w-[198px] text-[#00373e] text-center leading-[26px]">
                Practical tips on stress management, mindfulness, and emotional resilience.
            </p>

            <button class="absolute top-[207px] left-[calc(50%_-_49px)] w-[99px] h-[35px] bg-[#efc01d] rounded-[100px] text-white font-semibold text-lg border-none cursor-pointer hover:opacity-90">
                <a href="/mindlink/learning.jsp">Explore</a>
            </button>
        </div>

        <!-- CARD 2 -->
        <div class="w-[250px] h-[263px] relative">
            <div class="absolute top-0 left-0 w-[250px] h-[263px] bg-white rounded-[59px]"></div>

            <h3 class="absolute top-[31px] left-0 w-full text-center text-[28px] font-semibold text-[#00373e] px-4">
                Self Assessment
            </h3>

            <p class="absolute top-[99px] left-[26px] w-[198px] text-[#00373e] text-center leading-[26px]">
                Self assessment for you to know more about you and knowledge about mental.
            </p>

            <button class="absolute top-[207px] left-[calc(50%_-_49px)] w-[99px] h-[35px] bg-[#4ccbbb] rounded-[100px] text-white font-semibold text-lg border-none cursor-pointer hover:opacity-90">
                Explore
            </button>
        </div>

        <!-- CARD 3 -->
        <div class="w-[250px] h-[263px] relative">
            <div class="absolute top-0 left-0 w-[250px] h-[263px] bg-white rounded-[59px]"></div>

            <h4 class="absolute top-[31px] left-0 w-full text-center text-[28px] font-semibold text-[#00373e] px-4">
                Counseling & Appointment
            </h4>

            <p class="absolute top-[99px] left-[26px] w-[198px] text-[#00373e] text-center leading-[26px]">
                <br>Live and recorded sessions with mental health professionals.
            </p>

            <button class="absolute top-[207px] left-[calc(50%_-_49px)] w-[99px] h-[35px] bg-[#f39cac] rounded-[100px] text-white font-semibold text-lg border-none cursor-pointer hover:opacity-90">
                Explore
            </button>
        </div>

        <!-- CARD 4 -->
        <div class="w-[250px] h-[263px] relative">
            <div class="absolute top-0 left-0 w-[250px] h-[263px] bg-white rounded-[59px]"></div>

            <h3 class="absolute top-[31px] left-0 w-full text-center text-[28px] font-semibold text-[#00373e] px-4">
                Achievements
            </h3>

            <p class="absolute top-[99px] left-[26px] w-[198px] text-[#00373e] text-center leading-[26px]">
                Earn badges and rewards as you reach your wellness goals.
            </p>

            <button class="absolute top-[207px] left-[calc(50%_-_49px)] w-[99px] h-[35px] bg-[#d19cf3] rounded-[100px] text-white font-semibold text-lg border-none cursor-pointer hover:opacity-90">
                Explore
            </button>
        </div>

    </section>

</body>
</html>
