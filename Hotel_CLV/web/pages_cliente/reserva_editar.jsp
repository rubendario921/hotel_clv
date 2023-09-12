<%-- 
    Document   : reserva_editar
    Created on : 12-sep-2023, 0:40:44
    Author     : User
--%>
<%@page import="Controller.Consumos"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="Controller.Reservas"%>
<%@page import="Controller.ReservasDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/cliente/header_cliente.jsp" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Editar Reserva</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Información de la Reserva</h3>
                    </div>
                    <div class="panel-body">
                        <form action="" method="POST" onsubmit="">
                            <%                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id_reserva"));

                                    ReservasDao mostrarReserva = new ReservasDao();
                                    Reservas reserva = mostrarReserva.mostrarReserva(id);
                                    if (reserva != null) {%>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="codigo">Código de la Reserva: </span>
                                <input type="number" id="codigo" name ="codigo" value="<%= reserva.getReseId()%>" class="form form-control" min="1" readonly="off" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="codigo">Fecha de Reserva: </span>
                                <input type="datetime-local" id="fReserva" name ="fReserva" value="<%= reserva.getReseFReserva()%>" class="form form-control" readonly="off" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="codigo">Valor Total Reservado: </span>
                                <input type="text" id="valorTanterior" name ="valorTanterior" value="$ <%= reserva.getReseVTotal()%>" class="form form-control" readonly="off" required>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text" id="codigo">Código Habitación: </span>
                                <input type="text" id="codigo" name ="codigo" value="<%= reserva.getHabiId()%>" class="form form-control" readonly="off" required>
                            </div>
                            <h3>Cambios o Modificaciones a realizar: </h3>
                            
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="codigo">Números de Días: </span>
                                <input type="number" id="numDias" name ="numDias" value="<%= reserva.getNumDias()%>" class="form form-control" min="1" placeholder="Ingrese la cantidad de los días a reservar" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="codigo">Fecha Ingreso: </span>
                                <input type="datetime-local" id="fIngreso" name ="fIngreso" value="<%= reserva.getReseFInicio()%>" class="form form-control" required>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text" id="codigo">Fecha Salida:  </span>
                                <input type="datetime-local" id="fSalida" name ="fSalida" value="<%= reserva.getReseFSalida()%>" class="form form-control" required>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text">Consumos Adicionales: </span>
                                <select name="consumoHabi" id="consumoHabi" class="form-control" required >
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
                            <% }
                                }
                            %>
                        </form>



                        <%@include file="template/cliente/footer_cliente.jsp" %>




