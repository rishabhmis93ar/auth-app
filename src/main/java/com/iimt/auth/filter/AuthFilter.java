package com.iimt.auth.filter;

import java.io.IOException;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

@WebFilter(urlPatterns = {"/dashboard.jsp"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        boolean loggedIn = (session != null && session.getAttribute("userId") != null);

        if (!loggedIn) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp?redirect=1");
            return;
        }
        chain.doFilter(request, response);
    }
}
