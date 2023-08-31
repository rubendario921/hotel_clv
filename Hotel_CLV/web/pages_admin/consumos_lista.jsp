<%-- 
    Document   : consumos_lista
    Created on : 27/08/2023, 21:27:29
    Author     : Johns 
--%>

<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Consumos"%>
<%@page import="Controller.FormulariosDao"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Consumos del Hotel</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Consumos</h3></td>
                                <td aling="rigth"><a href="consumos_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre</th>
                                    <th>Detalle</th>
                                    <th>Cantidad</th>
                                    <th>Valor</th>
                                    <th>Imagen</th>
                                    <th>Estado</th>
                                    <th>Acción</th>                                        
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    EstadosDao mostrarEstado = new EstadosDao();
                                    List<Estados> estados = mostrarEstado.mostrarListaEstaProductos();

                                    ConsumosDao lista_consumos = new ConsumosDao();
                                    List<Consumos> consumos = lista_consumos.mostrarListaConsumos();
                                    for (Consumos consumo : consumos) {
                                        int estadoConsu = consumo.getEstaId();
                                        String nombreEstado = "";
                                        for (Estados estado : estados) {
                                            if (estado.getEstaId() == estadoConsu) {
                                                nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                break;
                                            }
                                        }%>
                                <tr>
                                    <td><%= consumo.getConsuId()%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(consumo.getConsuNombre())%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(consumo.getConsuDetalle())%></td>
                                    <td><%= consumo.getConsuCantidad()%></td>
                                    <td><%= consumo.getConsuValor()%></td>
                                    <td><img class="img-fluid" src="../<%= StringEscapeUtils.escapeHtml4(consumo.getConsuImagen())%>" height="100" width="100"></td>
                                    <td><%= nombreEstado%></td>
                                    <td>
                                        <!--Modificar Insumo-->
                                        <a href="consumos_editar.jsp?editar=true&id=<%=consumo.getConsuId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--Eliminar Insumo-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudconsumos_eliminar.jsp?eliminar=true&id=<%= consumo.getConsuId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar" disable="true"></i></a>
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
