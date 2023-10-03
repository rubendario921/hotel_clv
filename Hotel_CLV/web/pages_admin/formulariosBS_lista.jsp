<%-- 
    Document   : formularios_lista
    Created on : 23/08/2023, 21:01:20
    Author     : Wladimir Campaña
--%>
<%@page import="Controller.colorNotificaciones"%>
<%@page import="Controller.colorNotificacionesDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Formularios"%>
<%@page import="Controller.FormulariosDao"%>
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
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Atención al Cliente</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Buzón de Sugerencias</h3></td>                                
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>                                    
                                    <th>Nombre</th>
                                    <th>Correo</th>
                                    <th>Telefono</th>
                                    <th>Asunto</th>
                                    <th>Mensaje</th>
                                    <th>Ciudad</th>
                                    <th>Estado</th>
                                    <th>Acción</th>                                        
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    EstadosDao mostrarEstado = new EstadosDao();
                                    List<Estados> estados = mostrarEstado.mostrarListaEstados();

                                    colorNotificacionesDao mostrarColorN = new colorNotificacionesDao();
                                    List<colorNotificaciones> colornotificaciones = mostrarColorN.mostrarListaColor();

                                    FormulariosDao mostrar_formularios = new FormulariosDao();
                                    List<Formularios> formularios = mostrar_formularios.mostrarListaFormu();
                                    for (Formularios formulario : formularios) {

                                        int estadoFormu = formulario.getEstaId();
                                        String nombreEstado = "";
                                        String colorEstado = "";
                                        for (Estados estado : estados) {
                                            if (estado.getEstaId() == estadoFormu) {
                                                nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                int colorEstadoId = estado.getColorNotiId();
                                                for (colorNotificaciones colorNoti : colornotificaciones) {
                                                    if (colorNoti.getColorNId()== colorEstadoId) {
                                                        colorEstado = StringEscapeUtils.escapeHtml4(colorNoti.getColorNcodigo());
                                                        break;
                                                    }
                                                }
                                                break;
                                            }
                                        }%>
                                <tr>                                    
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuNombre())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuCorreo())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuTelefono())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuAsunto())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuMensaje())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuCiudad())%></td>
                                    <td style="color: <%= colorEstado%>"><b><%= nombreEstado%></b></td>                                    
                                    <td>
                                        <!--Modificar Insumo-->
                                        <%
                                            if (nombreEstado.equals("PENDIENTE")){%>
                                        <a href="formulariosBS_editar.jsp?editar=true&id=<%=formulario.getFormuId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <% }%>
                                        <!--Eliminar Insumo-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudformulariosBS_eliminar.jsp?eliminar=true&id=<%=formulario.getFormuId()%>" class="btn btn-danger" onclick="return confirmarEliminacion();"><i class="fa fa-trash" title="Eliminar" name="eliminar" disable="true"></i></a>
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