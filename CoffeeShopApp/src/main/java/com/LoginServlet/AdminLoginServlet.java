package com.LoginServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    @SuppressWarnings("unused")
    private static final long serialVersionUID = 1L;

    // Hard-coded username and password for this example
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "admin@2183";

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the submitted username and password from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if the credentials match the hard-coded values
        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
            // Credentials match, redirect to the Display.jsp page
            response.sendRedirect("Display.jsp");
        } else {
            // Credentials do not match, set an error message and forward back to the login page
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
        }
    }
}
