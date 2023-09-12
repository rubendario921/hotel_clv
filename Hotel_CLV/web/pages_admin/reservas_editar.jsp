<%-- 
    Document   : reservas_editar
    Created on : 07-sep-2023, 0:18:35
    Author     : User
--%>
<%@page import="Controller.Personas"%>
<%@page import="Controller.PersonasDao"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="Controller.Consumos"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Reservas"%>
<%@page import="Controller.ReservasDao"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificar Reserva</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar </h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudreservas_editar.jsp" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));

                                    PersonasDao mostrarPersona = new PersonasDao();
                                    List<Personas> personas = mostrarPersona.mostrarListaPersonas();

                                    ReservasDao mostrarReserva = new ReservasDao();
                                    Reservas reserva = mostrarReserva.mostrarReserva(id);
                                    if (reserva != null) {
                                        int reservaPerId = reserva.getPerId();
                                        String cedulaPersona = "";
                                        for (Personas persona : personas) {
                                            if (persona.getPerId() == reservaPerId) {
                                                cedulaPersona = StringEscapeUtils.escapeHtml4(persona.getPerCedula());
                                                break;
                                            }
                                        }%>
                            <lable>Código: </lable><input type="number" name="id_reserva" id="id_reserva" value="<%= reserva.getReseId()%>" class="form form-control" readonly="off" required /><br>
                            <lable>Cantidad de dìas: </lable><input type="number" name="valorD" id="valorD" value="<%= reserva.getNumDias()%>" class="form form-control" placeholder="Ingrese los nuevos días a reservar" min="1" required /><br>
                            <lable>Fecha de Reservación: </lable><input type="datetime-local" name="fReserva" id="fReserva" value="<%= reserva.getReseFReserva()%>" class="form form-control" readonly="off" required /><br>
                            <lable>Fecha de Ingreso: </lable><input type="datetime-local" name="fInicio" id="fInicio" value="<%= reserva.getReseFInicio()%>" class="form form-control"  required /><br>
                            <lable>Fecha de Salida: </lable><input type="datetime-local" name="fSalida" id="fSalida" value="<%= reserva.getReseFSalida()%>" class="form form-control" required /><br>
                            <lable>Valor Total Reserva: </lable><input type="number" name="VTotal" id="VTotal" value="<%= reserva.getReseVTotal()%>" class="form form-control" placeholder="Ingrese el nuevo valor de la reserva" min="0.00" required /><br>
                            <lable>Habitación: </lable><input type="number" name="id_habi" id="id_habi" value="<%= reserva.getHabiId()%>" class="form form-control" readonly="off" required /><br>
                            <lable>Consumos: </lable>
                            <select name="consumo" id="consumo" class="form form-control" required>
                                <option></option>
                                <%
                                    ConsumosDao mostrarConsumos = new ConsumosDao();
                                    List<Consumos> consumos = mostrarConsumos.mostrarListaConsumos();
                                    for (Consumos consumo : consumos) {%>
                                <option value="<%= consumo.getConsuId()%>"><%= StringEscapeUtils.escapeHtml4(consumo.getConsuNombre())%> - $ <%= consumo.getConsuValor()%></option>
                                <% }%>
                            </select><br>
                            <lable>Reservador por: </lable><input type="number" name="cedulaPersona" id="cedulaPersona" value="<%= cedulaPersona%>" class="form-control" readonly="off" required /><br>
                            <lable>Codigo Cliente:</lable><input type="number" name="personaId" id="personaId" value="<%= reserva.getPerId()%>" class="form-control"  readonly="off" required/><br>
                                <% }
                                    }%>
                            <lable>Estado de la Reserva: </lable>
                            <select name="estado" id="estado" class="form form-control" required>
                                <option> </option>
                                <%
                                    EstadosDao mostrarEstado = new EstadosDao();
                                    List<Estados> estados = mostrarEstado.mostrarListaEstaFacturacion();
                                    for (Estados estado : estados) {%>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%></option>
                                <% }%>                                
                            </select>
                            <br>
                            <a href="reservas_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Modificar" name="editar" class="btn btn-warning"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>