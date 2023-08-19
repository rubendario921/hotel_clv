<%-- 
    Document   : insumos_lista
    Created on : 16/08/2023, 9:44:21
    Author     : Wladimir Campaña
--%>

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
                                    InsumosDao lista_insumos = new InsumosDao();
                                    List<Insumos> insumos = lista_insumos.mostrarListaInsumos();
                                    for (Insumos insumo : insumos) {%>
                                <tr>
                                    <td><%=insumo.getInsuId()%></td>
                                    <td><%=insumo.getInsuNombre()%></td>
                                    <td><%=insumo.getInsuDetalle()%></td>
                                    <td><%=insumo.getInsuCantidad()%></td>
                                    <td><%=insumo.getInsuValor()%></td>
                                    <td><%=insumo.getInsuImagen()%></td>
                                    <td><%=insumo.getEstaId()%></td>
                                    <td>
                                        <!--Modificar Insumo-->
                                        <a href="#?editar=true&id=<%=insumo.getInsuId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar" disable="true"></i></a>
                                        <!--Eliminar Insumo-->
                                        <a href="#?eliminar=true&id=<%=insumo.getInsuId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar" disable="true"></i></a>
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
