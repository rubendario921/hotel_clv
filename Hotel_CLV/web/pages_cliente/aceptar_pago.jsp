<%-- 
    Document   : aceptar_pago
    Created on : 28-ago-2023, 22:43:42
    Author     : User
--%>

<%@page import="Controller.Reservas"%>
<%@page import="Controller.ReservasDao"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Metodos de Pago</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Registro del Pago</h3>
                    </div>
                    <div class="panel-body">
                        <div class="container text-center">
                            <div class="row">
                                <!-- Inicio de tabla izquierda -->
                                <div class="col">
                                    <table class='table table-responsive'>
                                        <thead>
                                            <tr>                                                                                                 
                                                <th colspan="2">Informacion de la Reserva</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                            <% if (request.getParameter("aceptar") != null) {
                                                    int id = Integer.parseInt(request.getParameter("id"));

                                                    ReservasDao mostrarResera = new ReservasDao();
                                                    Reservas reserva = mostrarResera.mostrarReserva(id);
                                                    if (reserva != null) {%>
                                            <tr>
                                                <th scope="row">Codigo de Reservacion: </th>
                                                <td><%= reserva.getReseId()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Dias de Reservacion: </th>
                                                <td><%= reserva.getNumDias()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Fecha Registro: </th>
                                                <td><%= reserva.getReseFReserva()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Fecha de Ingreso: </th>
                                                <td><%= reserva.getReseFInicio()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Fecha de Salida: </th>
                                                <td><%= reserva.getReseFSalida()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Consumos Adicionales: </th>
                                                <td><%= reserva.getConsuId()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Estado la de la Reserva: </th>
                                                <td><%= reserva.getEstaId()%></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <form action="" method="POST" onsubmit="return validarFormulario()">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="codigo">Codigo Reserva: </span>
                                        <input type="text"  name="codigo" id="codigo" value="<%= reserva.getReseId()%>" class="form-control" placeholder="Codigo de la Reserva" aria-label="Codigo de la Reserva" aria-describedby="codigo" readonly="off" required>
                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="valorT">Valor a Cancelar: </span>
                                        <input type="number"  name="valorT" id="valorT" value="<%= reserva.getReseVTotal()%>" class="form-control" placeholder="Codigo de la Reserva" aria-label="Codigo de la Reserva" aria-describedby="codigo" readonly="off" required>
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="metodoP">Metodo de Pago: </span>

                                    </div>
                                    <a href="reserva_lista.jsp" class="btn btn-danger">Regresar</a>
                                    <input type="submit" value="Pagar" name="nuevo_pago" class="btn btn-warning"/> 
                                </form>
                                <% }
                                    }%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/cliente/footer_cliente.jsp" %>