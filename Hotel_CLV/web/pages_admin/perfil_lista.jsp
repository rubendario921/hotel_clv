<%-- 
    Document   : listado_perfiles
    Created on : 10/08/2023, 13:07:32
    Author     : Ruben Dario
--%>


<%@page import="Controller.colorNotificaciones"%>
<%@page import="Controller.colorNotificacionesDao"%>
<%@page import="Controller.Perfiles"%>
<%@page import="Controller.PerfilesDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function confirmarEliminacion() {
        var confirmacion = confirm("¿Seguro de que deseas eliminar este registro?");
        return confirmacion; // Devolver true si el usuario hace clic en OK, de lo contrario, false
    }
</script>
<!--Tabla para mostrar el listado de los perfiles-->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Perfiles del Sistema</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Perfiles</h3></td>
                                <td align="rigth"><a href="perfil_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Letra</th>
                                    <th>Nombre</th>
                                    <th>Color</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Extraer la informacion de la java class-->
                                <%
                                    //Lista de Colores para la consulta
                                    colorNotificacionesDao mostrarColor = new colorNotificacionesDao();
                                    List<colorNotificaciones> colorNotificacion = mostrarColor.mostrarListaColor();

                                    PerfilesDao mostrar_perfiles = new PerfilesDao();
                                    List<Perfiles> perfiles = mostrar_perfiles.mostrarListaPerfil();
                                    for (Perfiles perfil : perfiles) {

                                        int perfilColor = perfil.getColorNotiId();
                                        String codigoColor = "";
                                        for (colorNotificaciones colorNoti : colorNotificacion) {
                                            if (colorNoti.getColorNId() == perfilColor) {
                                                codigoColor = StringEscapeUtils.escapeHtml4(colorNoti.getColorNcodigo());
                                            }
                                        }
                                %>
                                <tr>                                   
                                    <td><%= StringEscapeUtils.escapeHtml4(perfil.getPerfilLetra())%></td>                                    
                                    <td><%= StringEscapeUtils.escapeHtml4(perfil.getPerfilNombre())%></td>
                                    <td>
                                        <label class="bg bg-white" style="color: <%= codigoColor%>">■■■■</label>
                                    </td>
                                    <td>                        
                                        <!--modificar update=":tabMostrar"-->
                                        <a href="perfil_editar.jsp?editar=true&id=<%= perfil.getPerfilId()%>" class="btn btn-warning"> <i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--eliminar update=":tabMostrar"-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudperfil_eliminar.jsp?eliminar=true&id=<%= perfil.getPerfilId()%>"class="btn btn-danger" onclick="return confirmarEliminacion();"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
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