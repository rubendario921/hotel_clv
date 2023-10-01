<%-- 
    Document   : insumos_lista
    Created on : 16/08/2023, 9:44:21
    Author     : Wladimir Campaña
--%>

<%@page import="Controller.colorNotificaciones"%>
<%@page import="Controller.colorNotificacionesDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="Controller.Insumos"%>
<%@page import="java.util.*"%>
<%@page import="Controller.InsumosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h1 class="page-header">Insumos del Hotel</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Insumos</h3></td>
                                <td aling="rigth"><a href="insumos_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>s
                                    <th>Nombre</th>
                                    <th>Detalle</th>
                                    <th>Cantidad</th>
                                    <th>Valor</th>
                                    <th>Imagen</th>
                                    <th>Estados</th>
                                    <th>Acción</th>                                        
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    EstadosDao mostrarEstado = new EstadosDao();
                                    List<Estados> estados = mostrarEstado.mostrarListaEstados();

                                    colorNotificacionesDao mostrarColorN = new colorNotificacionesDao();
                                    List<colorNotificaciones> colornotificaciones = mostrarColorN.mostrarListaColor();

                                    InsumosDao lista_insumos = new InsumosDao();
                                    List<Insumos> insumos = lista_insumos.mostrarListaInsumos();
                                    for (Insumos insumo : insumos) {

                                        int estadoInsu = insumo.getEstaId();
                                        String nombreEstado = "";
                                        String colorEstado = "";
                                        for (Estados estado : estados) {
                                            if (estado.getEstaId() == estadoInsu) {
                                                nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                int colorEstadoId = estado.getColorNotiId();
                                                for (colorNotificaciones colorNoti : colornotificaciones) {
                                                    if (colorNoti.getColorNId() == colorEstadoId) {
                                                        colorEstado = StringEscapeUtils.escapeHtml4(colorNoti.getColorNcodigo());
                                                        break;
                                                    }
                                                }
                                                break;
                                            }
                                        }%>
                                <tr>
                                    <td><%= StringEscapeUtils.escapeHtml4(insumo.getInsuNombre())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(insumo.getInsuDetalle())%></td>
                                    <td><%= insumo.getInsuCantidad()%></td>
                                    <td><%= insumo.getInsuValor()%></td>                                    
                                    <td><img class="img-fluid" src="../<%= StringEscapeUtils.escapeHtml4(insumo.getInsuImagen())%>" height="100" width="100"></td>
                                    <td style="color: <%= colorEstado%>"><b><%= nombreEstado%></b></td>
                                    <td>
                                        <!--Modificar Insumo-->
                                        <a href="insumos_editar.jsp?editar=true&id=<%= insumo.getInsuId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--Eliminar Insumo-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudinsumos_eliminar.jsp?eliminar=true&id=<%= insumo.getInsuId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar" disable="true"></i></a>
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