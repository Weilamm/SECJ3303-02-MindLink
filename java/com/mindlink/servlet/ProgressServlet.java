package com.mindlink.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/progressServlet")
public class ProgressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String action = request.getParameter("action");
        String lessonId = request.getParameter("lessonId");
        
        HttpSession session = request.getSession();
        System.out.println("[ProgressServlet] Action: " + action + ", LessonId: " + lessonId + ", SessionId: " + session.getId());
        
        @SuppressWarnings("unchecked")
        Set<String> completedLessons = (Set<String>) session.getAttribute("completedLessons");
        if (completedLessons == null) {
            completedLessons = new HashSet<>();
            session.setAttribute("completedLessons", completedLessons);
        }
        
        if ("mark".equals(action) && lessonId != null) {
            completedLessons.add(lessonId);
            System.out.println("[ProgressServlet] Added lesson: " + lessonId + ", Total: " + completedLessons.size());
            out.print("{\"status\":\"success\",\"message\":\"Lesson marked as done\"}");
        } else if ("get".equals(action)) {
            // Return all completed lessons as JSON array
            List<String> lessons = new ArrayList<>(completedLessons);
            System.out.println("[ProgressServlet] Getting lessons, Count: " + lessons.size() + ", Lessons: " + lessons);
            StringBuilder json = new StringBuilder();
            json.append("{\"status\":\"success\",\"completedLessons\":[");
            for (int i = 0; i < lessons.size(); i++) {
                if (i > 0) json.append(",");
                json.append("\"").append(lessons.get(i)).append("\"");
            }
            json.append("]}");
            out.print(json.toString());
        } else {
            out.print("{\"status\":\"error\",\"message\":\"Invalid action\"}");
        }
        out.flush();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
