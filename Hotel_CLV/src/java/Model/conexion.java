/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;

/**
 *
 * @author Ruben Dario 921
 */
public class conexion {

    private Connection con;

    public Connection getConexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_clv?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=UTF-8", "root", "12345");            

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al obtener la conexión: " + e.getMessage());
        }
        return con;
    }

    public void close() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }

}
