package com.mindlink.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Mock authentication logic
        if ("user@example.com".equals(email) && "password".equals(password)) {
            // save a simple session attribute to mark the user as logged in
            request.getSession().setAttribute("userEmail", email);
            // redirect to home.jsp after successful login to avoid form resubmission
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
}
