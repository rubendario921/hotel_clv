<%-- 
    Document   : colorNotificacion_lista
    Created on : 30-sep-2023, 0:00:50
    Author     : User
--%>

<%@page import="Controller.colorNotificaciones"%>
<%@page import="Controller.colorNotificacionesDao"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Colores del Sistema</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Listado de Colores</h3></td>
                                <td align="rigth"><a href="#" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre del Color</th>
                                    <th># Código Html</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    colorNotificacionesDao mostrarColor = new colorNotificacionesDao();
                                    List<colorNotificaciones> colorNotificacion = mostrarColor.mostrarListaColor();
                                    for (colorNotificaciones colorNoti : colorNotificacion) {
                                %>
                                <tr>
                                    <td><%= colorNoti.getColorNId()%></td>
                                    <td style="color: <%= colorNoti.getColorNcodigo()%>"><b><%= StringEscapeUtils.escapeHtml4(colorNoti.getColorNNombre())%></b></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(colorNoti.getColorNcodigo())%></td>
                                    <td><a href="?editar=true&id=<%= colorNoti.getColorNId()%>" class="btn btn-warning"> <i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--eliminar update=":tabMostrar"-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="?eliminar=true&id_cate=<%= colorNoti.getColorNId()%>"class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
                                            <% }%>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <a href="menu_admin.jsp" class="btn btn-block btn-primary" >Menu Principal</a>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>