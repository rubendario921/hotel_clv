<%-- 
    Document   : metodoPagos_editar
    Created on : 21/08/2023, 15:55:54
    Author     : Wladimir Campaña
--%>

<%@page import="Controller.MetodoPagos"%>
<%@page import="Controller.MetodoPagosDao"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var codigo = document.getElementById("codigo").value.trim();
        var letra = document.getElementById("letra").value.trim();
        var nombre = document.getElementById("nombre").value.trim();

        // Validar campos obligatorios
        if (codigo === "" || letra === "" || nombre === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<!--Inicio del Cuerpo-->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificar Método de Pago</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Método</h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudmetodoPagos_editar.jsp" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    MetodoPagosDao mostrarM = new MetodoPagosDao();
                                    MetodoPagos metodoPagos = mostrarM.mostrarMetodopagos(id);
                                    if (metodoPagos != null) {%>

                            <label>Código: </label><input type="text" name="codigo" id="codigo" value="<%= metodoPagos.getPagoId()%>" class="form-control" maxlength="2" readonly="false"/>
                            <br>
                            <label>Letra: </label><input type="text" name="letra" id="letra" value="<%= StringEscapeUtils.escapeHtml4(metodoPagos.getPagoLetra())%>" class="form-control" placeholder="Ingrese 2 letras de abreviatura"maxlength="2" autocomplete="off" required/>
                            <br>
                            <label>Nombre: </label><input type="text" name="nombre" id="nombre" value="<%= StringEscapeUtils.escapeHtml4(metodoPagos.getPagoNombre())%>" class="form-control" placeholder="Ingrese el metodo de pago" maxlength="20" autocomplete="off" required/>
                            <br>
                            <% }
                                }%>
                            <a href="metodoPagos_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Editar" name="editar" class=" btn btn-success"/>                            
                        </form>                           
                    </div>                    
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo-->
<%@include file="template/footer_admin.jsp" %>
