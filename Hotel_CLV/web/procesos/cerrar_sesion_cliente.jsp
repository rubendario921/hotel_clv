<%-- 
    Document   : cerrar_sesion_cliente
    Created on : 25-jul-2023, 16:37:38
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    // Cierra la sesión de usuario
    session.invalidate();

    // Redirecciona al usuario a la página de inicio de sesión (login)
    response.sendRedirect("login_admin.jsp");
%>

