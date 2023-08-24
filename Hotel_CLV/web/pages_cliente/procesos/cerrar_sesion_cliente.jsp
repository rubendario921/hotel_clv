<%-- 
    Document   : cerrar_sesion_cliente
    Created on : 25-jul-2023, 16:37:38
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
// Agrega los encabezados para evitar el almacenamiento en caché
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
// Cierra la sesión de usuario
    session.invalidate();

    // Redirecciona al usuario a la página de inicio de sesión (login)
    response.sendRedirect("../../login_cliente.jsp");
%>