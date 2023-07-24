<%-- 
    Document   : crudregistrar_admin
    Created on : 20-jul-2023, 12:08:52
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
        String usu = request.getParameter("usu");
        String pass = request.getParameter("pass");
        int cont = Integer.parseInt(request.getParameter("cont"));
        String corr = request.getParameter("corr");
        int perfil = Integer.parseInt(request.getParameter("perfil"));

        String sql = "INSERT INTO proyecto_integrador.empleados (emp_nombres, emp_apellidos, emp_cedula, emp_usuario, emp_clave, emp_contacto, emp_correo, emp_perfil, emp_estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement pst = con.getConexion().prepareStatement(sql);
        pst.setString(1, nom);
        pst.setString(2, ape);
        pst.setString(3, cedu);
        pst.setString(4, usu);
        pst.setString(5, pass);
        pst.setInt(6, cont);
        pst.setString(7, corr);
        pst.setInt(8, perfil);
        pst.setString(9, "A");
        int n = pst.executeUpdate();
        if (n > 0) {
            out.print("<script>alert('Registro Guardado')</script>");
            out.print("<script>window.location.href='../listado_empleados.jsp'</script>");
        } else {
            out.print("<script>alert('Registro NO Guardado')</script>");
            out.print("<script>window.location.href='../registro_admin.jsp'</script>");
        }
    }
%>