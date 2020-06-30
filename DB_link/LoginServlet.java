package com.sdp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uname = request.getParameter("Usuario");
        String pass = request.getParameter("Contra");

        if(uname.equals("juancmartinez") && pass.equals("adminsdp")){
            HttpSession session = request.getSession();
            session.setAttribute("username", "Juan Carlos Martinez");

            response.sendRedirect("admin.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }

    }
}
