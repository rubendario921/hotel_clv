<%-- 
    Document   : listado_estados
    Created on : 11-ago-2023, 1:22:29
    Author     : Ruben Dario 921
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="java.util.*"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/header_admin.jsp" %>

<!DOCTYPE html>    
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
                                    <th>Codigo</th>
                                    <th>Letra</th>
                                    <th>Descripcion</th>
                                    <th>Categoria</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Extraer la informacion de la java class-->
                                <%
                                    EstadosDao mostrar_estados = new EstadosDao();
                                    List<Estados> estados = mostrar_estados.mostrarListaEstados();
                                    for (Estados estado : estados) {%>
                                <tr>
                                    <td><%= estado.getEstaId()%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(estado.getEstaLetra())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></td>
                                    <!--Union con otra tabla y muestra el resultado -->
                                    <td><%= estado.getCatId()%></td>
                                    <td>                        
                                        <!--modificar update=":tabMostrar"-->
                                        <a href="estados_editar.jsp?editar=true&id=<%=estado.getEstaId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--eliminar update=":tabMostrar"-->
                                        <a href="Mantenimiento_admin/crudestado_eliminar.jsp?eliminar=true&id=<%=estado.getEstaId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
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

