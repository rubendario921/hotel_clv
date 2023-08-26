<%-- 
    Document   : confirmar_reserva
    Created on : 25-ago-2023, 23:49:27
    Author     : Ruben Dario 921
--%>


<%@page import="Controller.Consumos"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="Controller.Insumos"%>
<%@page import="Controller.InsumosDao"%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/cliente/header_cliente.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var id = document.getElementById("id").value.trim();
        var nombres = document.getElementById("nombres").value.trim();
        var apellidos = document.getElementById("apellidos").value.trim();
        var cedula = document.getElementById("cedula").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var usuario = document.getElementById("usuario").value.trim();
        var clave = document.getElementById("clave").value.trim();
        var imagen = document.getElementById("imagen").value.trim();
        var fregistro = document.getElementById("fregistro").value.trim();
        var perfil = document.getElementById("perfil").value.trim();
        var estado = document.getElementById("estado").value.trim();

        // Validar campos obligatorios
        if (id === "" || nombres === "" || apellidos === "" || cedula === "" || telefono === "" || correo === "" || usuario === "" || clave === "" || imagen === "" || fregistro === "" || perfil === "" || estado === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        // Validar que la contraseña contenga al menos una mayúscula, una minúscula y un número
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/;
        if (!passwordPattern.test(clave)) {
            alert("La contraseña debe contener al menos una mayúscula, una minúscula y un número.");
            return false; // Detener el envío del formulario
        }

        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header text-center">Reservación de Habitación</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">
                        <h3>Confirmación de la Reserva</h3>
                    </div>
                    <div class="panel-body">                        
                        <div class="container text-center">
                            <div class="row">
                                <!-- Inicio de tabla izquierda -->
                                <div class="col">
                                    <table class='table table-responsive'>
                                        <thead>
                                            <tr>                                                                                                 
                                                <th colspan="2">Informacion de la Habitacion</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                            <% if (request.getParameter("editar") != null) {
                                                    int id = Integer.parseInt(request.getParameter("id"));

                                                    InsumosDao mostrarInsu = new InsumosDao();
                                                    List<Insumos> insumos = mostrarInsu.mostrarListaInsumos();

                                                    HabitacionesDao mostrarhabi = new HabitacionesDao();
                                                    Habitaciones habitacion = mostrarhabi.mostrarHabi(id);
                                                    if (habitacion != null) {
                                                        int habiInsumo = habitacion.getInsuId();
                                                        String nombreInsumo = "";
                                                        for (Insumos insumo : insumos) {
                                                            if (insumo.getInsuId() == habiInsumo) {
                                                                nombreInsumo = StringEscapeUtils.escapeHtml4(insumo.getInsuDetalle());
                                                            }
                                                        }%>
                                            <tr>
                                                <th scope="row">Codigo: </th>
                                                <td id="id" name="id"><%= habitacion.getHabiId()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Nombre de la Habitación: </th>
                                                <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre())%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Tipo de Habitación: </th>
                                                <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiTipo())%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Piso del Edificio:</th>
                                                <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiPiso())%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Departamento: </th>
                                                <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiDepar())%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Informacion de la Habitación: </th>
                                                <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiDescripcion())%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Valor de la Habitación: </th>
                                                <td name="valorT" id="valorT"><%= habitacion.getHabiValorD()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Insumos de la Habitación: </th>
                                                <td><%= nombreInsumo%></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><img class="img-fluid" src="../<%= StringEscapeUtils.escapeHtml4(habitacion.getHabiImg())%>" height="200" width="200"></td>
                                                    <% }
                                                        }%>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- Fin de la tabla izquierda -->
                                <!-- Inicio de la tabla derecha -->
                                <div class="col-6">

                                    <div class="panel panel-heading">
                                        <h5>Datos para la Reserva</h5>
                                    </div>
                                    <div class="panel panel-body">
                                        <form action="Mantenimiento_cliente/crudreserva_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Días a reservar</span>
                                                <input type="number" name="numDias" id="numDias" class="form-control" min="1" autocomplete="off" placeholder="Ingrese los días a reservar" required>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Fecha Ingreso</span>
                                                <input type="datetime-local" name="fInicio" id="fInicio" class="form-control" required /><br>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Fecha Salida</span>
                                                <input type="datetime-local" name="fSalida" id="fSalida" class="form-control" required /><br>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Consumos Adicionales: </span>
                                                <select name="consumo" id="consumo" class="form-control" required >
                                                    <option></option>
                                                    <%
                                                        ConsumosDao mostrarConsumo = new ConsumosDao();
                                                        List<Consumos> consumos = mostrarConsumo.mostrarListaConsumos();
                                                        for (Consumos consumo : consumos) {%>
                                                    <option value="<%= consumo.getConsuId()%>"><%=  StringEscapeUtils.escapeHtml4(consumo.getConsuNombre())%> - <%=  consumo.getConsuValor()%></option>                                                        
                                                    <% }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text"><i class="fa fa-user-circle"></i>  Codigo Cliente: </span>
                                                <input type="text" name="perId" id="perId" class="form-control" required value="<%= session.getAttribute("perId")%>" title="<%= session.getAttribute("nombre")%>" readonly="false" />                                                
                                            </div>

                                            <div class="container text-center">
                                                <a href="habitaciones_disponibles.jsp" class="btn btn-danger">Regresar</a>
                                                <input type="submit" value="Reservar" name="reservar" class="btn btn-warning"/>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- Fin de la tabla derecha -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/cliente/footer_cliente.jsp" %>
