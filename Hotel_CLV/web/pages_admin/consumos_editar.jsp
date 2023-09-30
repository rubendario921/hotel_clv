<%-- 
    Document   : consumos_editar
    Created on : 28/08/2023, 18:15:27
    Author     : USUARIO
--%>

<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Consumos"%>
<%@page import="Controller.FormulariosDao"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>

<script>
    function validarFormulario() {
        var codigo = document.getElementById("codigo").value.trim();
        var nombre = document.getElementById("nombre").value.trim();
        var detalle = document.getElementById("detalle").value.trim();
        var cantidad = document.getElementById("cantidad").value.trim();
        var valor = document.getElementById("valor").value.trim();
        var consu_dimg = document.getElementById("consu_dimg").value.trim();
        var estados = document.getElementById("estados").value.trim();

        //Validar campos obligatorios
        if (codigo === " " || nombre === "" || detalle === "" || cantidad === "" || valor === "" || consu_dimg === "" || estados === "Por favor, elija una opción.") {
            alert("Por favor, completar todos los campos.");
            return false;
        }
        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        var confirmacion = confirm("¿Está de acuerdo con actualizar el registro?");
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
                        <h3>Editar Consumo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudconsumos_editar.jsp" method="POST"onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    ConsumosDao mostrarC = new ConsumosDao();
                                    Consumos consumo = mostrarC.mostrarConsumo(id);
                                    if (consumo != null) {%> 
                            <label> Código: </label>
                            <input type="text" name="codigo" id="codigo" value="<%= consumo.getConsuId()%>" class="form form-control"   placeholder="Ingrese 00 el código"maxlength="2" readonly="false"/>

                            <label> Nombre: </label>
                            <input type="text" name="nombre" id="nombre"  value="<%= StringEscapeUtils.escapeHtml4(consumo.getConsuNombre())%>" class="form form-control"  placeholder="Ingrese el nombre del consumo"maxlength="50" required/>

                            <label> Detalle: </label>
                            <input type="text" name="detalle" id="detalle"  value="<%= StringEscapeUtils.escapeHtml4(consumo.getConsuDetalle())%>" class="form form-control"   placeholder="Ingrese el detalle del consumo"maxlength="200" required/>

                            <label> Cantidad: </label>
                            <input type="number" name="cantidad" id="cantidad"  value="<%= consumo.getConsuCantidad()%>" class="form form-control"  placeholder="Ingrese la cantidad" min="1" required/>

                            <label> Valor: </label>
                            <input type="number"name="valor" id="valor"  value="<%= consumo.getConsuValor()%>" class="form form-control"   placeholder="Ingrese su valor" min="1" required/>

                            <label> Imagen: </label>
                            <input type="text" name="consu_dimg"id="consu_dimg"  value="<%= StringEscapeUtils.escapeHtml4(consumo.getConsuImagen())%>" class="form form-control"   placeholder="Ingrese imagen"maxlength="20" required/>

                            <% }
                                }%>
                            <label>Estado: </label>
                            <select name="estados" id="estados" class="form form-control" required>
                                <option>Por favor, elija una opción.</option>
                                <%
                                    EstadosDao mostrarEstados = new EstadosDao();
                                    List<Estados> estados = mostrarEstados.mostrarListaEstaProductos();
                                    for (Estados estado : estados) {%>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></option>
                                <% }%>
                            </select>
                            <br />
                            <a href="consumos_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Editar" name="editar" class="btn btn-warning"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>