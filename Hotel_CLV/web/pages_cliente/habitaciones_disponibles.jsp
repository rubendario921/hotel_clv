<%-- 
    Document   : habitaciones_disponibles
    Created on : 25/08/2023, 11:11:56
    Author     : Ruben Dario
--%>

<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/cliente/header_cliente.jsp" %>
<!DOCTYPE html>
<!-- Inicio del Cuerpo de la pag -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"> </h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Habitaciones Disponibles</h3></td>                                
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre</th>
                                    <th>Tipo</th>
                                    <th>Piso</th>
                                    <th>Departamento</th>
                                    <th>Descripción</th>
                                    <th>Valor Diario</th>
                                    <th>Estado</th>
                                    <th>Imagen</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    //Lista de Estados para la consulta y comparacion
                                    EstadosDao mostrarE = new EstadosDao();
                                    List<Estados> estados = mostrarE.mostrarListaEstaHabitaciones();

                                    HabitacionesDao mostrarHabitacionesD = new HabitacionesDao();
                                    List<Habitaciones> habitaciones = mostrarHabitacionesD.mostrarListaHabiDisponible();
                                    for (Habitaciones habitacion : habitaciones) {
                                        int habitacionEstado = habitacion.getEstaId();
                                        String nombreEstado = "";
                                        for (Estados estado : estados) {
                                            if (estado.getEstaId() == habitacionEstado) {
                                                nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                            }
                                        }%>
                                <tr>
                                    <td><%= habitacion.getHabiId()%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiTipo())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiPiso())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiDepar())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiDescripcion())%></td>
                                    <td><%= habitacion.getHabiValorD()%></td>
                                    <td class="btn btn-success"><%= nombreEstado%></td>
                                    <td><img class="img-fluid" src="../<%= StringEscapeUtils.escapeHtml4(habitacion.getHabiImg())%>" height="200" width="200"></td>
                                    <td><a href="confirmar_reserva.jsp?editar=true&id=<%= habitacion.getHabiId()%>" class="btn btn-warning"><i class="fa fa-shopping-cart" title="Editar" name="editar"></i></a></td>
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