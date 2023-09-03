<%-- 
    Document   : insumos_editar
    Created on : 19/08/2023, 17:51:09
    Author     : Wladimir Campaña
--%>

<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Insumos"%>
<%@page import="Controller.InsumosDao"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>

<!DOCTYPE html>
<script>
    function validarFormulario() {
        var nombre = document.getElementById("nombre").value.trim();
        var detalle = document.getElementById("detalle").value.trim();
        var cantidad = document.getElementById("cantidad").value.trim();
        var valor = document.getElementById("valor").value.trim();
        var insu_dimg = document.getElementById("insu_dimg").value.trim();
        var estados = document.getElementById("estados").value.trim();

        //Validar campos obligatorios

        if (nombre === " " || detalle === "" || cantidad === "" || valor === "" || insu_dimg === "" || estados === "") {
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
                <h1 class="page-header">Modificar Insumo</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Insumo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudinsumos_editar.jsp" method="POST"onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    InsumosDao mostrarI = new InsumosDao();
                                    Insumos insumo = mostrarI.mostrarInsumo(id);
                                    if (insumo != null) {%> 
                            <label> Código: </label><input type="text"  name="codigo" id="codigo" value="<%=insumo.getInsuId()%>" class="form-control" placeholder="Ingrese 00 el codigo" maxlength="2" readonly="false"/>
                            <br>
                            <label> Nombre: </label><input type="text" name="nombre" id="nombre" value="<%=StringEscapeUtils.escapeHtml4(insumo.getInsuNombre())%>" class="form-control"  placeholder="Ingrese el nombre del insumo" autocomplete="off" maxlength="50" required/>
                            <br>
                            <label> Detalle: </label><input type="text"name="detalle" id="detalle"  value="<%=StringEscapeUtils.escapeHtml4(insumo.getInsuDetalle())%>" class="form-control" placeholder="Ingrese el detalle del insumo"maxlength="200" required/>
                            <br>
                            <label> Cantidad: </label><input type="number" name="cantidad" id="cantidad" value="<%=insumo.getInsuCantidad()%>" class="form-control" placeholder="Ingrese la cantidad" min="1" maxlength="100" required/>
                            <br>
                            <label> Valor: </label><input type="text" name="valor" id="valor"  value="<%=insumo.getInsuValor()%>" class="form-control" step="0.01" min="1" placeholder="Ingrese su valor"maxlength="100" required/>
                            <br>
                            <label> Imagen: </label><input type="text" name="insu_dimg" id="insu_dimg"  value="<%=StringEscapeUtils.escapeHtml4(insumo.getInsuImagen())%>" class="form-control" placeholder="Ingrese imagen"maxlength="100" required/>
                            <br>
                            <% }
                                }%>
                            <label>Estado: </label>
                            <select name="estados" id="estados" class="form form-control" required>
                                <option> </option>
                                <%
                                    EstadosDao mostrarEstados = new EstadosDao();
                                    List<Estados> estados = mostrarEstados.mostrarListaEstaProductos();
                                    for (Estados estado : estados) {%>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></option> 
                                <% }%>
                            </select>
                            <br>
                            <a href="insumos_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Editar" name="editar" class="btn btn-warning"/>
                        </form>
                    </div>
                </div>            
            </div>        
        </div>    
    </div>

