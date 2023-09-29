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
public class TipoDocumentoDao {

    conexion con = new conexion();

    public List<TipoDocumentos> mostrarListaTipoDocumento() {
        List<TipoDocumentos> tipodocumentos = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.tipodocumento;";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int docId = rs.getInt("docI_id");
                String docLetra = rs.getString("docI_letra");
                String docNombre = rs.getString("docI_nombre");

                TipoDocumentos tipodocum = new TipoDocumentos(docId, docLetra, docNombre);
                tipodocumentos.add(tipodocum);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error TipoDocumentoDao mostrarListaTipoDocumento: " + e.getMessage());
        }
        return tipodocumentos;
    }

}
