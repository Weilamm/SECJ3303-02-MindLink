package com.mindlink.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        // Mock forgot password logic
        if (email != null && !email.isEmpty()) {
            request.setAttribute("message", "If an account exists for " + email + ", a reset link has been sent.");
            request.setAttribute("mode", "forgot");
        } else {
            request.setAttribute("error", "Please enter your email address.");
            request.setAttribute("mode", "forgot");
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
