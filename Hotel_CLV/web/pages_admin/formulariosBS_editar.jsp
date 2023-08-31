<%-- 
    Document   : formulariosBS_editar
    Created on : 24/08/2023, 1:03:10
    Author     :Wladimir Campaña
--%>

<%@page import="Controller.Formularios"%>
<%@page import="Controller.FormulariosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@include file="template/header_admin.jsp" %>
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
        if (codigo === "" || nombre === "" || correo === "" || telefono === "" || asunto === "" || mensaje === "" || ciudad === "" || accion === "") {

            alert("Por favor, complete todos los campos.");
            return false;
        }
        return true;
    }
</script>
<!--Inicio del Cuerpo-->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Editar Buzón de Sugerencias</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Buzón de Sugerencias</h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudformulariosBS_editar.jsp" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    FormulariosDao mostrarF = new FormulariosDao();
                                    Formularios formulario = mostrarF.mostrarFormu(id);
                                    if (formulario != null) {%>
                            <label>Código: </label><input type="text" name="codigo" id="codigo" value="<%= formulario.getFormuId()%>" class="form form-control"  maxlength="2" readonly="false"/>
                            <br>
                            <label>Nombre: </label><input type="text" name="nombre" id="nombre" value="<%= StringEscapeUtils.escapeHtml4(formulario.getFormuNombre())%>" class="form form-control"  maxlength="20" readonly="false"/>
                            <br>
                            <label>Correo: </label><input type="text" name="correo" id="correo" value="<%= StringEscapeUtils.escapeHtml4(formulario.getFormuCorreo())%>" class="form form-control"  maxlength="25" readonly="false"/>
                            <br>
                            <label>Teléfono: </label><input type="text" name="telefono" id="telefono" value="<%= StringEscapeUtils.escapeHtml4(formulario.getFormuTelefono())%>" class="form form-control"  maxlength="15" readonly="false"/>
                            <br>
                            <label>Asunto: </label><input type="text" name="asunto" id="asunto" value="<%= StringEscapeUtils.escapeHtml4(formulario.getFormuAsunto())%>" class="form form-control"  maxlength="100" readonly="false"/>
                            <br>
                            <label>Mensaje: </label><input type="text" name="mensaje" id="mensaje" value="<%= StringEscapeUtils.escapeHtml4(formulario.getFormuMensaje())%>" class="form form-control"  maxlength="500" readonly="false"/>
                            <br>
                            <label>Ciudad: </label><input type="text" name="ciudad" id="ciudad" value="<%= StringEscapeUtils.escapeHtml4(formulario.getFormuCiudad())%>" class="form form-control"  maxlength="10" readonly="false"/>
                            <br>

                            <% }
                                }%>
                            <label>Acción: </label>
                            <select name="estados_esta_id" id="estados_esta_id" class="form form-control" required>
                                <option> </option>
                                <option value="1">Recepción</option>
                                <option value="2">Evaluación</option>
                                <option value="3">implementación</option>
                            </select>
                            <br>
                            <a href="formulariosBS_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Editar" name="editar" class=" btn btn-primary"/>                            
                        </form>                           
                    </div>                    
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo-->
<%@include file="template/footer_admin.jsp" %>