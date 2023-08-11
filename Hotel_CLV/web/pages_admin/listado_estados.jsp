<%-- 
    Document   : listado_estados
    Created on : 11-ago-2023, 1:22:29
    Author     : Ruben Dario 921
--%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="../template/admin/header_admin.jsp" %>
<!DOCTYPE html>    
<!--Tabla para mostrar el listado de los perfiles-->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div>
                    <h1 class="page-header">Listado de Estados </h1>
                </div>
                <table> 
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Letra</th>
                            <th>Descripcion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--Extraer la informacion de la java class-->
                        <%
                            EstadosDao mostrar_estados = new EstadosDao();
                            List<Estados> estados = mostrar_estados.mostrarEstados();
                            for (Estados estado : estados) {%>
                        <tr>
                            <td><%= estado.getEstaId()%></td>
                            <td><%= estado.getEstaLetra()%></td>
                            <td><%= estado.getEstaDescripcion()%></td>
                            <td>                        
                                <!--modificar update=":tabMostrar"-->
                                <!--eliminar update=":tabMostrar"-->
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="../template/admin/footer_admin.jsp" %>

