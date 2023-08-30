<%-- 
    Document   : insumos_crear
    Created on : 16/08/2023, 13:04:18
    Author     : Wladimir Campaña
--%>

<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    //Optener valores de los campos
    function validar formulario() {
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
        return true;
    }

</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Nuevo Registro</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nuevo Insumo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudinsumos_crear.jsp" method="POST"onsubmit="return validarFormulario();">
                            <label> Nombre: </label><input type="text" name="nombre" id="nombre" class="form-control" placeholder="Ingrese el nombre del insumo. " maxlength="50" autocomplete="off" required />
                            <label> Detalle: </label><input type="text" name="detalle" id="detalle" class="form-control" placeholder="Ingrese el detalle insumo. " maxlength="500" autocomplete="off" required/>
                            <label> Cantidad: </label><input type="number" name="cantidad" id="cantidad" class="form-control" placeholder="Ingrese la cantidad del insumo. " min="1" maxlength="20" autocomplete="off" required/>
                            <label> Valor: </label><input type="number" name="valor" id="valor" class="form-control" placeholder="Ingrese el valor del insumo. " step="000.01" autocomplete="off" required/>
                            <label> Estado: </label>
                            <select name="estado" id="estado" class="form form-control" required>                                
                                <option></option>
                                <%
                                    EstadosDao mostrarEstados = new EstadosDao();
                                    List<Estados> estados = mostrarEstados.mostrarListaEstaProductos();
                                    for (Estados estado : estados) {%>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></option>
                                <% }%>
                            </select>
                            <br>
                            <a href="insumos_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Registrar" name="nuevo_insumo" class="btn btn-success"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>
</div>

