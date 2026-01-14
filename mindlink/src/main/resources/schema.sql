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
DROP TABLE IF EXISTS counselor;
CREATE TABLE counselor (
    id VARCHAR(50) PRIMARY KEY, 
    name VARCHAR(100),
    password VARCHAR(255) NOT NULL,
    location VARCHAR(100),
    education VARCHAR(100),
    university VARCHAR(100),
    languages VARCHAR(100),
    email VARCHAR(100),
    bio TEXT,
    quote VARCHAR(255),
    image_url VARCHAR(255),
    phone_number VARCHAR(20),
    specialization VARCHAR(255)
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
    date VARCHAR(20),
    time VARCHAR(20),
    type VARCHAR(20),            -- Online/Physical
    venue VARCHAR(100),
    status VARCHAR(20) DEFAULT 'Confirmed',
    notes TEXT,
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
INSERT INTO counselor (
    id, 
    name, 
    email, 
    password, 
    location, 
    education, 
    university, 
    languages, 
    specialization, 
    bio, 
    quote, 
    image_url, 
    phone_number
) VALUES 
('C001', 'Ms. Tan Mei Ling', 'tan.meiling@utm.my', 'counselor123', 'Block A Room 209', 'M.A. Clinical Psychology', 'Universiti Sains Malaysia', 'English, Mandarin, Malay', 'Academic stress management, motivation building, emotional resilience', 'Experienced clinical psychologist dedicated to student well-being.', 'Empowering your journey.', 'tan.jpg', '012-3456789'),
('C002', 'Mr. Ryan Lin', 'ryan.lin@utm.my', 'counselor123', 'Block A Room 301', 'M.Sc. Counseling', 'UPM', 'English, Hokkien', 'Cognitive behavioral therapy', 'Focused on behavioral adjustments and mental clarity.', 'Change starts within.', 'ryan.jpg', '013-9876543'),
('C003', 'Ms. Nur Alya', 'nur.alya@utm.my', 'counselor123', 'Block B Room 314', 'PhD in Psychology', 'UKM', 'Malay, English', 'Anxiety and mood disorders', 'Expert in helping students manage anxiety and mood fluctuations.', 'Healing takes time.', 'nur.jpg', '014-5678901'),
('C004', 'Ms. Evelyn Reed', 'evelyn.reed@utm.my', 'counselor123', 'Block A Room 301', 'M.Sc. Counseling', 'UPM', 'English', 'Adjustment issues', 'Helping students navigate campus life transitions.', 'Guidance for every step.', 'evelyn.jpg', '016-1122334');

-- Sample Data for Appointments
INSERT INTO appointment (id, student_id, counselor_name, date, time, type, venue, status) VALUES
('BK001', 'S001', 'Mr. Ryan Lin', '2026-01-31', '04:00 PM', 'Physical', 'Block B Room 314', 'Booked'),
('BK002', 'S001', 'Ms. Tan Mei Ling', '2026-01-31', '09:00 AM', 'Online', 'https://utm.webex.com/utm/mstanmeiling', 'Booked'),
('BK003', 'S001', 'Ms. Tan Mei Ling', '2025-12-10', '10:00 AM', 'Physical', 'Block B Room 314', 'Booked'),
('BK004', 'S001', 'Mr. Ryan Lin', '2025-01-05', '02:00 PM', 'Online', 'https://utm.webex.com/utm/ryanlin', 'Booked');
('BK005', 'S001', 'Ms. Nur Alya', '2025-11-20', '09:00 AM', 'Online', 'https://utm.webex.com/utm/nuralya', 'Booked');

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

-- Module Table: Stores learning modules
CREATE TABLE IF NOT EXISTS module (
    module_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    image_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_title (title)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Module Question Table: Stores questions/lessons for each module
CREATE TABLE IF NOT EXISTS module_question (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    module_id INT NOT NULL,
    chapter_number INT NOT NULL,
    question_number VARCHAR(50) NOT NULL,
    question_text TEXT NOT NULL,
    question_type VARCHAR(50) DEFAULT 'PDF',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (module_id) REFERENCES module(module_id) ON DELETE CASCADE,
    INDEX idx_module_id (module_id),
    INDEX idx_chapter (module_id, chapter_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample Data for Modules
INSERT INTO module (title, description, image_path) VALUES
('Introduction to Mental Health', 'Learn the basics of mental health, reduce stigma, and understand emotional well-being.', 'mental-health-intro.png'),
('Emotional Awareness and Regulation', 'Recognize your emotions, understand their causes, and develop healthy strategies to manage them effectively in daily and social situations.', 'emotional-awareness.png');

-- Sample Data for Module Questions (Introduction to Mental Health - Module ID 1)
INSERT INTO module_question (module_id, chapter_number, question_number, question_text, question_type) VALUES
(1, 1, '1.1', 'Definition and Key Concepts PDF', 'PDF'),
(1, 1, '1.2', 'Mental Health vs Mental Illness PDF', 'PDF'),
(1, 1, '1.3', 'Mental Health Spectrum PDF', 'PDF'),
(1, 2, '2.1', 'What is Stigma? PDF', 'PDF'),
(1, 2, '2.2', 'Media and Cultural Misconceptions PDF', 'PDF');

-- Sample Data for Module Questions (Emotional Awareness - Module ID 2)
INSERT INTO module_question (module_id, chapter_number, question_number, question_text, question_type) VALUES
(2, 1, '1.1', 'Understanding Your Emotions PDF', 'PDF'),
(2, 1, '1.2', 'Emotional Triggers and Responses PDF', 'PDF'),
(2, 2, '2.1', 'Emotion Regulation Techniques PDF', 'PDF'),
(2, 2, '2.2', 'Mindfulness and Emotional Awareness PDF', 'PDF');

-- User Module Progress Table: Stores which questions a student has completed
CREATE TABLE IF NOT EXISTS user_module_progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(100) NOT NULL,
    module_id INT NOT NULL,
    question_id INT NOT NULL,
    completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (module_id) REFERENCES module(module_id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES module_question(question_id) ON DELETE CASCADE,
    UNIQUE KEY unique_progress (student_id, question_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Assessment Table: Stores questions for assessments
CREATE TABLE IF NOT EXISTS assessment (
    assessment_id INT AUTO_INCREMENT PRIMARY KEY,
    assessment_title VARCHAR(255) NOT NULL,
    question_text TEXT NOT NULL,
    question_type VARCHAR(50) DEFAULT 'Multiple Choice'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Assessment Question/Option Table: Stores options for each question
CREATE TABLE IF NOT EXISTS ass_question (
    option_id INT AUTO_INCREMENT PRIMARY KEY,
    assessment_id INT NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    score_value INT NOT NULL,
    FOREIGN KEY (assessment_id) REFERENCES assessment(assessment_id) ON DELETE CASCADE,
    INDEX idx_assessment_id (assessment_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id VARCHAR(50),
    category VARCHAR(100),
    subject VARCHAR(255),
    message TEXT,
    rating INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Data for Assessment (Stress Test)
INSERT INTO assessment (assessment_title, question_text) VALUES 
('Stress Test', 'How often do you feel overwhelmed by your workload?'),
('Stress Test', 'Do you find it difficult to relax after work/study?'),
('Stress Test', 'How often do you get headaches or physical tension?'),
('Stress Test', 'How often do you find that you cannot cope with all the things you have to do?', 'multiple_choice'),
('Stress Test', 'How often do you feel you are on top of things?', 'multiple_choice'),
('Stress Test', 'How often do you feel angered because of things that happened outside of your control?', 'multiple_choice'),
('Stress Test', 'How often do you feel that difficulties are piling up so high that you cannot overcome them?', 'multiple_choice'),
('Stress Test', 'How often do you experience physical symptoms of stress (e.g., headaches, stomach aches)?', 'multiple_choice'),
('Stress Test', 'How often do you have trouble falling or staying asleep due to racing thoughts?', 'multiple_choice'),
('Stress Test', 'How often do you feel overwhelmed by your academic or daily responsibilities?', 'multiple_choice');

-- Options for Question 1 (IDs will assume 1, 2, 3 based on auto-increment, but for safety in scripts usually we'd need to look them up. 
-- For this demo, assuming sequential insertion starting at 1).
-- Q1: Overwhelmed
INSERT INTO ass_question (assessment_id, option_text, score_value) VALUES 
(1, 'Never', 0), (1, 'Sometimes', 5), (1, 'Often', 10);

-- Q2: Difficult to relax
INSERT INTO ass_question (assessment_id, option_text, score_value) VALUES 
(2, 'No, I relax easily', 0), (2, 'Sometimes', 5), (2, 'Yes, very difficult', 10);

-- Q3: Physical tension
INSERT INTO ass_question (assessment_id, option_text, score_value) VALUES 
(3, 'Rarely', 0), (3, 'Occasionally', 5), (3, 'Frequently', 10),
(6, 'Never', 0), (104, 'Rarely', 3), (104, 'Often', 7), (104, 'Always', 10),
(7, 'Always', 0), (105, 'Often', 3), (105, 'Rarely', 7), (105, 'Never', 10),
(8, 'Never', 0), (106, 'Rarely', 3), (106, 'Often', 7), (106, 'Always', 10),
(9, 'Never', 0), (107, 'Rarely', 3), (107, 'Often', 7), (107, 'Always', 10),
(10, 'Never', 0), (108, 'Rarely', 3), (108, 'Often', 7), (108, 'Always', 10),
(11, 'Never', 0), (109, 'Rarely', 3), (109, 'Often', 7), (109, 'Always', 10),
(12, 'Never', 0), (110, 'Rarely', 3), (110, 'Often', 7), (110, 'Always', 10);


-- Sample Data for Assessment (Happiness Check)
INSERT INTO assessment (assessment_title, question_text) VALUES 
('Happiness Check', 'I feel satisfied with my life currently.'),
('Happiness Check', 'I find joy in small things.'),
('Happiness Check', 'In most ways, my life is close to my ideal.', 'multiple_choice'),
('Happiness Check', 'The conditions of my life are excellent.', 'multiple_choice'),
('Happiness Check', 'I am satisfied with my life.', 'multiple_choice'),
('Happiness Check', 'So far, I have gotten the important things I want in life.', 'multiple_choice'),
('Happiness Check', 'If I could live my life over, I would change almost nothing.', 'multiple_choice'),
('Happiness Check', 'I feel optimistic about my future.', 'multiple_choice'),
('Happiness Check', 'I feel that I have a sense of purpose in what I do.', 'multiple_choice'),
('Happiness Check', 'I enjoy the small things in my daily life.', 'multiple_choice'),
('Happiness Check', 'I feel energetic and motivated most days.', 'multiple_choice');

-- Q4: Satisfied (ID 4)
INSERT INTO ass_question (assessment_id, option_text, score_value) VALUES 
(4, 'Strongly Disagree', 0), (4, 'Neutral', 5), (4, 'Strongly Agree', 10);

-- Q5: Joy (ID 5)
INSERT INTO ass_question (assessment_id, option_text, score_value) VALUES 
(5, 'Rarely', 0), (5, 'Sometimes', 5), (5, 'Always', 10),
(13, 'Strongly Disagree', 0), (13, 'Disagree', 3), (13, 'Agree', 7), (13, 'Strongly Agree', 10),
(14, 'Strongly Disagree', 0), (14, 'Disagree', 3), (14, 'Agree', 7), (14, 'Strongly Agree', 10),
(15, 'Strongly Disagree', 0), (15, 'Disagree', 3), (15, 'Agree', 7), (15, 'Strongly Agree', 10),
(16, 'Strongly Disagree', 0), (16, 'Disagree', 3), (16, 'Agree', 7), (16, 'Strongly Agree', 10),
(17, 'Strongly Disagree', 0), (17, 'Disagree', 3), (17, 'Agree', 7), (17, 'Strongly Agree', 10),
(18, 'Strongly Disagree', 0), (18, 'Disagree', 3), (18, 'Agree', 7), (18, 'Strongly Agree', 10),
(19, 'Strongly Disagree', 0), (19, 'Disagree', 3), (19, 'Agree', 7), (19, 'Strongly Agree', 10),
(20, 'Strongly Disagree', 0), (20, 'Disagree', 3), (20, 'Agree', 7), (20, 'Strongly Agree', 10),
(21, 'Strongly Disagree', 0), (21, 'Disagree', 3), (21, 'Agree', 7), (21, 'Strongly Agree', 10),
(22, 'Strongly Disagree', 0), (22, 'Disagree', 3), (22, 'Agree', 7), (22, 'Strongly Agree', 10);

INSERT INTO feedback (id, booking_id, category, subject, message, rating, created_at) VALUES 
(2, 'BK003', 'Counselor Behavior', 'Nice Counselor', 'I love this counselor!', 5, '2026-01-14 07:29:20');

CREATE TABLE IF NOT EXISTS student_achievements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(100) NOT NULL,
    achievement_type VARCHAR(100) NOT NULL, -- e.g., 'WELLNESS_WARRIOR'
    unlocked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    UNIQUE KEY unique_student_ach (student_id, achievement_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO student_achievements (student_id, achievement_type, unlocked_at) VALUES
('S001', 'MIND_EXPLORER', '2025-01-10 10:30:00'),
('S001', 'WELLNESS_WARRIOR', '2025-01-12 14:45:00'),
('S002', 'MIND_EXPLORER', '2025-01-11 09:20:00'),
('S001', 'BALANCED_MIND', '2025-01-11 10:30:49'),
('S001', 'RESILIENCE_BUILDER', '2025-01-15 10:50:49'),
('S001', 'TINY_TRIUMPH', '2025-02-13 11:00:49'),
('S001', 'STEADY_START', '2025-02-25 08:50:45'),
('S001', 'FIRST_STEP_FORWARD', '2025-02-25 09:40:45'),
('S001', 'INNER_PEACE', '2025-01-25 19:40:45');

-- New table to track daily logins
CREATE TABLE IF NOT EXISTS user_logins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(100),
    login_date DATE,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    UNIQUE KEY (student_id, login_date)
);

-- Insert 3 new "Locked" milestones for users to work towards
-- These will now appear in your activities list
INSERT INTO student_achievements (student_id, achievement_type, unlocked_at) VALUES
('S001', 'FORUM_MASTER', NULL),        -- Milestone for posting in forum
('S001', 'CONSISTENT_CALM', NULL),     -- Milestone for 7-day login streak
('S001', 'FEEDBACK_FANATIC', NULL),    -- Milestone for providing feedback
('S001', 'FORUM_PARTICIPANT', NULL),   -- Goal: Post in the forum
('S001', 'DAILY_ZEN', NULL),           -- Goal: Log in for a 7-day streak
('S001', 'FEEDBACK_PROVIDER', NULL),   -- Goal: Rate a counselor session
('S001', 'KNOWLEDGE_SEEKER', NULL);    -- Goal: Read all learning modules

-- Update Assessment Table to include module_id
ALTER TABLE assessment ADD COLUMN module_id INT AFTER assessment_id;

-- Add Foreign Key constraint
ALTER TABLE assessment 
ADD CONSTRAINT fk_assessment_module 
FOREIGN KEY (module_id) REFERENCES module(module_id) ON DELETE CASCADE;

-- Create index for faster filtering
CREATE INDEX idx_assessment_module_id ON assessment(module_id);

-- Update Stress Test to belong to Module 1
UPDATE assessment SET module_id = 1 WHERE assessment_title = 'Stress Test';

-- Update Happiness Check to belong to Module 2
UPDATE assessment SET module_id = 2 WHERE assessment_title = 'Happiness Check';
