<%-- 
    Document   : listado_perfiles
    Created on : 10/08/2023, 13:07:32
    Author     : Ruben Dario
--%>

<%@page import="Model.conexion"%>
<%@page import="Controller.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--Tabla para mostrar el listado de los perfiles-->
        <table id="tabMostrar"> 
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Letra</th>
                    <th>Nombre</th>                    
                </tr>
            </thead>
            <tbody>
                <!--Extraer la informacion de la java class-->
                <%
                    PerfilesDao mostrar_perfiles = new PerfilesDao();
                    List<perfiles> perfiles = mostrar_perfiles.mostrarLista();
                    for (perfiles perfil : perfiles) {%>
                <tr>
                    <td><%= perfil.getPerfilId()%></td>
                    <td><%= perfil.getPerfilLetra()%></td>
                    <td><%= perfil.getPerfilNombre()%></td>
                    <td>                        
                        <!--modificar update=":tabMostrar"-->
                        <!--eliminar update=":tabMostrar"-->
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
