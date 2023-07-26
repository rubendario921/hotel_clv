<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Servicios</title>
    <style>
        .img-container {
            width: 300px;
            height: 250px;
            margin: 10px;
            position: relative;
            overflow: hidden;
            display: inline-block; /* Agregamos esta propiedad para que se muestren en línea */
        }

        .img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .img-name {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 5px;
            text-align: center;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        .img-container:hover .img-name {
            opacity: 1;
        }
    </style>
</head>
<body>
    <%@include file="template/menu/header_menu.jsp" %>

   <div class="h2"><strong>Listado de todos los servicios</strong></div>

    <br>

    <div class="img-container">
        <img class="img-fluid" src="./assets/img/servicios_1.jpg" alt="">
        <div class="img-name">Servicio de Catering</div>
    </div>

    <div class="img-container">
        <img class="img-fluid" src="./assets/img/servicio_2.jpg" alt="">
        <div class="img-name">Piscina</div>
    </div>

    <div class="img-container">
        <img class="img-fluid" src="./assets/img/servicio_3.jpg" alt="">
        <div class="img-name">Bar</div>
    </div>

    <div class="img-container">
        <img class="img-fluid" src="./assets/img/servicio_4.jpg" alt="">
        <div class="img-name">Gimnasio</div>
    </div>

    <br>

    <%@include file="template/menu/footer_menu.jsp" %>
</body>
</html>
