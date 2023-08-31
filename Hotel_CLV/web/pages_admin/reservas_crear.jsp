<%-- 
    Document   : reservas_crear
    Created on : 23-ago-2023, 0:59:40
    Author     : Ruben Dario 921
--%>
<%@page import="Controller.Personas"%>
<%@page import="Controller.PersonasDao"%>
<%@page import="Controller.Consumos"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
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
                        <h3>Nueva Reserva</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudreservas_crear.jsp" method="POST" onsubmit="return validarFormulario();">

                            <label>Número de Días: </label><input type="number" name="numDias" class="form-control" placeholder="Ingrese los días de reservación" maxlength="2" min="1" autocomplete="true" required/><br>
                            <!-- <label>Fecha de Reserva: </label><input type="datetime-local" name="fReserva" id="fReserva" class="form-control" required /><br>-->
                            <label>Fecha de Ingreso: </label><input type="datetime-local" name="fInicio" id="fInicio" class="form-control" required /><br>
                            <label>Fecha de Salida: </label><input type="datetime-local" name="fSalida" id="fSalida" class="form-control" required /><br>
                            <label>Habitación: </label>
                            <select name="habitacion" class="form form-control" required>
                                <%
                                    HabitacionesDao mostrarHabi = new HabitacionesDao();
                                    List<Habitaciones> habitaciones = mostrarHabi.mostrarListaHabiDisponible();
                                    for (Habitaciones habitacion : habitaciones) {
                                %>
                                <option value="<%= habitacion.getHabiId()%>"><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiDepar())%> - <%= StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre())%></option>
                                <% }%>
                            </select>
                            <br>
                            <label>Consumos : </label>
                            <select name="consumos" class="form form-control" required>
                                <%
                                    ConsumosDao mostrarConsu = new ConsumosDao();
                                    List<Consumos> consumos = mostrarConsu.mostrarListaConsumos();
                                    for (Consumos consumo : consumos) {%>
                                <option value="<%= consumo.getConsuId()%>"><%= StringEscapeUtils.escapeHtml4(consumo.getConsuNombre())%> - <%= consumo.getConsuValor()%> </option>
                                <% }%>
                            </select>
                            <br>
                            <label>Persona : </label>
                            <select name="persona" class="form form-control" required>
                                <option> </option>
                                <%
                                    PersonasDao mostrarC = new PersonasDao();
                                    List<Personas> personas = mostrarC.mostrarListaPersonasC();
                                    for (Personas persona : personas) {%>
                                <option value="<%= persona.getPerId()%>"><%= StringEscapeUtils.escapeHtml4(persona.getPerCedula())%> - <%= StringEscapeUtils.escapeHtml4(persona.getPerApellidos())%> <%= StringEscapeUtils.escapeHtml4(persona.getPerNombres())%> </option>    
                                <% }%>

                            </select>
                            <br>
                            <label>Valor Total: </label><input type="number" name="valor" class="form-control"  placeholder="Ingrese el valor de la reserva" step="000.01" min="000.00" autocomplete="true" required/><br>
                            <label>Estados : </label>
                            <select name="estado" class="form form-control" required>
                                <%                                    EstadosDao mostrarEsta = new EstadosDao();
                                    List<Estados> estados = mostrarEsta.mostrarListaEstados();
                                    for (Estados estado : estados) {
                                %>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></option>
                                <% }%>
                            </select>
                            <br>
                            <a href="reservas_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Registrar" name="nueva_reserva" class=" btn btn-primary"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>                    
<%@include file="template/footer_admin.jsp" %>