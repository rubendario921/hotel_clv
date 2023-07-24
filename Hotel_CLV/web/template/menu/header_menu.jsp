<%-- 
    Document   : header
    Created on : 17-jul-2023, 19:14:30
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Inicio de Encabezado-->
<!DOCTYPE html>
<head>
    <title>Hotel CLV - El placer de dormir</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!--Link de CDN de Bootstrap-->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
</head>

<body>
    <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-user mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="login_admin.jsp">Portal Administrativo</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="contactenos.jsp">Contactanos</a>
                </div>
                <div>
                    <a class="text-light" href="https://fb.com/" target="_blank" rel="sponsored"><i
                            class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i
                            class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank"><i
                            class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i
                            class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->

    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand text-success logo h2 align-self-center" href="index.jsp">CLV - Hotel Deluxe</a>
            <!--Pagina Responsi-->
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
                    data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
                 id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="habitaciones.jsp">Habitaciones</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="servicios.jsp">Servicios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contactenos.jsp">Atención al Cliente</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-success nav-link" role="button" href="registro.jsp ">Crea una Cuenta</a>
                        </li>
                    </ul>
                </div>

                <div class="navbar align-self-center d-flex">

                    <!--Icono de lupa para buscar
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal"
                        data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>-->
                    <!--Icono de Carrito de Compras
                    <a class="nav-icon position-relative text-decoration-none" href="">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span
                            class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">1</span>
                    </a>-->

                    <!--Inicio de Sesion-->

                    <a class="nav-icon position-relative text-decoration-none" href="pages_cliente/menu_cliente.jsp">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <button type="button" class="btn btn-success">Iniciar Sesión</button>
                    </a>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->
    <!--Fin de Encabezado-->