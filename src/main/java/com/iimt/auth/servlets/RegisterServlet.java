package com.iimt.auth.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.iimt.auth.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String confirm = req.getParameter("confirm");

        try {
            if (name == null || name.isBlank() ||
                email == null || email.isBlank() ||
                pass == null || pass.length() < 6) {
                req.setAttribute("error", "Please fill all fields (password min 6 chars).");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
                return;
            }
            if (!pass.equals(confirm)) {
                req.setAttribute("error", "Passwords do not match.");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
                return;
            }
            if (userDAO.emailExists(email)) {
                req.setAttribute("error", "Email already registered. Try logging in.");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
                return;
            }

            String hash = BCrypt.hashpw(pass, BCrypt.gensalt(10));
            userDAO.createUser(name, email, hash);
            req.setAttribute("success", "Registration successful! Please log in.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Server error: " + e.getMessage());
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}
