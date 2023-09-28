<%-- 
    Document   : contenido_menu
    Created on : 17-jul-2023, 19:13:44
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<img class="d-block w-100" alt="450" height="500" width="600" src="assets/img/hotel_1.jpg" alt="">

<!-- Start Banner Hero -->
<div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators">
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <br>
                        <br>

                        <img class="img-fluid" src="./assets/img/3page-img13.jpg" alt="">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left align-self-center" style="text-align: justify;">
                            <h1 class="h1 text-success"><b>CLV</b> Hotel Deluxe</h1>
                            <h3 class="h2">El placer de descansar con nosotros</h3>
                            <p>
                                Nuestras lujosas habitaciones han sido diseñadas para los viajeros y las familias modernas. 
                                Podrás notarlo desde el momento en que ingresas a tu habitación, hasta que la dejas en la fecha de salida. 
                                Cada detalle ha sido pensado para que tenga la mejor experiencia posible, que una habitación de huéspedes puede brindar. 
                                En CLV Hotel Delux en Quito te ofrecerá todo el confort que deseas: ropa de cama de lujo, camas con colchones especialmente diseñados para el mejor 
                                descanso posible, cómodas áreas de descanso que puedes ajustar a tu necesidad particular y una televisión pantalla plana de alta definición. 
                                Todo ello complementado con la comodidad de nuestras instalaciones y el mejor servicio para que disfrute de una estancia de lujo.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img class="img-fluid" src="./assets/img/364162419.jpg" alt="300" height="300 ">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                            <h1 class="h1">Nuestros Servicio</h1>
                            <h3 class="h2">Tarifas y Habitaciones</h3>
                            <p>
                                Descubra la magia de Ecuador con nuestras irresistibles tarifas de hotel, 
                                donde el confort y la aventura se fusionan para ofrecerle una experiencia inolvidable en este paraíso sudamericano.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="carousel-item">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">                        
                        <img class="img-fluid" src="assets/img/banner_img_24horas.jpg" alt="">

                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                            <h1 class="h1">Servicio 24 HORAS</h1>
                            <h3 class="h2">Comunicate con Nosotros</h3>
                            <p>
                                "Descubre el arte de la hospitalidad en nuestro hotel, donde la calidez de nuestro equipo te hará sentir como en casa desde el primer momento."
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
        <i class="fas fa-chevron-left"></i>
    </a>
    <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
        <i class="fas fa-chevron-right"></i>
    </a>
</div>

<section class="bg-light">
    <div class="container py-5">
        <div class="row text-center py-3">
            <div class="col-lg-6 m-auto">
                
                
                <br>
                <h1 class="h1">Nuestros servicios</h1>
                <p>
                    Descubre la magia de Ecuador y deja que este destino te envuelva con su belleza y hospitalidad.
                    Como Hotel te ofrecemos muchas comodidades.
                </p>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <!-- 1: Habitaciones -->
            <div class="col-12 col-md-4 mb-4">
                <div class="card h-100">
                    <a href="habitaciones.jsp">
                        <img src="./assets/img/banner_img_04.jpeg" class="card-img-top" alt="Imagen de Habitaciones">
                    </a>
                    <div class="card-body">
                        <ul class="list-unstyled d-flex justify-content-between">
                            <li>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-muted fa fa-star"></i>
                                <i class="text-muted fa fa-star"></i>
                            </li>
                            <li class="text-muted text-right">$80.00</li>
                        </ul>
                        <a href="habitaciones.jsp" class="h2 text-decoration-none text-dark">Habitaciones</a>
                        <p class="card-text">
                            Las habitaciones, luminosas y sencillas, cuentan con Wi-Fi gratis y TV, además de baño en habitación. Se ofrece servicio a la habitación.
                        </p>
                        <p class="text-muted">Reviews (24)</p>
                    </div>
                </div>
            </div>

            <!-- 2: Restaurantes -->
            <div class="col-12 col-md-4 mb-4">
                <div class="card h-100">
                    <a href="servicios.jsp">
                        <img src="./assets/img/banner_img_restaurante.jpg" class="card-img-top" alt="Imagen de Restaurantes">
                    </a>
                    <div class="card-body">
                        <ul class="list-unstyled d-flex justify-content-between">
                            <li>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-muted fa fa-star"></i>
                                <i class="text-muted fa fa-star"></i>
                            </li>
                            <li class="text-muted text-right">$20.00</li>
                        </ul>
                        <a href="servicios.jsp" class="h2 text-decoration-none text-dark">Restaurantes</a>
                        <p class="card-text">
                            Hablando de los Restaurantes un lugar muy importante para el usuario. El desayuno se sirve en un restaurante informal. También hay una cocina compartida y un salón.
                        </p>
                        <p class="text-muted">Reviews (48)</p>
                    </div>
                </div>
            </div>

            <!-- 3: Recreación -->
            <div class="col-12 col-md-4 mb-4">
                <div class="card h-100">
                    <a href="servicios.jsp">
                        <img src="./assets/img/banner_img_piscina.jpg" class="card-img-top" alt="Imagen de Recreación">
                    </a>
                    <div class="card-body">
                        <ul class="list-unstyled d-flex justify-content-between">
                            <li>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                            </li>
                            <li class="text-muted text-right">$25.00</li>
                        </ul>
                        <a href="servicios.jsp" class="h2 text-decoration-none text-dark">Recreación</a>
                        <p class="card-text">
                            El área de recreación es algo indispensable y para eso disponemos de una piscina super cómoda para el uso de todos los usuarios.
                        </p>
                        <p class="text-muted">Reviews (74)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>