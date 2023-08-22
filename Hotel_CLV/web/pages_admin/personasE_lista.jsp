<%-- 
    Document   : listado_empleados
    Created on : 20-jul-2023, 9:45:12
    Author     : Ruben Dario 921
--%>

<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="Controller.Personas"%>
<%@page import="java.util.*"%>
<%@page import="Controller.PersonasDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        var codigo = document.getElementById("codigo").value.trim();
        var nombre = document.getElementById("nombre").value.trim();
        var apellido = document.getElementById("apellido").value.trim();
        var cedula = document.getElementById("cedula").value.trim();
        var usuario = document.getElementById("usuario").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var perfil = document.getElementById("perfil").value.trim();
        var estado = document.getElementById("estado").value.trim();

        if (codigo === "" || nombre === "" || apellido === "" || cedula === "" || usuario === "" || telefono === "" || perfil === "" || estado === "") {

            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }


</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Empleados Registrados</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Empleados</h3></td>
                                <td aling="rigth"><a href="personas_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Cédula</th>
                                    <th>Usuario</th> 
                                    <th>Telefono</th>                                    
                                    <th>Perfil</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    PersonasDao mostrarLista = new PersonasDao();
                                    List<Personas> personas = mostrarLista.mostrarListaPersonasE();
                                    for (Personas persona : personas) {%>
                                <tr>
                                    <td><%=persona.getPerId()%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(persona.getPerNombres())%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(persona.getPerApellidos())%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(persona.getPerCedula())%></td>                                    
                                    <td><%=StringEscapeUtils.escapeHtml4(persona.getPerUsuario())%></td>                                    
                                    <td><%=StringEscapeUtils.escapeHtml4(persona.getPerTelefono())%></td>
                                    <td><%=persona.getPerfilId()%></td>
                                    <td><%=persona.getEstaId()%></td>                                        
                                    <td>
                                        <a href="personas_editar.jsp?editar=true&id=<%=persona.getPerId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <a href="../Mantenimiento/crudeliminar_admin.jsp?eliminar=true&id=<%=persona.getPerId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
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