<%-- 
    Document   : consumos_editar
    Created on : 28/08/2023, 18:15:27
    Author     : USUARIO
--%>

<%@page import="Controller.Consumos"%>
<%@page import="Controller.FormulariosDao"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.util.*"%>
<%@include file="template/header_admin.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>
    function validarFormulario() {
        var nombre = document.getElementById("nombre").value.trim();
        var detalle = document.getElementById("detalle").value.trim();
        var cantidad = document.getElementById("cantidad").value.trim();
        var valor = document.getElementById("valor").value.trim();
        var consu_dimg = document.getElementById("consu_dimg").value.trim();
        var estados_esta_id = document.getElementById("estados_esta_id").value.trim();

        //Validar campos obligatorios

        if (nombre === " " || detalle === "" || cantidad === "" || valor === "" || consu_dimg === "" || estados_esta_id === "") {
            alert("Por favor, completar todos los campos.");
            return false;
        }
        return true;
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificar Consumo</h1>
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
                            <label> Codigo: </label><input type="text" value="<%= consumo.getConsuId()%>" class="form-control" name="codigo"  placeholder="Ingrese 00 el codigo"maxlength="2" readonly="false"/>
                            <br>
                            <label> Nombre: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(consumo.getConsuNombre())%>" class="form-control" name="nombre"  placeholder="Ingrese el nombre del consumo"maxlength="50" required/>
                            <br>
                            <label> Detalle: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(consumo.getConsuDetalle())%>" class="form-control" name="detalle"  placeholder="Ingrese el detalle del consumo"maxlength="200" required/>
                            <br>
                            <label> Cantidad: </label><input type="text" value="<%= consumo.getConsuCantidad()%>" class="form-control" name="cantidad"  placeholder="Ingrese la cantidad"maxlength="100" required/>
                            <br>
                            <label> Valor: </label><input type="text" value="<%= consumo.getConsuValor()%>" class="form-control" name="valor"  placeholder="Ingrese su valor"maxlength="100" required/>
                            <br>
                            <label> Imagen: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(consumo.getConsuImagen())%>" class="form-control" name="consu_dimg"  placeholder="Ingrese imagen"maxlength="20" required/>
                            <br>
                            <% }
                                }%>
                            <label>Accion: </label>
                            <select name="estados_esta_id" id="estados_esta_id" class="form form-control" required>
                                <option> </option>
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>
                                <option value="3">Disponible</option>
                            </select>
                            <br>
                            <a href="consumos_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Editar" name="editar" class="btn btn-primary"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>