<%-- 
    Document   : categorias_lista
    Created on : 23-ago-2023, 20:27:08
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.Categorias"%>
<%@page import="Controller.CategoriasDao"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Categorias del Sistema</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Categoras</h3></td>
                                <td align="rigth"><a href="categorias_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Categoria</th>
                                    <th>Descripcion</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    CategoriasDao mostrarCategoria = new CategoriasDao();
                                    List<Categorias> categorias = mostrarCategoria.mostrarListaCategorias();
                                    for (Categorias categoria : categorias) {%>
                                <tr>
                                    <td><%= categoria.getCatId()%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(categoria.getCatNombre())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(categoria.getCatDescripcion())%></td>                            
                                    <td>
                                        <!--modificar update=":tabMostrar"-->
                                        <a href="categorias_editar.jsp?editar=true&id=<%= categoria.getCatId()%>" class="btn btn-warning"> <i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--eliminar update=":tabMostrar"-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudcategorias_eliminar.jsp?eliminar=true&id_cate=<%= categoria.getCatId()%>"class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>                                        
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

