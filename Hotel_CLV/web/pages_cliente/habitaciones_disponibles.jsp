<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/cliente/header_cliente.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">    
        <style>
            .page-header {
                text-align: center;
            }

            .container-fluid {
                margin-top: 20px;
            }

            .table {
                width: 100%;
            }

            .table th, .table td {
                text-align: center;
            }

            .btn-editar {
                background-color: #FFD700;
                color: #333;
            }

            .btn-editar:hover {
                background-color: #FFC000;
            }

            .img-fluid {
                max-width: 200px;
                max-height: 200px;
            }
        </style>
    </head>
    <body>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Habitaciones Disponibles</h1>
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>                                            
                                            <th>Nombre</th>
                                            <th>Tipo</th>
                                            <th>Piso</th>
                                            <th>Departamento</th>
                                            <th>Descripción</th>
                                            <th>Valor Diario</th>                                        
                                            <th>Imagen</th>
                                            <th>Reservar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                        EstadosDao mostrarE = new EstadosDao();
                                            List<Estados> estados = mostrarE.mostrarListaEstaHabitaciones();

                                            HabitacionesDao mostrarHabitacionesD = new HabitacionesDao();
                                            List<Habitaciones> habitaciones = mostrarHabitacionesD.mostrarListaHabiDisponible();
                                            for (Habitaciones habitacion : habitaciones) {
                                                int habitacionEstado = habitacion.getEstaId();
                                                String nombreEstado = "";
                                                for (Estados estado : estados) {
                                                    if (estado.getEstaId() == habitacionEstado) {
                                                        nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                        break;
                                                    }
                                                }%>
                                        <tr>                                            
                                            <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre())%></td>
                                            <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiTipo())%></td>
                                            <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiPiso())%></td>
                                            <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiDepar())%></td>
                                            <td><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiDescripcion())%></td>
                                            <td><%= habitacion.getHabiValorD()%></td>                                        
                                            <td><img class="img-fluid" src="../<%= StringEscapeUtils.escapeHtml4(habitacion.getHabiImg())%>" alt="Habitación"></td>
                                            <td><a href="reserva_confirmar.jsp?editar=true&id=<%= habitacion.getHabiId()%>" class="btn btn-editar"><i class="fa fa-shopping-cart" title="Editar" name="editar"></i></a></td>
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
    </body>
</html>

<%@include file="template/cliente/footer_cliente.jsp" %>