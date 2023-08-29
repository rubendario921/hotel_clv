<%-- 
    Document   : reserva_lista
    Created on : 26-ago-2023, 4:39:58
    Author     : Ruben Dario 921
--%>

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
                <h1 class="page-header"> </h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Reservaciones</h3></td>                                
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Dias</th>
                                    <th>Fecha Registro</th>
                                    <th>Fecha Ingreso</th>
                                    <th>Fecha Salida</th>
                                    <th>Valor a Cancelar</th>
                                    <th>Habitacion</th>                                    
                                    <th>Consumo Adicionales</th>
                                    <th>Estado</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    String id_perId = String.valueOf(session.getAttribute("perId"));
                                    int id = Integer.parseInt(id_perId);

                                    ReservasDao mostrarReservas = new ReservasDao();
                                    List<Reservas> reservas = mostrarReservas.mostrarListaReservaXid(id);
                                    for (Reservas reserva : reservas) {%>

                                <tr>
                                    <td><%= reserva.getReseId()%></td>
                                    <td><%= reserva.getNumDias()%></td>
                                    <td><%= reserva.getReseFReserva()%></td>
                                    <td><%= reserva.getReseFInicio()%></td>
                                    <td><%= reserva.getReseFSalida()%></td>
                                    <td><%= reserva.getReseVTotal()%></td>
                                    <td><%= reserva.getHabiId()%></td>
                                    <td><%= reserva.getConsuId()%></td>
                                    <td><%= reserva.getEstaId()%></td>
                                    <td>
                                        <a href="">Realizar el Pago</a>
                                        <a href="">Anular</a>                                       
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/cliente/footer_cliente.jsp" %>