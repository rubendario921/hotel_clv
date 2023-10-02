/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Ruben Dario
 */
public class PrefijosDao {

    conexion con = new conexion();

    public List<Prefijos> mostrarListaPrefijos() {
        List<Prefijos> prefijos = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.prefijos;";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int prefijoId = rs.getInt("perfiCont_id");
                String prefijoCodigo = rs.getString("perfiCont_codigo");
                String prefijoPais = rs.getString("perfiCont_pais");

                Prefijos prefijo = new Prefijos(prefijoId, prefijoCodigo, prefijoPais);
                prefijos.add(prefijo);
            }
            rs.close();
            pst.close();
            
        } catch (SQLException e) {
            System.out.println("Error en PrefijosDao mostrarListaPrefijos: " +e.getMessage());
        } finally {
        }
        return prefijos;
    }

}
