<%-- 
    Document   : consumos_crear
    Created on : 28/08/2023, 18:15:05
    Author     : USUARIO
--%>

<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>

    //Optener valores de los campos
    function validarFormulario() {
        var nombre = document.getElementById("nombre").value.trim();
        var detalle = document.getElementById("detalle").value.trim();
        var cantidad = document.getElementById("cantidad").value.trim();
        var valor = document.getElementById("valor").value.trim();
        var estado = document.getElementById("estado").value.trim();

        //Validar campos obligatorios

        if (nombre === " " || detalle === "" || cantidad === "" || valor === "" || estado === "") {
            alert("Por favor, completar todos los campos.");
            return false;
        }
        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        var confirmacion = confirm("¿Desea continuar con la creación del registro?");
        return confirmacion; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Consumos del Hotel</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nuevo Consumo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudconsumos_crear.jsp" method="POST"onsubmit="return validarFormulario();">
                            <label> Nombre: </label>
                            <input type="text" name="nombre" id="nombre" class="form form-control" placeholder="Ingrese el nombre del consumo. " maxlength="50" autocomplete="off" required />
                            <label> Detalle: </label>
                            <input type="text" name="detalle" id="detalle" class="form form-control" placeholder="Ingrese el detalle consumo. " maxlength="500" autocomplete="off" required/>
                            <label> Cantidad: </label>
                            <input type="number" name="cantidad" id="cantidad" class="form form-control" placeholder="Ingrese la cantidad del consumo. " min="1" autocomplete="off" required/>
                            <label> Valor: </label>
                            <input type="number" name="valor" id="valor" class="form form-control" placeholder="Ingrese el valor del consumo. " min="1" autocomplete="off" required/>
                            <label> Estado: </label>
                            <select name="estado" id="estado" class="form form-control" required>
                                <option selected>Por favor, elija una opción.</option>
                                <%
                                    EstadosDao mostrarEstado = new EstadosDao();
                                    List<Estados> estados = mostrarEstado.mostrarListaEstaProductos();
                                    for (Estados estado : estados) {
                                %>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></option>
                                <% }%>
                            </select>
                            <br>
                            <a href="consumos_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Registrar" name="nuevo_consumo" class="btn btn-success"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>