<%-- 
    Document   : aceptar_pago
    Created on : 28-ago-2023, 22:43:42
    Author     : User
--%>

<%@page import="Controller.MetodoPagos"%>
<%@page import="Controller.MetodoPagosDao"%>
<%@page import="Controller.Consumos"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
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
        var codigo = document.getElementById("codigo").value.trim();
        var valorT = document.getElementById("valorT").value.trim();
        var metodoP = document.getElementById("metodoP").value.trim();
        var transaccion = document.getElementById("transaccion").value.trim();

        // Validar campos obligatorios
        if (codigo === "" || valorT === "" || metodoP === "" || transaccion === "") {
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
                <h1 class="page-header ">Metodos de Pago</h1>
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

                                                    EstadosDao mostrarEstados = new EstadosDao();
                                                    List<Estados> estados = mostrarEstados.mostrarListaEstados();

                                                    ConsumosDao mostrarConsumos = new ConsumosDao();
                                                    List<Consumos> consumos = mostrarConsumos.mostrarListaConsumos();

                                                    int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));

                                                    ReservasDao mostrarReserva = new ReservasDao();
                                                    Reservas reserva = mostrarReserva.mostrarReservaXid(id_reserva);
                                                    if (reserva != null) {

                                                        //Comparacion de Estado                                                    
                                                        int reservaEstado = reserva.getEstaId();
                                                        String nombreEstado = "";
                                                        for (Estados estado : estados) {
                                                            if (estado.getEstaId() == reservaEstado) {
                                                                nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                                break;
                                                            }

                                                        }
                                                        //Comparacion de Consumos
                                                        int reservaConsumos = reserva.getConsuId();
                                                        String nombreConsumo = "";
                                                        for (Consumos consumo : consumos) {
                                                            if (consumo.getConsuId() == reservaConsumos) {
                                                                nombreConsumo = StringEscapeUtils.escapeHtml4(consumo.getConsuDetalle());
                                                                break;
                                                            }
                                                        }%>
                                            <tr>
                                                <th scope="row">Dias de Reservacion: </th>
                                                <td><%= reserva.getNumDias()%> Días</td>
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
                                                <td><%= nombreConsumo%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Estado la de la Reserva: </th>
                                                <td><%= nombreEstado%></td>
                                            </tr>
                                        </tbody>                                        
                                    </table>
                                </div>
                                <form action="Mantenimiento_cliente/crudfactura_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text"><i class="fa fa-user-circle"></i> Codigo Cliente: </span>
                                        <input type="text" name="perId" id="perId" class="form-control" required value="<%= session.getAttribute("perId")%>" title="<%= session.getAttribute("nombre")%>" readonly="off"/>                                                
                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="codigo">Código Reservacion: </span>
                                        <input type="text"  name="codigo" id="codigo" value="<%= reserva.getReseId()%>" class="form form-control" readonly="off" required>
                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="valorT">Valor a Cancelar: </span>
                                        <input type="number"  name="valorT" id="valorT" value="<%= reserva.getReseVTotal()%>" class="form form-control" readonly="off" required>
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="metodoP" required>Metodo de Pago: </span>
                                        <select name="metodoP" id="metodoP" class="form form-control">
                                            <option></option>
                                            <%
                                                MetodoPagosDao mostrarListaMetodo = new MetodoPagosDao();
                                                List<MetodoPagos> metodoP = mostrarListaMetodo.mostrarListaMetodoPago();
                                                for (MetodoPagos metodoPago : metodoP) {%>
                                            <option value="<%= metodoPago.getPagoId()%>"><%= StringEscapeUtils.escapeHtml4(metodoPago.getPagoNombre())%></option>
                                            <% }%>
                                        </select>
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="transaccion">Nº Transaccion</span>
                                        <input type="text"  name="transaccion" id="transaccion"  class="form form-control" maxlength="10"  autocomplete="off"required>
                                    </div>
                                    <a href="reserva_lista.jsp" class="btn btn-danger">Regresar</a>
                                    <input type="submit" value="Pagar" name="nuevo_pago" class="btn btn-warning"/> 
                                    <% }
                                        }%>
                                </form>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/cliente/footer_cliente.jsp" %>