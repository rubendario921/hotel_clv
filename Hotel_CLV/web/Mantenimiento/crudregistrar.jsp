<%-- 
    Document   : crudregistrar
    Created on : 19-jul-2023, 12:53:25
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Model.conexion,java.sql.*" %>

<%
    conexion con = new conexion();

    if (request.getParameter("nuevo") != null) {
        String nom = request.getParameter("nom");
        String ape = request.getParameter("ape");
        String cedu = request.getParameter("cedu");
        int cont = Integer.parseInt(request.getParameter("cont"));
        String corr = request.getParameter("corr");
        String pass = request.getParameter("pass");
        //int rol = Integer.parseInt(request.getParameter("rol"));

        String sql = "INSERT INTO usuarios (usu_nombres,usu_apellidos,usu_cedula,usu_contacto,usu_correo,usu_clave,usu_estado)values(?,?,?,?,?,?,?);";
        PreparedStatement pst = con.getConexion().prepareCall(sql);
        pst.setString(1, nom);
        pst.setString(2, ape);
        pst.setString(3, cedu);
        pst.setInt(4, cont);
        pst.setString(5, corr);
        pst.setString(6, pass);
        pst.setString(7, "A");
        int n = pst.executeUpdate();
        if (n > 0) {
            out.print("<script>alert('Registro Guardado')</script>");
            out.print("<script>window.location.href='../login_cliente.jsp'</script>");
        } else {
            out.print("<script>alert('Registro NO Guardado')</script>");
            out.print("<script>window.location.href='../registro.jsp'</script>");
        }
    }
%>