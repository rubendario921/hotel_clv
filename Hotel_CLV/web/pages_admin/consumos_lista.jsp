<%-- 
    Document   : consumos_lista
    Created on : 27/08/2023, 21:27:29
    Author     : Johns 
--%>

<%@page import="Controller.Consumos"%>
<%@page import="Controller.FormulariosDao"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.util.*"%>
<%@include file="template/header_admin.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script> 
    function validarFormulario() {
        var codigo = document.getElementById("codigo").value.trim();
        var nombre = document.getElementById("nombre").value.trim();
        var detalle = document.getElementById("detalle").value.trim();
        var cantidad = document.getElementById("cantidad").value.trim();
        var valor = document.getElementById("valor").value.trim();
        var dimg = document.getElementById("dimg").value.trim();
        var accion = document.getElementById("accion").value.trim();
        if (codigo === "" ||nombre === "" ||detalle === "" ||cantidad === "" ||valor === "" ||dimg === "" ||accion === "") {
            
            alert("Por Favor, complete todos los campos");
            return false;
        }
        return true;
    }
 </script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Consumos</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Consumos</h3></td>
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
                                    <th>Acción</th>                                        
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ConsumosDao mostrar_consumos = new ConsumosDao();
                                   List<Consumos> consumos = mostrar_consumos.mostrarListaConsumos();
                                    for (Consumos consumo : consumos) {%>
                                <tr>
                                    <td><%= consumo.getConsuId()%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(consumo.getConsuNombre()) %></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(consumo.getConsuDetalle())%></td>
                                    <td><%= consumo.getConsuCantidad()%></td>
                                    <td><%= consumo.getConsuValor() %></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(consumo.getConsuImagen()) %></td>
                                    <td><%= consumo.getEstaId()%></td>
                                    <td>
                                       <!--Modificar Insumo-->
                                       <a href="consumos_editar.jsp?editar=true&id=<%=consumo.getConsuId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--Eliminar Insumo-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudconsumos_eliminar.jsp?eliminar=true&id=<%=consumo.getConsuId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar" disable="true"></i></a>
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
