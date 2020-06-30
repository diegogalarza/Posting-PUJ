package com.sdp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "Servlet", urlPatterns = "/posgrado")
public class PosgradoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Connection connection = null;
        String query = "select master_nombre from master";

        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/SDP_INGESOFT";
            String usuario = "juancmartinez";
            String clave = "adminsdp";
            connection = DriverManager.getConnection(jdbcUrl, usuario, clave);

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            while(rs.next()){
                System.out.format("%s", rs.getString("master_nombre"));
            }

            request.getRequestDispatcher("posgrado.jsp").forward(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("posgrado.jsp").forward(request, response);

        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
