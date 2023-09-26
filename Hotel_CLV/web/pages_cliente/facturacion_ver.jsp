<%-- 
    Document   : facturacion_ver
    Created on : 22/09/2023, 16:29:56
    Author     : Ruben Dario
--%>

<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
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
                                        <div class="col-sm"><b>#Factura:</b></div>
                                        <div class="col-sm">
                                            <input type="text" id="factuCodigo" class="form form-control" value="<%= factura.getFactId()%>" readonly="off"/>
                                        </div>
                                        <div class="col-sm"><b>Fecha de Emisión:</b></div>
                                        <div class="col-sm">
                                            <input type="datetime-local" id="factuEmision" class="form form-control" value="<%= factura.getFactFEmision()%>"readonly="off" />
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><b>Nombre y Apellidos:</b></span>
                                            <input type="text" id="factuNombre" class="form form-control" value="<%= apellidoPersona%> <%= nombrePersona%>" readonly="off"/>
                                            <span class="input-group-text"><b>Cedula de Identidad:</b></span>
                                            <input type="text" id="factuNombre" class="form form-control" value="<%= cedulaPersonas%>" readonly="off"/>
                                        </div>                                      
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><b>Correo Electronico:</b></span>
                                            <input type="text" id="factuNombre" class="form form-control" value="<%= correoPersonas%>" readonly="off"/>
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
                                    <%
                                        int codigoReserva = factura.getReservaId();

                                        //Habitacion
                                        String nombreHabitacion = "";
                                        String pisoHabitacion = "";
                                        String deparHabitacion = "";
                                        int cantDias = 0;
                                        int codigoHabi = 0;
                                        BigDecimal valorTReserva = BigDecimal.ZERO;
                                        BigDecimal precioUnitarioHabi = BigDecimal.ZERO;
                                        BigDecimal ivaHabi = BigDecimal.ZERO;

                                        //Consumos
                                        String nombreConsumo = "";
                                        String detalleConsumo = "";
                                        int codigoConsumo = 0;
                                        BigDecimal precioUnitarioConsu = BigDecimal.ZERO;
                                        BigDecimal ivaConsu = BigDecimal.ZERO;

                                        //Subtotal - Total
                                        BigDecimal impuesto = new BigDecimal("0.12");
                                        BigDecimal subTotal = BigDecimal.ZERO;
                                        BigDecimal ivaTotal = BigDecimal.ZERO;

                                        for (Reservas reserva : mostrarR) {
                                            if (reserva.getReseId() == codigoReserva) {
                                                int codigoHabitacion = reserva.getHabiId();
                                                cantDias = reserva.getNumDias();
                                                valorTReserva = reserva.getReseVTotal();

                                                for (Habitaciones habitacion : mostrarH) {
                                                    if (habitacion.getHabiId() == codigoHabitacion) {
                                                        codigoHabi = habitacion.getHabiId();
                                                        nombreHabitacion = StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre());
                                                        pisoHabitacion = habitacion.getHabiPiso();
                                                        deparHabitacion = habitacion.getHabiDepar();
                                                        BigDecimal valorDiarioHabi = (habitacion.getHabiValorD()).setScale(2, RoundingMode.HALF_UP);
                                                        //Valores sin Impuesto                                                        
                                                        ivaHabi = (valorDiarioHabi.multiply(impuesto)).setScale(2, RoundingMode.HALF_UP);
                                                        precioUnitarioHabi = (valorDiarioHabi.subtract(ivaHabi)).setScale(2, RoundingMode.HALF_UP);
                                                    }
                                                }

                                                int codConsu = reserva.getConsuId();

                                                for (Consumos consumo : mostrarC) {
                                                    if (consumo.getConsuId() == codConsu) {
                                                        codigoConsumo = consumo.getConsuId();
                                                        nombreConsumo = consumo.getConsuNombre();
                                                        detalleConsumo = consumo.getConsuDetalle();
                                                        BigDecimal valorConsumo = consumo.getConsuValor();
                                                        //Valores sin Impuesto
                                                        ivaConsu = (valorConsumo.multiply(impuesto)).setScale(2, RoundingMode.HALF_UP);
                                                        precioUnitarioConsu = (valorConsumo.subtract(ivaConsu)).setScale(2, RoundingMode.HALF_UP);

                                                    }
                                                }
                                            }
                                        }
                                        BigDecimal precioTotalHabi = precioUnitarioHabi.multiply(new BigDecimal(cantDias));
                                        BigDecimal precioTotalConsu = precioUnitarioConsu.multiply(new BigDecimal(cantDias));
                                        subTotal = precioTotalHabi.add(precioTotalConsu);
                                        ivaTotal = (ivaHabi.add(ivaConsu)).multiply(new BigDecimal(cantDias));

                                    %>
                                <div class="container text-center">
                                    <div class="row bg bg-light">
                                        <div class="col">Código</div>
                                        <div class="col">Detalle</div>
                                        <div class="col"># Días</div>
                                        <div class="col">Precio Unitario</div>
                                        <div class="col">Precio Total</div>
                                    </div>
                                    <div class="row">
                                        <div class="col"><%= codigoHabi%></div>
                                        <div class="col"><%= pisoHabitacion%> - <%= deparHabitacion%> - <%= nombreHabitacion%></div>
                                        <div class="col"><%= cantDias%></div>
                                        <div class="col">$<%= precioUnitarioHabi%></div>                                        
                                        <div class="col">$<%= precioTotalHabi%></div>                                        
                                    </div>
                                    <div class="row bg bg-light">
                                        <div class="col"><%= codigoConsumo%></div>
                                        <div class="col"><%= nombreConsumo%> - <%= detalleConsumo%></div>
                                        <div class="col"><%= cantDias%></div>
                                        <div class="col">$<%= precioUnitarioConsu%></div>                                        
                                        <div class="col">$<%= precioTotalConsu%></div>                                        
                                    </div>
                                </div>
                                <!-- Fin de los datos de la Factura-->

                                <!-- Valor de la factura-->
                                <div class="container text-center">
                                    <div class="row row-cols-4">
                                        <div class="col"></div>
                                        <div class="col"></div>
                                        <div class="col"><b>SUBTOTAL</b></div>
                                        <div class="col">$ <%= subTotal%></div>                                        
                                    </div>
                                    <div class="row row-cols-4 bg bg-light">
                                        <div class="col"></div>
                                        <div class="col"></div>
                                        <div class="col"><b>IVA 12%</b></div>
                                        <div class="col">$ <%= ivaTotal%></div>
                                    </div>                                  
                                    <div class="row row-cols-4">
                                        <div class="col"></div>
                                        <div class="col"></div>
                                        <div class="col"><b>VALOR TOTAL</b></div>
                                        <div class="col bg bg-success">$ <b><%= valorTReserva%></b></div>
                                    </div>
                                </div>
                                <!-- Fin valor de la factura-->
                                <!-- Pie de la factura-->                         

                                <!-- Fin de la pie de la factura-->
                                <%                                        }
                                    }%>      
                                </tbody>
                            </table>
                                <br>
                        </div>
                    </div>
                                <a href="facturacion_lista.jsp" class="btn btn-block btn-primary">Mis Facturas</a>                
                </div>                
            </div>
        </div>
    </div>
</div>
<%@include file="template/cliente/footer_cliente.jsp" %>