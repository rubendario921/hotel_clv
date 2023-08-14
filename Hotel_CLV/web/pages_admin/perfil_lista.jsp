<%-- 
    Document   : listado_perfiles
    Created on : 10/08/2023, 13:07:32
    Author     : Ruben Dario
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Perfiles"%>
<%@page import="Controller.PerfilesDao"%>
<%@page import="java.util.*"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>    
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
                                <td aling="rigth"><a href="perfil_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Perfil"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Letra</th>
                                    <th>Nombre</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Extraer la informacion de la java class-->
                                <%
                                    PerfilesDao mostrar_perfiles = new PerfilesDao();
                                    List<Perfiles> perfiles = mostrar_perfiles.mostrarLista();
                                    for (Perfiles perfil : perfiles) {%>
                                <tr>
                                    <td><%= perfil.getPerfilId()%></td>
                                    <td><%= perfil.getPerfilLetra()%></td>
                                    <td><%= perfil.getPerfilNombre()%></td>
                                    <td>                        
                                        <!--modificar update=":tabMostrar"-->
                                        <a href="perfil_editar.jsp?editar=true&id=<%=perfil.getPerfilId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--eliminar update=":tabMostrar"-->
                                        <a href="Mantenimiento_admin/crudperfil_eliminar.jsp?eliminar=true&id=<%=perfil.getPerfilId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
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
