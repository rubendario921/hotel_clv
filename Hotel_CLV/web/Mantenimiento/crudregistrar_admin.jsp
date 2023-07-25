<%-- 
    Document   : crudregistrar_admin
    Created on : 20-jul-2023, 12:08:52
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Model.conexion"%>

<%
    conexion con = new conexion();

    if (request.getParameter("nuevo") != null) {
        String nom = request.getParameter("nom");
        String ape = request.getParameter("ape");
        String cedu = request.getParameter("cedu");
        String cont = request.getParameter("cont");
        String corr = request.getParameter("corr");
        String usu = request.getParameter("usu");
        String pass = request.getParameter("pass");
        int perfil = Integer.parseInt(request.getParameter("perfil"));

        String sql = "INSERT INTO personas (per_nombres, per_apellidos, per_cedula,per_telefono,per_correo, per_usuario, per_clave, per_estado, per_perfil) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement pst = con.getConexion().prepareStatement(sql);
        pst.setString(1, nom);
        pst.setString(2, ape);
        pst.setString(3, cedu);
        pst.setString(4, cont);
        pst.setString(5, corr);
        pst.setString(6, usu);
        pst.setString(7, pass);
        pst.setString(8, "A");
        pst.setInt(9, perfil);
        int n = pst.executeUpdate();
        if (n > 0) {
            out.print("<script>alert('Registro Guardado')</script>");
            out.print("<script>window.location.href='../pages_admin/listado_empleados.jsp'</script>");
        } else {
            out.print("<script>alert('Registro NO Guardado')</script>");
            out.print("<script>window.location.href='../pages_admin/registro_admin.jsp'</script>");
        }
    }
%>