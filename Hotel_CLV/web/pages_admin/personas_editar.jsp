<%-- 
    Document   : personas_editar
    Created on : 20-ago-2023, 22:52:48
    Author     : Ruben Dario 921
--%>

<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Perfiles"%>
<%@page import="java.util.List"%>
<%@page import="Controller.PerfilesDao"%>
<%@page import="Controller.Personas"%>
<%@page import="Controller.PersonasDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var id = document.getElementById("id").value.trim();
        var nombres = document.getElementById("nombres").value.trim();
        var apellidos = document.getElementById("apellidos").value.trim();
        var cedula = document.getElementById("cedula").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var usuario = document.getElementById("usuario").value.trim();
        var clave = document.getElementById("clave").value.trim();
        var imagen = document.getElementById("imagen").value.trim();
        var fregistro = document.getElementById("fregistro").value.trim();
        var perfil = document.getElementById("perfil").value.trim();
        var estado = document.getElementById("estado").value.trim();

        // Validar campos obligatorios
        if (id === "" || nombres === "" || apellidos === "" || cedula === "" || telefono === "" || correo === "" || usuario === "" || clave === "" || imagen === "" || fregistro === "" || perfil === "" || estado === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        // Validar que la contraseña contenga al menos una mayúscula, una minúscula y un número
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/;
        if (!passwordPattern.test(clave)) {
            alert("La contraseña debe contener al menos una mayúscula, una minúscula y un número.");
            return false; // Detener el envío del formulario
        }

        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificar Personas</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar </h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudpersonas_editar.jsp" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    PersonasDao mostrarP = new PersonasDao();
                                    Personas persona = mostrarP.mostrarPersona(id);
                                    if (persona != null) {%>
                            <label>Codigo: </label><input type="text" value="<%= persona.getPerId()%>" class=" form form-control" name="id" id="id" placeholder="Ingrese sus dos nombres" maxlength="100"  autocomplete="off" readonly="false" required/><br>
                            <label>Nombres Completos: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerNombres())%>" class="form form-control" name="nombres" id="nombres" placeholder="Ingrese sus dos nombres" maxlength="100" autocomplete="true" required /><br>
                            <label>Apellidos Completos: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerApellidos())%>"class="form form-control" name="apellidos" id="apellidos" placeholder="Ingrese sus dos nombres" maxlength="100" autocomplete="true" required /><br>
                            <label>Cedula de Identidad: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerCedula())%>" class="form-control" name="cedula" id="cedula" placeholder="Ingrese sus cedula de identidad" maxlength="13" autocomplete="true" required /><br>
                            <label>Telefono: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerTelefono())%>"class="form-control"  name="telefono" id="telefono" placeholder="Ingrese sus dos nombres" maxlength="10" autocomplete="true" required /><br>
                            <label>Correo Electronico: </label><input type="email" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerCorreo())%>"class="form-control" name="correo" id="correo" placeholder="Ingrese sus dos nombres" maxlength="100" autocomplete="true" required /><br>
                            <label>Usuario: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerUsuario())%>"class="form-control" name="usuario" id="usuario" placeholder="Ingrese sus dos nombres" maxlength="20" autocomplete="true" required /><br>
                            <label>Contraseña: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerClave())%>"class="form-control" name="clave" id="clave" placeholder="Ingrese sus dos nombres" maxlength="16" autocomplete="true" required /><br>
                            <label>Imagen::</label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(persona.getPerImagen())%>"class="form-control" name="imagen" id="clave" placeholder="Ingrese sus dos nombres" maxlength="16"   autocomplete="off" required /><br>
                            <label>Fecha Regsitro: </label><input type="datetime-local" value="<%= persona.getPerFRegistro()%>"class="form-control" name="fregistro" id="clave" placeholder="Ingrese sus dos nombres" maxlength="16"   autocomplete="off" required /><br>
                            <label>Perfil: </label>
                            <select name="perfil" id="perfil" class="form-control" required>
                                <%
                                    PerfilesDao mostrarPerfil = new PerfilesDao();
                                    List<Perfiles> perfiles = mostrarPerfil.mostrarListaPerfil();
                                    for (Perfiles perfil : perfiles) {%>
                                <option value="<%=perfil.getPerfilId()%>"><%= StringEscapeUtils.escapeHtml4(perfil.getPerfilNombre())%></option>
                                <% }%>
                            </select>  
                            <br>
                            <label>Estado: </label>
                            <select name="estado" id="estado"class="form-control" required>
                                <%
                                    EstadosDao mostrarEstado = new EstadosDao();
                                    List<Estados> estados = mostrarEstado.mostrarListaEsta1();
                                    for (Estados estado : estados) {%>
                                <option value="<%=estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></option>
                                <% }%>
                            </select>                            
                            <% }
                                }%>
                            <br>
                            <a href="menu_admin.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Editar" name="editar" class="btn btn-primary"/>                                
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>