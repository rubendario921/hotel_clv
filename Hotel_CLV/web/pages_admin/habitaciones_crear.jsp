<%-- 
    Document   : habitaciones_crear
    Created on : 17/08/2023, 13:47:01
    Author     : Ruben Dario
--%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>

<%@page import="Controller.Insumos"%>
<%@page import="Controller.InsumosDao"%>
<%@page import="java.util.*"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombre = document.getElementById("nombre").value.trim();
        var tipo = document.getElementById("tipo").value.trim();
        var piso = document.getElementById("piso").value.trim();
        var departamento = document.getElementById("departamento").value.trim();
        var descripcion = document.getElementById("descripcion").value.trim();
        var valor = document.getElementById("valor").value.trim();
        var insumo = document.getElementById("insumo").value.trim();
        var estado = document.getElementById("insumo").value.trim();

        // Validar campos obligatorios
        if (nombre === "" || tipo === "" || piso === "" || departamento === "" || descripcion === "" || valor === "" || insumo === "" || estado === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Nuevo Registro</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nueva Habitacion</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudhabitacion_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                            <label>Nombre: </label><input type="text" class="form-control" name="nombre" placeholder="Ingrese el nombre de la habitacion" maxlength="20" required/>
                            <label>Tipo: </label><input type="text" class="form-control" name="tipo" placeholder="Ingrese el tipo de habitacion" maxlength="20" required/>
                            <label>Piso </label><input type="number" class="form-control" name="piso" placeholder="Ingrese el psio donde se encuentra la habitacion" maxlength="2" min="1" required/>
                            <label>Departamento: </label><input type="number" class="form-control" name="departamento" placeholder="Ingrese el numero de la habitacion" maxlength="3" min="1" required/>
                            <label>Descripcion: </label><input type="text" class="form-control" name="descripcion" placeholder="Ingrese la descripcion de la habitacion" maxlength="200" required/>
                            <label>Valor: </label><input type="number" class="form-control" name="valor" placeholder="Ingrese el valor" step="000.01" min="000.00" required/>                            
                            <label>Insumo: </label>
                            <select name="insumo" id="insumo" class="form form-control" required>
                                <%
                                    InsumosDao mostrarInsu = new InsumosDao();
                                    List<Insumos> insumos = mostrarInsu.mostrarListaInsumos();
                                    for (Insumos insumo : insumos) {
                                %>
                                <option value="<%= insumo.getInsuId()%>"><%= StringEscapeUtils.escapeHtml4(insumo.getInsuNombre())%> </option>
                                <% }%>
                            </select>
                            <br>
                            <label>Insumo: </label>
                            <select name="estado" id="estado" class="form form-control" required>
                                <%
                                EstadosDao mostrarEsta = new EstadosDao();
                                List<Estados> estados = mostrarEsta.mostrarListaEsta2();
                                for (Estados estado : estados) {
                                %>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%> </option>
                                <% }%>
                            </select>                           
                            <br>
                            <a href="habitaciones_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Registrar" name="nueva_habitacion" class=" btn btn-primary"/>
                        </form>                           
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<%@include file="template/footer_admin.jsp" %>
