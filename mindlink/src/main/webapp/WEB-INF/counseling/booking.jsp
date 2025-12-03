<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #FFF3E0;
            --text-dark: #003049;
            --active-pink: #F497AA; /* The selection color */
            --white: #FFFFFF;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            margin: 0; padding: 20px;
            color: var(--text-dark);
        }

        /* Navbar */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 40px; }
        .nav-links a { text-decoration: none; color: var(--text-dark); margin: 0 15px; font-weight: 500; }
        .logo { font-size: 28px; font-weight: 800; color: var(--text-dark); }

        /* Main Container */
        .main-container { max-width: 1200px; margin: 20px auto; }
        
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 5px; }
        .subtitle { color: #666; font-size: 14px; margin-bottom: 40px; }

        /* --- LAYOUT GRID --- */
        .booking-grid {
            display: grid;
            grid-template-columns: 350px 1fr; /* Left Calendar, Right Details */
            gap: 50px;
        }

        /* 1. CALENDAR SECTION */
        .calendar-box { text-align: center; }
        .month-header { 
            display: flex; justify-content: space-between; align-items: center; 
            font-size: 18px; font-weight: 600; margin-bottom: 20px; padding: 0 20px;
        }
        .cal-arrow { color: #aaa; cursor: pointer; }
        
        .calendar-table { width: 100%; border-collapse: collapse; }
        .calendar-table th { color: #888; font-size: 13px; font-weight: 500; padding: 10px; }
        .calendar-table td { 
            padding: 10px; font-weight: 500; cursor: pointer; border-radius: 8px; 
            text-align: center; color: #555;
        }
        .calendar-table td:hover { background: #f0f0f0; }
        
        /* The Active Date (10th) */
        .date-active { 
            background-color: var(--active-pink) !important; 
            color: var(--text-dark) !important; 
            font-weight: 700 !important;
        }
        .date-faded { color: #ccc !important; }

        /* 2. SLOTS & COUNSELOR SECTION */
        .selection-area { }
        .section-header { text-align: center; color: #555; margin-bottom: 15px; font-size: 14px; }

        .time-grid, .counselor-grid {
            display: grid;
            gap: 15px;
            margin-bottom: 30px;
        }
        /* 2 columns for time, 2 columns for counselors */
        .time-grid { grid-template-columns: repeat(2, 1fr); }
        .counselor-grid { grid-template-columns: repeat(2, 1fr); }

        /* Selectable Buttons */
        .option-btn {
            background: var(--white);
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            transition: 0.2s;
            text-align: center;
        }
        .option-btn:hover { transform: translateY(-2px); }
        
        /* Active State for Buttons */
        .btn-active {
            background-color: var(--active-pink);
            color: #000;
            font-weight: 600;
        }
        .btn-disabled { background-color: #F0EAD6; color: #aaa; cursor: default; }

        /* 3. BOTTOM ACTIONS */
        .footer-actions {
            display: flex; justify-content: space-between; align-items: center;
            margin-top: 40px; border-top: 1px solid #eee; padding-top: 30px;
        }
        
        .mode-selection label { margin-right: 20px; cursor: pointer; font-size: 14px; font-weight: 500; }
        
        .action-btns { display: flex; gap: 15px; }
        .btn-cancel { 
            background: #F497AA; color: #333; border: none; 
            padding: 12px 30px; border-radius: 30px; font-weight: 600; cursor: pointer;
        }
        .btn-submit { 
            background: #86E393; /* Green from screenshot */
            color: #000; border: none; 
            padding: 12px 30px; border-radius: 30px; font-weight: 600; cursor: pointer;
        }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-links">
            <a href="/">Home</a>
            <a href="/learning">Learning</a>
        </div>
        <div class="logo">❤️ MindLink</div>
        <div class="nav-links">
            <a href="#">Forum</a>
            <a href="#">Profile</a>
        </div>
    </nav>

    <div class="main-container">
        <h1>Booking Appointment</h1>
        <p class="subtitle">View counselor availability and book sessions that fit your schedule</p>

        <form action="/counseling/booking/submit" method="post">
            
            <div class="booking-grid">
                
                <div class="calendar-box">
                    <div class="month-header">
                        <span class="cal-arrow">&lt;</span>
                        <span>June 2025</span>
                        <span class="cal-arrow">&gt;</span>
                    </div>

                    <table class="calendar-table">
                        <thead>
                            <tr><th>Mon</th><th>Tue</th><th>We</th><th>Thu</th><th>Fri</th><th>Sat</th><th>Sun</th></tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="date-faded">29</td><td class="date-faded">30</td><td class="date-faded">31</td>
                                <td>1</td><td>2</td><td>3</td><td>4</td>
                            </tr>
                            <tr>
                                <td>5</td><td>6</td><td>7</td><td>8</td><td>9</td>
                                <td class="date-active">10</td>
                                <td>11</td>
                            </tr>
                            <tr>
                                <td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td>
                            </tr>
                            <tr>
                                <td>19</td><td>20</td><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td>
                            </tr>
                            <tr>
                                <td>26</td><td>27</td><td>28</td><td>29</td><td>30</td>
                                <td class="date-faded">1</td><td class="date-faded">2</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="selection-area">
                    
                    <div class="section-header">Sat, 10 June 2025</div>
                    
                    <div style="display:flex; justify-content: space-between; gap:20px;">
                        <div class="time-grid" style="flex:1;">
                            <div class="option-btn">08:00 AM</div>
                            <div class="option-btn">09:00 AM</div>
                            <div class="option-btn">10:00 AM</div>
                            <div class="option-btn btn-disabled">11:00 AM</div> <div class="option-btn btn-active">12:30 PM</div> <div class="option-btn">01:30 PM</div>
                            <div class="option-btn">02:30 PM</div>
                            <div class="option-btn">03:30 PM</div>
                            <div class="option-btn">04:30 PM</div>
                            <div class="option-btn">05:30 PM</div>
                        </div>

                        <div style="flex:1;">
                            <div class="section-header">Available Counselor</div>
                            <div class="counselor-grid">
                                <div class="option-btn">Mr. Ryan Lin</div>
                                <div class="option-btn btn-active">Ms. Nur Alya</div> <div class="option-btn">Ms. Cindy Leong</div>
                                <div class="option-btn">Mr. John Doe</div>
                                <div class="option-btn">Ms. Kelly Low</div>
                                <div class="option-btn">Mr. Mohd Alif</div>
                                <div class="option-btn">Ms. Anika</div>
                                <div class="option-btn">Ms. Prisha</div>
                                <div class="option-btn">Mr. Rohan</div>
                                <div class="option-btn">Ms. Siti Aishah</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="footer-actions">
                <div class="mode-selection">
                    <span style="font-weight:700; margin-right:15px;">Choose your Preferred Mode:</span>
                    <label><input type="radio" name="mode" value="online" checked> Online</label>
                    <label><input type="radio" name="mode" value="physical"> Physical</label>
                </div>

                <div class="action-btns">
                    <button type="button" class="btn-cancel" onclick="window.history.back()">CANCEL</button>
                    <button type="submit" class="btn-submit">SUBMIT</button>
                </div>
            </div>

        </form>
    </div>

</body>
</html>