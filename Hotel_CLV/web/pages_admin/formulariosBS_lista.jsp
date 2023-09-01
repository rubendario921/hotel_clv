<%-- 
    Document   : formularios_lista
    Created on : 23/08/2023, 21:01:20
    Author     : Wladimir Campaña
--%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Formularios"%>
<%@page import="Controller.FormulariosDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>

<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
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
                                <td aling="rigth"><a href="formulariosBS_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Código</th>
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

                                    FormulariosDao mostrar_formularios = new FormulariosDao();
                                    List<Formularios> formularios = mostrar_formularios.mostrarListaFormu();
                                    for (Formularios formulario : formularios) {
                                        int estadoFormu = formulario.getEstaId();
                                        String nombreEstado = "";
                                        for (Estados estado : estados) {
                                            if (estado.getEstaId() == estadoFormu) {
                                                nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                break;
                                            }
                                        }%>
                                <tr>
                                    <td><%= formulario.getFormuId()%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuNombre())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuCorreo())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuTelefono())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuAsunto())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuMensaje())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuCiudad())%></td>
                                    <td><%= nombreEstado%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(formulario.getFormuObservacion())%></td>
                                    <td>
                                        <!--Modificar Insumo-->
                                        <a href="formulariosBS_editar.jsp?editar=true&id=<%=formulario.getFormuId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--Eliminar Insumo-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudformulariosBS_eliminar.jsp?eliminar=true&id=<%=formulario.getFormuId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar" disable="true"></i></a>
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