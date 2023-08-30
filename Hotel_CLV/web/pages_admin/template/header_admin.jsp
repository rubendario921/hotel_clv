<%-- 
    Document   : header_admin
    Created on : 19-jul-2023, 23:34:18
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""> 


    <title>CLV Deluxe - Administrativo</title>

    <!-- Bootstrap Core CSS -->
    <link href="template/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="template/css/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="template/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="template/css/startmin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="template/css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="template/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <%

        // Agrega los encabezados para evitar el almacenamiento en caché
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");

        // Verifica si la sesión existe y si no, redirecciona al usuario al inicio de sesión
        if (session.getAttribute("nombre") == null) {
            response.sendRedirect("../login_admin.jsp");
        }
    %>
</head>

<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="menu_admin.jsp">Panel Administrativo</a>                
            </div>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!--<ul class="nav navbar-nav navbar-left navbar-top-links">
             <li><a href="#"><i class="fa fa-home fa-fw"></i> Website</a></li>
             </ul>-->
            <ul class="nav navbar-right navbar-top-links">
                <li class="dropdown navbar-inverse">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> Cliente Nuevos
                                    <span class="pull-right text-muted small">4 minutes</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Nuevo Pedido
                                    <span class="pull-right text-muted small">6 minutes</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> Compra Realizada
                                    <span class="pull-right text-muted small">2 minutes</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Resultados
                                    <span class="pull-right text-muted small">1 minutes</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <%out.println("<i class='fa fa-user fa-fw'></i>" + session.getAttribute("nombre") + "<b class='caret'></b>");%>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                            <a href="#"><i class="fa fa-user fa-fw"></i> Mi Perfil</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-gear fa-fw"></i> Configuraciones</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="procesos/cerrar_sesion_admin.jsp"><i class="fa fa-sign-out fa-fw"></i>Cerrar Sesión                           
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- /.navbar-top-links -->
        </nav>
        <!--Barra de Aside-->

        <aside class="sidebar navbar-default" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="menu_admin.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Reporte de Ventas<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="reservas_lista.jsp">Reservaciones</a>
                            </li>
                            <li>
                                <a href="#">Facturacion</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="habitaciones_lista.jsp"><i class="fa fa-table fa-fw"></i>Habitaciones</a>
                    </li>
                    <li>
                        <a href="formulariosBS_lista.jsp"><i class="fa fa-edit fa-fw"></i> Buzon de Sugerencias</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuraciones<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="personasC_lista.jsp">Listado Clientes</a>
                            </li>
                            <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                            <li>
                                <a href="personasE_lista.jsp">Listado Empleados</a>
                            </li>
                            <% }%>
                            <li>
                                <a href="consumos_lista.jsp">Inventario de Consumos</a>
                            </li>
                            <li>
                                <a href="insumos_lista.jsp">Inventario de Insumos</a>
                            </li>
                            <li>
                                <a href="metodoPagos_lista.jsp"> Metodo de Pago</a>
                            </li>                            
                        </ul>                        
                    </li>              
                    </li>                    
                    <li>
                        <br>
                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>Opciones Adicionales<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">                            
                            <li>
                                <a href="perfil_lista.jsp">Lista de Perfiles</a>
                            </li>
                            <li>
                                <a href="estados_lista.jsp">Lista de Estados</a>
                            </li>                            
                            <li>
                                <a href="categorias_lista.jsp">Lista de Categorias</a>
                            </li>                            
                        </ul>
                        <% }%>
                        <br>
                        <!-- /.nav-second-level -->
                    </li>
                </ul>
            </div>
        </aside>

        <!--Barra de Aside-->
        <!-- /.sidebar -->
    </div>    
