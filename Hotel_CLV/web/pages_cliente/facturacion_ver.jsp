<%-- 
    Document   : facturacion_ver
    Created on : 22/09/2023, 16:29:56
    Author     : Ruben Dario
--%>

<%@page import="Controller.Consumos"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page import="Controller.Reservas"%>
<%@page import="Controller.ReservasDao"%>
<%@page import="Controller.Personas"%>
<%@page import="Controller.PersonasDao"%>
<%@page import="Controller.FEncabezadosDao"%>
<%@page import="Controller.FEncabezados"%>
<%@page import="Controller.Facturas"%>
<%@page import="Controller.FacturasDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/cliente/header_cliente.jsp" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="text-align: center">Hotel CLV Deluxe</h1>                
                <div class="panel panel-primary">
                    <!--Encabezado de la factura -->
                    <div class="panel-heading">
                        <div class="container text-center" style="background: #f7f7f7">
                            <%                                int id_f = 1;
                                FEncabezadosDao mostrarEnca = new FEncabezadosDao();
                                FEncabezados fencabezado = mostrarEnca.MostrarFEncabezado(id_f);
                                if (fencabezado != null) {
                            %>
                            <div class="row justify-content-md-center">
                                <div class="col col-lg-2">
                                    <img src="assets/img/logo_sin_fondo.png" width="200">
                                </div>
                                <div class="col-md-auto">
                                    <label><b>RUC: </b><%= fencabezado.getEmp_ruc()%></label><br>
                                    <label><b>Dirección: </b><%= fencabezado.getEmp_direccion()%></label><br>
                                    <label><b>Correo Electronico: </b><%= fencabezado.getEmp_correo()%></label><br>
                                    <label><b>Web Site: </b>hotel_clv.com</label><br>
                                    <label><b>Contacto: </b><%= fencabezado.getEmp_contacto()%></label><br>
                                </div>
                                <div class="col col-lg-2">                                    
                                    <label><b>Emisión: </b> NORMAL</label><br>
                                </div>
                            </div>
                            <% }%>
                        </div>
                        <!--Fin del Encabezado de la factura -->
                        <div class="panel-body">
                            <table>
                                <thead>
                                    <!-- Datos del cliente-->                                    
                                    <%
                                        if (request.getParameter("id_factura") != null) {
                                            int id = Integer.parseInt(request.getParameter("id_factura"));

                                            //Persona
                                            PersonasDao mostrarPersona = new PersonasDao();
                                            List<Personas> mostrarP = mostrarPersona.mostrarListaPersonas();

                                            //Reserva
                                            ReservasDao mostrarReserva = new ReservasDao();
                                            List<Reservas> mostrarR = mostrarReserva.mostrarListaReserva();
//Habitacion
                                            HabitacionesDao mostrarHabi = new HabitacionesDao();
                                            List<Habitaciones> mostrarH = mostrarHabi.mostrarListaHabi();

//Consumos
                                            ConsumosDao mostrarConsumo = new ConsumosDao();
                                            List<Consumos> mostrarC = mostrarConsumo.mostrarListaConsumos();

                                            FacturasDao mostrarFactu = new FacturasDao();
                                            Facturas factura = mostrarFactu.mostrarFactura(id);

                                            if (factura != null) {
                                                int nombreP = factura.getPersonaId();
                                                String nombrePersona = "";
                                                String apellidoPersona = "";
                                                String cedulaPersonas = "";
                                                String contactoPersonas = "";
                                                String correoPersonas = "";

                                                for (Personas persona : mostrarP) {
                                                    if (persona.getPerId() == nombreP) {
                                                        nombrePersona = StringEscapeUtils.escapeHtml4(persona.getPerNombres());
                                                        apellidoPersona = StringEscapeUtils.escapeHtml4(persona.getPerApellidos());
                                                        cedulaPersonas = StringEscapeUtils.escapeHtml4(persona.getPerCedula());
                                                        contactoPersonas = StringEscapeUtils.escapeHtml4(persona.getPerTelefono());
                                                        correoPersonas = StringEscapeUtils.escapeHtml4(persona.getPerCorreo());
                                                        break;
                                                    }
                                                }
                                    %>
                                <br>
                                <div class="container text-center">
                                    <div class="row">
                                        <div class="col-sm">
                                            <b>#Factura:</b>
                                        </div>
                                        <div class="col-sm">
                                            <input type="text" id="factuCodigo" class="form form-control" value="<%= factura.getFactId()%>" readonly="off"/>
                                        </div>
                                        <div class="col-sm"><b>Fecha de Emisión:</b></div>
                                        <div class="col-sm"><input type="datetime-local" id="factuEmision" class="form form-control" value="<%= factura.getFactFEmision()%>"readonly="off" /></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><b>Nombre y Apellidos:</b></span>
                                            <input type="text" id="factuNombre" class="form form-control" value="<%= apellidoPersona%> <%= nombrePersona%>" readonly="off"/>
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><b>Cedula de Identidad:</b></span>
                                            <input type="text" id="factuNombre" class="form form-control" value="<%= cedulaPersonas%>" readonly="off"/>
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><b>Correo Electronico:</b></span>
                                            <input type="text" id="factuNombre" class="form form-control" value="<%= correoPersonas%>" readonly="off"/>
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><b>Telefono Contacto:</b></span>
                                            <input type="text" id="factuNombre" class="form form-control" value="0<%= contactoPersonas%>" readonly="off"/>
                                        </div>                                        
                                    </div>
                                </div>
                                <!-- Fin Datos del cliente-->
                                </thead>
                                <br>
                                <tbody>
                                    <!-- Datos de la factura-->
                                <div class="container text-center">
                                    <div class="row">
                                        <div class="col">Código</div>
                                        <div class="col">Detalle</div>
                                        <div class="col"># Días</div>
                                        <div class="col">Precio</div>
                                    </div>
                                </div>
                                <!-- Fin de los datos de la Factura-->

                                <!-- Valor de la factura-->
                                <div class="container text-center">
                                    <div class="row row-cols-4">
                                        <div class="col"></div>
                                        <div class="col"></div>
                                        <div class="col">Impuesto</div>
                                        <div class="col">Column</div>
                                    </div>
                                </div>
                                <!-- Fin valor de la factura-->

                                <!-- Pie de la factura-->

                                <!-- Fin de la pie de la factura-->
                                <% }
                                    }%>      
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <a href="facturacion_lista.jsp">Regresar</a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/cliente/footer_cliente.jsp" %>