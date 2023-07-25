<%-- 
    Document   : menu_admin
    Created on : 17-jul-2023, 20:07:48
    Author     : Ruben Dario 921
--%>
<%@page import="java.sql.*"%>
<%@page import="Model.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../template/admin/header_admin.jsp" %>
<!--Ingreso por base de datos--->
<%
    // Consultas SQL para obtener la cantidad de clientes, empleadores y productos
    String sql_clientes = "SELECT COUNT(*) as cant_cliente FROM personas WHERE per_perfil ='4';";
    String sql_empleadores = "SELECT COUNT(*) AS cant_empleador FROM personas WHERE per_perfil NOT IN ('4');";
    //String sql_productos = "SELECT COUNT(*) as cant_productos FROM productos;";

    // Ejecuta las consultas y guarda los resultados en variables
    int cantClientes = 0;
    int cantEmpleadores = 0;
    int cantProductos = 0;

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

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Menu Principal</h1>
            </div>
            <!-- /.col-lg-12 -->
            <!-- /.row -->
            <div>
                <a href="listado_clientes.jsp" class="btn btn-success">Listado de Usuarios</a>
                <a href="listado_empleados.jsp" class="btn btn-success">Listado de Empleados</a>
                <!--<a href="usuario.jsp" class="btn btn-success">Dashboard</a>-->

            </div>
        </div>
        <br>
        <br>
        <!--Primer Cuadro-->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"> <%=cantClientes%> </div>
                            </div>
                            <div>Clientes</div>
                        </div>
                    </div>
                </div>
                <a href="listado_clientes.jsp">
                    <div class="panel-footer">
                        <span class="pull-left">Detalles</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <br>
        <!--Segundo  Cuadro-->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"> <%=cantEmpleadores%> </div>
                            </div>
                            <div>Colaborador</div>
                        </div>
                    </div>
                </div>
                <a href="listado_empleados.jsp">
                    <div class="panel-footer">
                        <span class="pull-left">Detalles</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <br>
        <!--Segundo  Cuadro-->
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-tasks fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">12</div>
                            <div>Reservas Realizadas</div>
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="panel-footer">
                        <span class="pull-left">Detalles</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-yellow">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-shopping-cart fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">124</div>
                            <div>Compras Realizadas</div>
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="panel-footer">
                        <span class="pull-left">Observar Detalles</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-support fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">5</div>
                            <div>Pendientes de Contactar</div>
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="panel-footer">
                        <span class="pull-left">Detalles</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
</div>
<!-- /.row -->

<%@include file="../template/admin/footer_admin.jsp" %>