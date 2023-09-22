<%@page import="Controller.Consumos"%>
<%@page import="Controller.ConsumosDao"%>
<%-- 
    Document   : reservas_lista
    Created on : 22-ago-2023, 23:41:38
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.Reservas"%>
<%@page import="Controller.ReservasDao"%>
<%@page import="Controller.Personas"%>
<%@page import="Controller.PersonasDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Reservaciones</h1>
                <div class="panel panel-primary">                    
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Reservaciones</h3></td>
                                <td aling="rigth"><a href="reservas_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table-responsive">
                            <thead>
                                <tr>                                    
                                    <th># Días</th>
                                    <th>Fecha Reserva</th>
                                    <th>Fecha Ingreso</th>
                                    <th>Fecha Salida</th>
                                    <th>Valor Total</th>                                    
                                    <th>Habitación</th>
                                    <th>Estado</th>
                                    <th>Cliente</th>                                                                 
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    HabitacionesDao mostrarHabi = new HabitacionesDao();
                                    List<Habitaciones> habitaciones = mostrarHabi.mostrarListaHabi();

                                    EstadosDao mostrarEsta = new EstadosDao();
                                    List<Estados> estados = mostrarEsta.mostrarListaEstados();

                                    PersonasDao mostrarPerso = new PersonasDao();
                                    List<Personas> personas = mostrarPerso.mostrarListaPersonas();

                                    ReservasDao mostrarReser = new ReservasDao();
                                    List<Reservas> reservas = mostrarReser.mostrarListaReserva();
                                    for (Reservas reserva : reservas) {
                                        //Comparacion Reserva y Habitacion
                                        int reservaHabiId = reserva.getHabiId();
                                        String nombreHabitacion = "";
                                        for (Habitaciones habitacion : habitaciones) {
                                            if (habitacion.getHabiId() == reservaHabiId) {
                                                nombreHabitacion = StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre());
                                                break;
                                            }
                                        }

                                        //Comparacion Reserva Y Estados
                                        int reservaEstaId = reserva.getEstaId();
                                        String nombreEstado = "";
                                        for (Estados estado : estados) {
                                            if (estado.getEstaId() == reservaEstaId) {
                                                nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                break;
                                            }
                                        }

                                        //Color de fondo integrado con clase
                                        String colorFondo = "";
                                        if ("PENDIENTE".equals(nombreEstado)) {
                                            colorFondo = "alert alert-warning";
                                        } else if ("ANULADO".equals(nombreEstado)) {
                                            colorFondo = "alert alert-danger";
                                        } else if ("PAGADO".equals(nombreEstado)) {
                                            colorFondo = "alert alert-success";
                                        }

                                        //Comparacion Reserva y Persona
                                        int reservaPerId = reserva.getPerId();
                                        String cedulaPersona = "";
                                        for (Personas persona : personas) {
                                            if (persona.getPerId() == reservaPerId) {
                                                cedulaPersona = StringEscapeUtils.escapeHtml4(persona.getPerCedula());
                                                break;
                                            }
                                        }%>
                                <tr>
                                    <td><%= reserva.getNumDias()%> Días</td>
                                    <td><input type="datetime-local" id="fRegistro" class="form-control" value="<%= reserva.getReseFReserva()%>" readonly="off"/></td>
                                    <td><input type="datetime-local" id="fIngreso" class="form-control" value="<%= reserva.getReseFInicio()%>" readonly="off"/></td>
                                    <td><input type="datetime-local" id="fSalida" class="form-control" value="<%= reserva.getReseFSalida()%>" readonly="off" /></td>
                                    <td><%= reserva.getReseVTotal()%></td>
                                    <td><%= nombreHabitacion%></td>
                                    <td><div type="text" class="<%= colorFondo%> "><%= nombreEstado%></div></td>
                                    <td><%= cedulaPersona%></td>
                                    <td>
                                        <a href="reservas_editar.jsp?editar=true&id=<%= reserva.getReseId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                            <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudreservas_eliminar.jsp?eliminar=true&id=<%= reserva.getReseId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
                                            <% }%>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>                    
                <a href="menu_admin.jsp" class="btn btn-block btn-primary" >Menu Principal</a>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>