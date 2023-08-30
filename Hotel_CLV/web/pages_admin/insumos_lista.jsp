<%-- 
    Document   : insumos_lista
    Created on : 16/08/2023, 9:44:21
    Author     : Wladimir Campaña
--%>

<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="Controller.Insumos"%>
<%@page import="java.util.*"%>
<%@page import="Controller.InsumosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
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
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Detalle</th>
                                    <th>Cantidad</th>
                                    <th>Valor</th>
                                    <th>Imagen</th>
                                    <th>Estados</th>
                                    <th>Accion</th>                                        
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    EstadosDao mostrarEstado = new EstadosDao();
                                    List<Estados> estados = mostrarEstado.mostrarListaEstaProductos();

                                    InsumosDao lista_insumos = new InsumosDao();
                                    List<Insumos> insumos = lista_insumos.mostrarListaInsumos();
                                    for (Insumos insumo : insumos) {
                                        int estadoInsu = insumo.getEstaId();
                                        String nombreEstado = "";
                                        for (Estados estado : estados) {
                                            if (estado.getEstaId()==estadoInsu) {
                                                nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                break;
                                            }
                                        }%>
                                <tr>
                                    <td><%= insumo.getInsuId()%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(insumo.getInsuNombre())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(insumo.getInsuDetalle())%></td>
                                    <td><%= insumo.getInsuCantidad()%></td>
                                    <td><%= insumo.getInsuValor()%></td>                                    
                                    <td><img class="img-fluid" src="../<%= StringEscapeUtils.escapeHtml4(insumo.getInsuImagen())%>" height="100" width="100"></td>
                                    <td><%= nombreEstado%></td>
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