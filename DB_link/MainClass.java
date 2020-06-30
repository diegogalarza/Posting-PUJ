package com.sdp;

import java.sql.*;

import static com.sdp.Constants.*;

public class MainClass {


    public static void main(String[] args) throws Exception {


        /* TODO: IMPLEMENTAR TABLAS DE POSGRADOS, CURSOS, FAQ Y REVISAR
        *  TODO: Implementar HttpSession
        *  TODO: Validar sesion juancmartinez */
        mostrar();

    }

    public static String mostrar() throws SQLException {
        Connection connection = null;

        String pregunta = null;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/SDP_INGESOFT?useTimezone=true&serverTimezone=UTC", "juancmartinez", "adminsdp");

            // our SQL SELECT query.
            // if you only need a few columns, specify them by name instead of using "*"
            String query = "SELECT * FROM master";

            // create the java statement
            Statement st = connection.createStatement();

            // execute the query, and get a java result set
            ResultSet rs = st.executeQuery(query);
            System.out.print("Antes del while");
            // iterate through the java result set
            while (rs.next()) {
                //int masterID = rs.getInt("MASTER_master_id");
                // print the results

                System.out.format("%s",rs.getString("master_nombre"));

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print("Clase no encontrada\n");
        } catch (SQLException e) {
            //Handle errors for JDBC
            e.printStackTrace();
            System.out.print("Excepcion SQL\n");
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
            System.out.print("Excepcion General\n");
        }

        connection.close();

        return pregunta;
    }
}
