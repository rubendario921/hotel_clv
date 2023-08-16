<%-- 
    Document   : menu_admin
    Created on : 17-jul-2023, 20:07:48
    Author     : Ruben Dario 921
--%>
<%@page import="java.sql.*"%>
<%@page import="Model.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="template/header_admin.jsp" %>
<!--Ingreso por base de datos--->
<%
    // Consultas SQL para obtener la cantidad de clientes, empleadores y productos
    String sql_clientes = "SELECT COUNT(*) as cant_cliente FROM hotel_clv.personas WHERE perfiles_perfil_id =4;";
    String sql_empleadores = "SELECT COUNT(*) AS cant_empleador FROM personas WHERE perfiles_perfil_id NOT IN ('4');";
    String sql_habitaciones = "SELECT COUNT(*) AS cant_habitaciones FROM habitaciones WHERE estados_esta_id = 3;";
    String sql_reservaciones_pendientes = "SELECT count(*) as cant_reservas_pendiente FROM hotel_clv.reservas WHERE estados_esta_id = 7;";
    String sql_formu = "SELECT count(*) as cant_formu FROM hotel_clv.formularios WHERE estados_esta_id= 7;";

    // Ejecuta las consultas y guarda los resultados en variables
    int cantClientes = 0;
    int cantEmpleadores = 0;
    int cantHabitaciones = 0;
    int cantReservasPendientes = 0;
    int cantFormu = 0;

    try {
        conexion cn = new conexion();
        Statement st = cn.getConexion().createStatement();
        ResultSet rs = st.executeQuery(sql_clientes);
        while (rs.next()) {
            cantClientes = rs.getInt("cant_cliente");
        }

        rs = st.executeQuery(sql_empleadores);
        while (rs.next()) {
            cantEmpleadores = rs.getInt("cant_empleador");
        }

        rs = st.executeQuery(sql_habitaciones);
        while (rs.next()) {
            cantHabitaciones = rs.getInt("cant_habitaciones");
        }

        rs = st.executeQuery(sql_reservaciones_pendientes);
        while (rs.next()) {
            cantReservasPendientes = rs.getInt("cant_reservas_pendiente");
        }

        rs = st.executeQuery(sql_formu);
        while (rs.next()) {
            cantFormu = rs.getInt("cant_formu");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Menú Principal</h1>
            </div>          
        </div>
        <br>
        <br>
        <!--Primer Cuadro-->
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-comments fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div>Nuestros Clientes</div>
                            <div class="huge"> <%=cantClientes%> </div>
                        </div>                            
                    </div>
                </div>            
                        <a href="clientes_lista.jsp">
                    <div class="panel-footer">
                        <span class="pull-left">Listado de Clientes</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <!--Segundo  Cuadro-->
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-comments fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div>Equipo de Trabajo</div>
                            <div class="huge"> <%=cantEmpleadores%> </div>
                        </div>                            
                    </div>
                </div>
                <a href="listado_empleados.jsp">
                    <div class="panel-footer">

                        <span class="pull-left">Listado de Colaboradores</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>        
        <!--Tercer  Cuadro-->
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-tasks fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div>Disponibles</div>
                            <div class="huge"><%=cantHabitaciones%></div>                            
                        </div>
                    </div>
                </div>                
                <a href="listado_habitaciones.jsp">
                    <div class="panel-footer">
                        <span class="pull-left">Listado de Habitaciones</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!--Cuarto  Cuadro-->
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-yellow">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-shopping-cart fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div>Reservas Pendientes</div>
                        <div class="huge"> <%=cantReservasPendientes%></div>                        
                    </div>
                </div>
            </div>
            <a href="#">
                <div class="panel-footer">
                    <span class="pull-left">Reservaciones</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>    
    <!--Quinto  Cuadro-->
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-red">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-support fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div>Buzon de Sugerencia</div>
                        <div class="huge"><%=cantFormu%></div>                        
                    </div>
                </div>
            </div>
            <a href="#">
                <div class="panel-footer">
                    <span class="pull-left">Atencion al Cliente</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
</div>
<!-- /.row -->

<%@include file="template/footer_admin.jsp" %>