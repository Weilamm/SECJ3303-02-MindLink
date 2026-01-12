# MindLink 

**MindLink** is a web-based project developed for the **SECJ3303-02** course. It provides a platform to **manage, track, and interact with mind-mapping sessions**, offering real-time collaboration features for users. The project is built using **Java, Apache Tomcat, Maven, and VSCode**, following modern web application practices and Jakarta EE standards.

---

## Features

- Real-time collaboration on mind-mapping sessions  
- User authentication and session management  
- Interactive dashboard for creating and managing projects  
- Compatible with **Tomcat 9 and Tomcat 11**  
- Built using **Maven** for dependency management and build automation  

---

## Modules & Use Cases

| No. | Module Name | Use Case (UC) | Description |
|-----|-------------|---------------|-------------|
| 1 | User Authentication & Profile Management | UC 1.1: Secure Registration and Login | A new student registers using their university ID; the system uses Spring Security to authenticate credentials and establish a secure session. |
|   |  | UC 1.2: Profile Management and Settings | A user updates personal details, changes their password, or customizes notification preferences (e.g., email/SMS reminders). |
| 2 | Mental Health Learning Module | UC 2.1: Content Browsing and Retrieval | A student selects a topic (e.g., "Anxiety," "Resilience") and views the corresponding article, video, or interactive lesson. |
|   |  | UC 2.2: Track and Resume Progress | The system records progress in a module, allowing the student to exit and resume later from the last completed point. |
| 3 | Self-Assessment and Progress Tracking | UC 3.1: Complete Digital Screening Tool | A user completes a validated self-assessment questionnaire (e.g., DASS-21) and receives an immediate, confidential risk score and suggested resources. |
|   |  | UC 3.2: Visualize Personal Health Data | The student views a dashboard showing past assessment scores and learning activity in a time-series chart to track progress. |
| 4 | Gamification & Engagement Module | UC 4.1: Earn Achievement Badges | The system automatically awards a virtual badge (e.g., "Literacy Master") when a student completes a full learning pathway. |
|   |  | UC 4.2: Display User Point Status | A user's accumulated points for activities (completing modules, taking quizzes) are displayed on their profile, encouraging continued engagement. |
| 5 | Virtual Assistant & Support | UC 5.1: Non-Crisis Information Retrieval | A user asks the chatbot a common question ("What is depression?") and receives an accurate, resource-linked answer from the content library. |
|   |  | UC 5.2: Crisis Triage and Redirection | The chatbot detects high-risk keywords ("suicidal," "self-harm") and instantly provides a static, emergency hotline message, bypassing other functions. |
| 6 | Community Support | UC 6.1: Post to a Moderated Discussion | A student creates a new, anonymous post in a category-specific forum (e.g., "Academic Stress") to seek peer advice. |
|   |  | UC 6.2: Content Moderation & Reporting | A trained moderator reviews all new posts for approval and can flag/remove content that violates platform safety guidelines. |
| 7 | Professional Appointment & Virtual Counseling | UC 7.1: Counselor Appointment Booking | A student views the calendar of available university counselors and books an open time slot. |
|   |  | UC 7.2: Launch Secure Virtual Session | At the scheduled time, both the counselor and student launch a secure, in-app video conference for a private session. |
| 8 | Admin Reporting & System Analytics | UC 8.1: Generate Platform Usage Reports | An administrator queries the database to generate reports on key metrics (e.g., number of active users, average module completion rate). |
|   |  | UC 8.2: User Feedback Submission and Review | A user submits a feedback form about their experience; an administrator reviews the feedback to identify areas for improvement. |


---

## Prerequisites

Before running the project, ensure the following are installed:

1. **Java 17+** (Java 25 recommended)  
   - [Download Java JDK](https://adoptium.net)  
   - Set `JAVA_HOME` to your JDK folder  

2. **Apache Maven 3.6+** (3.9.11 recommended)  
   - [Download Maven](https://maven.apache.org/download.cgi)  
   - Set `MAVEN_HOME` and add `%MAVEN_HOME%\bin` to `PATH`  

3. **Apache Tomcat**  
   - **Tomcat 11** recommended (Jakarta EE 10)  
   - [Download Tomcat 11](https://tomcat.apache.org/download-11.cgi)  
   - Optional: Tomcat 9 for legacy apps  

4. **VSCode** (optional but recommended)  
   - Install **Java Extension Pack**  
   - Install **Tomcat for Java extension**  
