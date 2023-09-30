<%-- 
    Document   : listado_estados
    Created on : 11-ago-2023, 1:22:29
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.colorNotificaciones"%>
<%@page import="Controller.colorNotificacionesDao"%>
<%@page import="Controller.Categorias"%>
<%@page import="Controller.CategoriasDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/header_admin.jsp" %>

<!DOCTYPE html>    
<script>
    function confirmarEliminacion() {
        var confirmacion = confirm("¿Está seguro de que deseas eliminar este registro?");
        return confirmacion; // Devolver true si el usuario hace clic en OK, de lo contrario, false
    }
</script>

<!--Tabla para mostrar el listado de los perfiles-->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Estados del Sistema</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Listado de Estados</h3></td>
                                <td aling="rigth"><a href="estados_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table"> 
                            <thead>
                                <tr>
                                    <th>Letra</th>
                                    <th>Descripción</th>
                                    <th>Color</th>
                                    <th>Categoría</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Extraer la informacion de la java class-->
                                <%
                                    //Lista de Categorias para la consulta
                                    CategoriasDao mostrarCategoria = new CategoriasDao();
                                    List<Categorias> categorias = mostrarCategoria.mostrarListaCategorias();

                                    //Lista de Colores para la consulta
                                    colorNotificacionesDao mostrarColor = new colorNotificacionesDao();
                                    List<colorNotificaciones> colorNotificacion = mostrarColor.mostrarListaColor();

                                    //Lista de Estados para la consulta
                                    EstadosDao mostrar_estados = new EstadosDao();
                                    List<Estados> estados = mostrar_estados.mostrarListaEstados();
                                    for (Estados estado : estados) {

                                        int estadoCatId = estado.getCatId();
                                        String nombreCategoria = "";
                                        for (Categorias categoria : categorias) {
                                            if (categoria.getCatId() == estadoCatId) {
                                                nombreCategoria = StringEscapeUtils.escapeHtml4(categoria.getCatNombre());
                                                break;
                                            }
                                        }

                                        int estadoColor = estado.getColorNotiId();
                                        String codigoColor = "";
                                        for (colorNotificaciones colorNoti : colorNotificacion) {
                                            if (colorNoti.getColorNId() == estadoColor) {
                                                codigoColor = StringEscapeUtils.escapeHtml4(colorNoti.getColorNcodigo());
                                            }
                                        }

                                %>
                                <tr>                                    
                                    <td><%= StringEscapeUtils.escapeHtml4(estado.getEstaLetra())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></td>
                                    <!--Union con otra tabla y muestra el resultado -->
                                    <td>
                                        <label class="bg bg-white" style="color: <%= codigoColor%>">■■■■</label>
                                    </td>
                                    <td><%= nombreCategoria%></td>
                                    <td>                        
                                        <!--modificar update=":tabMostrar"-->
                                        <a href="estados_editar.jsp?editar=true&id=<%= estado.getEstaId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--eliminar update=":tabMostrar"-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudestado_eliminar.jsp?eliminar=true&id=<%= estado.getEstaId()%>" class="btn btn-danger" onclick="return confirmarEliminacion();">
                                            <i class="fa fa-trash" title="Eliminar" name="eliminar"></i>
                                        </a>
                                            <% }%>
                                    </td>
                                </tr>
                                <%}%>
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