-- MindLink Database Schema
-- Virtual Assistant & Support Module Tables

-- Create Database
CREATE DATABASE IF NOT EXISTS mindlink_db;
USE mindlink_db;

-- Student Table: Stores student user information
CREATE TABLE IF NOT EXISTS student (
    student_id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    faculty VARCHAR(255),
    year INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Admin Table: Stores admin user information
CREATE TABLE IF NOT EXISTS admin (
    admin_id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    department VARCHAR(255),
    role VARCHAR(100) DEFAULT 'admin',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Counselor Table: Stores counselor user information
CREATE TABLE counselor (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    education VARCHAR(100),
    university VARCHAR(100),
    languages VARCHAR(100),
    email VARCHAR(100),
    bio TEXT,
    quote VARCHAR(255),
    image_url VARCHAR(255)
);

-- Chatbot Table: Stores keyword-response pairs for rule-based chatbot
CREATE TABLE IF NOT EXISTS chatbot (
    id INT AUTO_INCREMENT PRIMARY KEY,
    keyword VARCHAR(255) NOT NULL,
    response TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_keyword (keyword)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Daily Tips Table: Stores daily mental health tips
CREATE TABLE IF NOT EXISTS daily_tips (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Forum Table: Stores forum/discussion topics
CREATE TABLE IF NOT EXISTS forum (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_by VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('active', 'closed', 'archived') DEFAULT 'active',
    INDEX idx_created_by (created_by),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Forum Posts Table: Stores individual posts/replies in forums
CREATE TABLE IF NOT EXISTS forum_post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    forum_id INT NOT NULL,
    user_id VARCHAR(100) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    status ENUM('normal', 'reported') DEFAULT 'normal',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (forum_id) REFERENCES forum(id) ON DELETE CASCADE,
    INDEX idx_forum_id (forum_id),
    INDEX idx_user_id (user_id),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Forum Comments Table: Stores comments/replies to forum posts
CREATE TABLE IF NOT EXISTS forum_comment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id VARCHAR(100) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES forum_post(id) ON DELETE CASCADE,
    INDEX idx_post_id (post_id),
    INDEX idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Appointment Table: Stores counseling appointment details
CREATE TABLE IF NOT EXISTS appointment (
    id VARCHAR(50) PRIMARY KEY,
    student_id VARCHAR(50),      -- Who booked it
    counselor_name VARCHAR(100), -- Who they booked with
    appointment_date VARCHAR(20),
    appointment_time VARCHAR(20),
    type VARCHAR(20),            -- Online/Physical
    venue VARCHAR(100),
    status VARCHAR(20) DEFAULT 'Confirmed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Data for Students (Student IDs start from S001)
INSERT INTO student (student_id, name, email, password, phone, faculty, year) VALUES
('S001', 'Karen Voon Xiu Wen', 'karen@utm.my', 'password123', '+60123456789', 'Faculty of Computing', 3),
('S002', 'Siti Nurhaliza', 'siti.s002@utm.my', 'password123', '+60123456790', 'Faculty of Computing', 2),
('S003', 'Muhammad Ali', 'ali.s003@utm.myutm.my', 'password123', '+60123456792', 'Faculty of Computing', 1),
('S005', 'Hassan bin Ismail', 'hassan.s005@utm.my', 'password123', '+60123456793', 'Faculty of Engineering', 2);

-- Sample Data for Admins (Admin IDs start from A001)
INSERT INTO admin (admin_id, name, email, password, phone, department, role) VALUES
('A001', 'Dr. Sarah Johnson', 'testadmin@utm.my', 'admin123', '+60198765432', 'Faculty of Computing', 'admin'),
('A002', 'Prof. Ahmad Rahman', 'ahmad.a002@utm.my', 'admin123', '+60198765433', 'Faculty of Computing', 'admin'),
('A003', 'Dr. Lee Mei Ling', 'lee.a003@utm.my', 'admin123', '+60198765434', 'Faculty of Engineering', 'admin');

-- Sample Data for Counselors (Counselor IDs start from C001)
INSERT INTO counselor (counselor_id, name, email, password, phone, location, education, university, languages, specialization) VALUES
('C001', 'Ms. Tan Mei Ling', 'tan.meiling@utm.my', 'counselor123', '+60198765440', 'Block A Room 209', 'M.A. Clinical Psychology', 'Universiti Sains Malaysia', 'English, Mandarin, Malay', 'Academic stress management, motivation building, emotional resilience'),
('C002', 'Mr. Ryan Lin', 'ryan.lin@utm.my', 'counselor123', '+60198765441', 'Block A Room 301', 'M.Sc. Counseling', 'UPM', 'English, Hokkien', 'Cognitive behavioral therapy'),
('C003', 'Ms. Nur Alya', 'nur.alya@utm.my', 'counselor123', '+60198765442', 'Block B Room 314', 'PhD in Psychology', 'UKM', 'Malay, English', 'Anxiety and mood disorders'),
('C004', 'Ms. Evelyn Reed', 'evelyn.reed@utm.my', 'counselor123', '+60198765443', 'Block A Room 301', 'M.Sc. Counseling', 'UPM', 'English', 'Adjustment issues');

-- Sample Data for Chatbot (Rule-based responses)
INSERT INTO chatbot (keyword, response) VALUES
('hello', 'Hello! I''m here to help you with mental health support. How can I assist you today?'),
('hi', 'Hi there! Welcome to MindLink. What would you like to know?'),
('stress', 'Stress is a common experience. Try deep breathing exercises, take breaks, and prioritize self-care. Would you like tips on managing stress?'),
('anxiety', 'Anxiety can be challenging. Consider practicing mindfulness, staying active, and maintaining a regular sleep schedule. Remember, it''s okay to seek professional help.'),
('depression', 'Depression is a serious condition. Please reach out to a counselor or mental health professional. You can book a counseling session through our platform.'),
('help', 'I''m here to help! You can ask me about stress, anxiety, mental health tips, or book a counseling appointment. What would you like to know?'),
('tips', 'Here are some wellness tips: Get regular exercise, maintain a healthy sleep schedule, practice mindfulness, connect with others, and take time for activities you enjoy.'),
('counseling', 'To book a counseling session, please visit the Counseling section of the platform. Our qualified counselors are here to support you.'),
('feeling down', 'It''s normal to feel down sometimes. Consider talking to someone you trust, engaging in activities you enjoy, or booking a counseling session.'),
('mental health', 'Mental health is important. Take care of yourself through self-care practices, regular exercise, proper sleep, and seeking support when needed.');

-- Sample Data for Daily Tips
INSERT INTO daily_tips (title, content) VALUES
('Find Your Calm Before You Begin', 'Before studying or starting your day, take a moment to pause. Close your eyes, take three deep breaths for 5 seconds, feel it, and release. A calm mind helps you focus better.'),
('Start Your Day Mindfully', 'Start your day with 5 minutes of deep breathing or meditation to set a positive tone.'),
('Practice Daily Gratitude', 'Practice gratitude by writing down three things you''re thankful for each day.'),
('Stay Connected', 'Stay connected with friends and family - social connections are vital for mental health.'),
('Take Regular Breaks', 'Take regular breaks during work or study to prevent burnout and maintain focus.'),
('Prioritize Sleep', 'Get 7-9 hours of sleep each night to support both mental and physical well-being.'),
('Move Your Body', 'Engage in physical activity daily, even a short walk can boost your mood.'),
('Unplug Before Bed', 'Limit screen time before bed to improve sleep quality.'),
('Be Present', 'Practice mindfulness by being fully present in the current moment.'),
('Set Realistic Goals', 'Set realistic goals and celebrate small achievements along the way.'),
('Ask for Help', 'Remember that it''s okay to ask for help - seeking support is a sign of strength.');

-- Sample Data for Forum
INSERT INTO forum (title, description, created_by, status) VALUES
('Coping with Exam Stress', 'Share your strategies and experiences dealing with exam-related stress and anxiety.', 'A001', 'active'),
('Building Healthy Relationships', 'Discuss ways to maintain and improve relationships with friends, family, and partners.', 'A001', 'active'),
('Work-Life Balance', 'Tips and discussions about balancing academic work, personal life, and self-care.', 'A001', 'active'),
('Self-Care Practices', 'Share and discover different self-care activities that work for you.', 'A002', 'active');

-- Data for Counselor
INSERT INTO counselor (id, name, location, education, university, languages, email, bio, quote, image_url) VALUES 
('mei-ling', 'Ms. Tan Mei Ling', 'Block A Room 117', 'M.Sc. in Counseling', 'Psychology, Universiti Malaya', 'English, Malay, Mandarin', 'tan.meiling@university.edu', 'Ms. Tan Mei Ling is a professional counselor with over 8 years of experience working with university students. She specializes in academic stress management, motivation building, and emotional resilience.', 'I believe every student has the capacity to grow.', 'https://i.pravatar.cc/300?u=mei-ling'),
('ryan-lin', 'Mr. Ryan Lin', 'Block A Room 209', 'M.A. Clinical Psychology', 'Universiti Sains Malaysia', 'English, Hokkien', 'ryan.lin@university.edu', 'Specializes in cognitive behavioral therapy. He has a passion for helping students overcome anxiety.', 'Change starts with a single step.', 'https://i.pravatar.cc/300?u=ryan'),
('nur-alya', 'Ms. Nur Alya', 'Block B Room 314', 'PhD in Psychology', 'UKM', 'Malay, English', 'nur.alya@university.edu', 'Expert in anxiety and mood disorders. She creates a safe space for all students.', 'Mental health is just as important as physical health.', 'https://i.pravatar.cc/300?u=alya'),
('evelyn-reed', 'Ms. Evelyn Reed', 'Block A Room 301', 'M.Sc. Counseling', 'UPM', 'English', 'evelyn@uni.edu', 'Focuses on adjustment issues for international students.', 'Talk to someone, you are not alone.', 'https://i.pravatar.cc/300?u=evelyn');