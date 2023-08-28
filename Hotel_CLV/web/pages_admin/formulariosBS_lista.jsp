<%-- 
    Document   : formularios_lista
    Created on : 23/08/2023, 21:01:20
    Author     : Wladimir Campaña
--%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="Controller.Formularios"%>
<%@page import="java.util.*"%>
<%@page import="Controller.FormulariosDao"%>
<%@include file="template/header_admin.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        var codigo = document.getElementById("codigo").value.trim();
        var nombre = document.getElementById("nombre").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var asunto = document.getElementById("asunto").value.trim();
        var mensaje = document.getElementById("mensaje").value.trim();
        var ciudad = document.getElementById("ciudad").value.trim();
        var accion = document.getElementById("accion").value.trim();
        if (codigo === "" || nombre === "" || correo === "" || telefono === "" || asunto === "" || mensaje === "" || ciudad === "" || accion === ""){
       
        alert("Por favor, complete todos los campos.");
        return false;
        }
        return true;
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Formulario</h1>
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
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Correo</th>
                                    <th>Telefono</th>
                                    <th>Asunto</th>
                                    <th>Mensaje</th>
                                    <th>Ciudad</th>
                                    <th>Accion</th>                                        
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FormulariosDao mostrar_formularios = new FormulariosDao();
                                   List<Formularios> formularios = mostrar_formularios.mostrarListaFormu();
                                    for (Formularios formulario : formularios) {%>
                                <tr>
                                    <td><%=formulario.getFormuId()%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(formulario.getFormuNombre())%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(formulario.getFormuCorreo())%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(formulario.getFormuTelefono())%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(formulario.getFormuAsunto())%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(formulario.getFormuMensaje())%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(formulario.getFormuCiudad())%></td>
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
