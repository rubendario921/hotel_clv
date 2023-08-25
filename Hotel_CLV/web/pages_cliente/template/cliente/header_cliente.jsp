<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hotel CLV - El placer de dormir</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">  
        <%

            // Agrega los encabezados para evitar el almacenamiento en caché
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            // Verifica si la sesión existe y si no, redirecciona al usuario al inicio de sesión
            if (session.getAttribute("nombre") == null) {
                response.sendRedirect("../login_cliente.jsp");
            }
        %>

    </head>
    <body>
        <!-- Start Top Nav -->
        <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
            <div class="container text-light">
                <div class="w-100 d-flex justify-content-between">
                    <div class="align-items-center">
                        <h6 class="align-self-center">BIENVENIDO <%= session.getAttribute("perfil")%> : <%= session.getAttribute("nombre")%></h6>
                    </div>
                </div>
                <li class="list-inline-item border border-light rounded-circle text-center">
                    <a href="http://facebook.com/" class="text-light text-decoration-none" target="_blank">
                        <i class="fab fa-facebook-f fa-lg fa-fw"></i>
                    </a>
                </li>
                <li class="list-inline-item border border-light rounded-circle text-center">
                    <a href="https://www.instagram.com/" class="text-light text-decoration-none" target="_blank">
                        <i class="fab fa-instagram fa-lg fa-fw"></i>
                    </a>
                </li>
                <li class="list-inline-item border border-light rounded-circle text-center">
                    <a href="https://twitter.com/" class="text-light text-decoration-none" target="_blank">
                        <i class="fab fa-twitter fa-lg fa-fw"></i>
                    </a>
                </li>
            </div>

        </nav>
        <!-- Close Top Nav -->

        <!-- Header -->
        <nav class="navbar navbar-expand-lg navbar-light shadow">
            <div class="container d-flex justify-content-between align-items-center">
                <a class="navbar-brand text-success logo h2 align-self-center" href="menu_dashboard.jsp">CLV - Hotel Deluxe</a>                
                <!-- Pagina Responsi -->
                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                    <div class="flex-fill">
                        <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="habitaciones_disponibles.jsp">Habitaciones Disponibles</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Mis Reservaciones</a>
                            </li>                            
                            <li class="nav-item">
                                <a class="nav-link" href="#">Mis Facturas</a>
                            </li>                                                        
                        </ul>
                    </div>
                    <div class="navbar align-self-center d-flex">
                        <!-- Inicio de Sesión -->
                        <a class="nav-icon position-relative text-decoration-none" href="procesos/cerrar_sesion_cliente.jsp">
                            <i class="fa fa-fw fa-user text-dark mr-3"></i>
                            <button type="button" class="btn btn-danger">Cerrar Sesión</button>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Close Header -->
        <!--Fin de Encabezado-->
    </body>
</html>
