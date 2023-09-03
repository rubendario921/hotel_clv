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
        var estado = document.getElementById("estado").value.trim();

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
                        <h3>Nueva Habitación</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudhabitacion_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                            <label>Nombre: </label><input type="text" name="nombre" id="nombre" class="form-control"  placeholder="Ingrese el nombre de la habitación" maxlength="50" autocomplete="off" required/>
                            <label>Tipo: </label><input type="text" name="tipo" id="tipo" class="form-control" placeholder="Ingrese el tipo de habitación" maxlength="50"  autocomplete="off" required/>
                            <label>Piso </label><input type="number" name="piso" id="piso" class="form-control" placeholder="Ingrese el piso donde se encuentra la habitación" maxlength="2" min="1" autocomplete="off" required/>
                            <label>Departamento: </label><input type="number" name="departamento" id="departamento" class="form-control"  placeholder="Ingrese el número de la habitación" maxlength="3" min="1" autocomplete="off" required/>
                            <label>Descripción: </label><input type="text" name="descripcion" id="descripcion" class="form-control"  placeholder="Ingrese la descripción de la habitación" maxlength="255" autocomplete="off" required/>
                            <label>Valor: </label><input type="number" name="valor" id="valor" class="form-control"  placeholder="Ingrese el valor" step="0.01" min="0" autocomplete="off" required/>
                            <label>Insumo: </label>
                            <select name="insumo" id="insumo" class="form form-control" required>
                                <option> </option>
                                <%
                                    InsumosDao mostrarInsu = new InsumosDao();
                                    List<Insumos> insumos = mostrarInsu.mostrarListaInsumos();
                                    for (Insumos insumo : insumos) {
                                %>
                                <option value="<%= insumo.getInsuId()%>"><%= StringEscapeUtils.escapeHtml4(insumo.getInsuNombre())%> </option>
                                <% }%>
                            </select>
                            <br>
                            <label>Estado:  </label>
                            <select name="estado" id="estado" class="form form-control" required>
                                <option> </option>
                                <%
                                    EstadosDao mostrarEsta = new EstadosDao();
                                    List<Estados> estados = mostrarEsta.mostrarListaEstaHabitaciones();
                                    for (Estados estado : estados) {
                                %>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%> </option>
                                <% }%>
                            </select>                           
                            <br>
                            <a href="habitaciones_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Registrar" name="nueva_habitacion" class=" btn btn-success"/>
                        </form>                           
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<%@include file="template/footer_admin.jsp" %>
