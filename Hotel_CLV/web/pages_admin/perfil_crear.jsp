<%-- 
    Document   : perfil_crear_
    Created on : 13-ago-2023, 14:51:25
    Author     : Ruben Dario 921
--%>
<%@page import="Controller.colorNotificaciones"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="Controller.colorNotificacionesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var letra = document.getElementById("letra").value.trim();
        var nombre = document.getElementById("nombre").value.trim();
        var color;
        = document.getElementById("(color").value.trim();

        // Validar campos obligatorios
        if (letra === "" || nombre === "" || color === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        
        var confirmacion = confirm("¿Desea registrar los datos ingresados?");
        return confirmacion; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<!--Cuerpo de la pag -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Registro Nuevo</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Perfil Nuevo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudperfil_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                            <label>Letra: </label><input type="text" name="letra" id="letra" class="form form-control" placeholder="Ingrese 2 letras de abreviatura"maxlength="2" autocomplete="off" required/>
                            <br>
                            <label>Nombre: </label><input type="text" name="nombre" id="nombre" class="form form-control" placeholder="Ingrese el nombre del perfil" maxlength="20" autocomplete="off" required/>
                            <br>
                            <label>Color:</label>
                            <select name="color" id="color" class="form form-control" required>
                                <option selected>Seleccione una Opción</option>
                                <%
                                    colorNotificacionesDao mostrarColor = new colorNotificacionesDao();
                                    List<colorNotificaciones> colorNotificacion = mostrarColor.mostrarListaColor();
                                    for (colorNotificaciones colorNoti : colorNotificacion) {
                                %>
                                <option value="<%= colorNoti.getColorNId()%>" style="color:<%=  StringEscapeUtils.escapeHtml4(colorNoti.getColorNcodigo())%>"><%=  StringEscapeUtils.escapeHtml4(colorNoti.getColorNNombre())%></option>
                                <% }%>
                            </select>
                            <br />  b
                            <a href="perfil_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Registrar" name="nuevo_perfil" class=" btn btn-success"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>