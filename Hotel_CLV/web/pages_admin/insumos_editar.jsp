<%-- 
    Document   : insumos_editar
    Created on : 19/08/2023, 17:51:09
    Author     : Wladimir Campaña
--%>

<%@page import="Controller.Insumos"%>
<%@page import="Controller.InsumosDao"%>
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
        var estados_esta_id = document.getElementById("estados_esta_id").value.trim();

        //Validar campos obligatorios

        if (nombre === " " || detalle === "" || cantidad === "" || valor === "" || insu_dimg === "" || estados_esta_id === "") {
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
                            <label> Codigo: </label><input type="text" value="<%=insumo.getInsuId()%>" class="form-control" name="codigo"  placeholder="Ingrese 00 el codigo"maxlength="2" readonly="false"/>
                            <br>
                            <label> Nombre: </label><input type="text" value="<%=insumo.getInsuNombre()%>" class="form-control" name="nombre"  placeholder="Ingrese el nombre del insumo"maxlength="50" required/>
                            <br>
                            <label> Detalle: </label><input type="text" value="<%=insumo.getInsuDetalle()%>" class="form-control" name="detalle"  placeholder="Ingrese el detalle del insumoo"maxlength="50" required/>
                            <br>
                            <label> Cantidad: </label><input type="text" value="<%=insumo.getInsuCantidad()%>" class="form-control" name="cantidad"  placeholder="Ingrese la cantidad"maxlength="100" required/>
                            <br>
                            <label> Valor: </label><input type="text" value="<%=insumo.getInsuValor()%>" class="form-control" name="valor"  placeholder="Ingrese su valor"maxlength="100" required/>
                            <br>
                            <label> Imagen: </label><input type="text" value="<%=insumo.getInsuImagen()%>" class="form-control" name="insu_dimg"  placeholder="Ingrese imagen"maxlength="20" required/>
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
                            <a href="insumos_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Editar" name="editar" class="btn btn-primary"/>
                        </form>
                    </div>
                </div>            
            </div>        
        </div>    
    </div>

