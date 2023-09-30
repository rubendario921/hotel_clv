<%-- 
    Document   : perfil_editar
    Created on : 14/08/2023, 11:42:38
    Author     : Ruben Dario
--%>

<%@page import="Controller.colorNotificaciones"%>
<%@page import="java.util.List"%>
<%@page import="Controller.colorNotificacionesDao"%>
<%@page import="Controller.Perfiles"%>
<%@page import="Controller.PerfilesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var codigo = document.getElementById("codigo").value.trim();
        var letra = document.getElementById("letra").value.trim();
        var nombre = document.getElementById("nombre").value.trim();
        var color = document.getElementById("color").value.trim();
        // Validar campos obligatorios
        if (codigo === "" || letra === "" || nombre === "" || color === "Seleccione una Opción") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        // Mensaje de Confirmacion
        var confirmacion = confirm("¿Estás seguro de que deseas editar este perfil?");
        return confirmacion; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<!--Inicio del Cuerpo-->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Perfiles</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Perfil</h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudperfil_editar.jsp" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    PerfilesDao mostrarP = new PerfilesDao();
                                    Perfiles perfil = mostrarP.mostrarPerfil(id);
                                    if (perfil != null) {%>
                            <label>Código: </label><input type="text" name="codigo" id="codigo" value="<%= perfil.getPerfilId()%>" class="form form-control"  maxlength="2" readonly="false"/>
                            <br />
                            <label>Letra: </label><input type="text" name="letra" id="letra" value="<%= StringEscapeUtils.escapeHtml4(perfil.getPerfilLetra())%>" class="form form-control"  placeholder="Ingrese 2 letras de abreviatura"maxlength="2" autocomplete="off" required/>
                            <br />
                            <label>Nombre: </label><input type="text"  name="nombre" id="nombre" value="<%= StringEscapeUtils.escapeHtml4(perfil.getPerfilNombre())%>" class=" form form-control" placeholder="Ingrese el nombre del perfil" maxlength="20"  autocomplete="off" required/>
                            <br />
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
                            <br />
                            <% }
                                }%>
                            <a href="perfil_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Editar" name="editar" class=" btn btn-warning"/>                            
                        </form>                           
                    </div>                    
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo-->
<%@include file="template/footer_admin.jsp" %>