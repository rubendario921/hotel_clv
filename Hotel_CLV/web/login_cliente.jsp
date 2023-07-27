<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Portal Usuarios</title>
    <%@include file="template/menu/header_menu.jsp" %>
    <style>
        /* Estilos para el formulario */
        .container {
            margin-top: 50px;
        }

        .form-control {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            width: 100%;
        }

        .form-control:focus {
            outline: none;
            box-shadow: 0 0 5px #719ECE;
            border-color: #719ECE;
        }

        .btn {
            padding: 10px 20px;
        }

        .alert-warning {
            margin-top: 10px;
        }

        .form-text {
            font-size: 12px;
            color: #777;
        }

        .label-text {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .oval-image {
            border-radius: 50%;
            width: 250px; /* Ajusta el tamaño de la imagen */
            height: 250px; /* Ajusta el tamaño de la imagen */
            object-fit: cover; /* Ajusta el contenido de la imagen */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1 class="text-success mb-4 text-center">Portal Usuarios</h1>
                <div class="text-center">
                    <img class="img-fluid oval-image" src="assets/img/banner_img_logo_opcional.jpg" alt="">
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-success text-white text-center">
                        <h2 class="mb-0">Inicio de Sesión</h2>
                    </div>
                    <div class="card-body">
                        <form action="procesos/carga_datos_cliente.jsp" method="POST" onsubmit="return validarFormulario();">
                            <div class="mb-3">
                                <label for="email" class="form-label label-text">Correo Electrónico</label>
                                <input type="email" class="form-control" id="correo" name="correo" placeholder="example@hoteldeluxe.com" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label label-text">Contraseña</label>
                                <input type="password" class="form-control" id="clave" name="password" placeholder="Ingrese su contraseña" required>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-block" name="ingreso_cliente" value="ingreso_cliente">Iniciar Sesión</button>
                            </div>
                            <div class="text-center mt-3">
                                <a href="#" class="form-text">¿Olvidó su contraseña?</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="alert alert-warning text-center mt-3">
                    <h6 class="mb-0">
                        Comuníquese con el Soporte en caso de necesitar ayuda.
                    </h6>
                </div>
            </div>
        </div>
    </div>
    <%@include file="template/menu/footer_menu.jsp" %>

    <!-- JavaScript -->
    <script>
        // Función validarFormulario() aquí
        function validarFormulario() {
            // Obtener los valores de los campos
            var correo = document.getElementById("correo").value.trim();
            var clave = document.getElementById("clave").value.trim();

            // Validar campos obligatorios
            if (correo === "" || clave === "") {
                alert("Por favor, complete todos los campos.");
                return false; // Detener el envío del formulario
            }

            return true; // Permitir el envío del formulario si todos los campos están llenos
        }
    </script>

<div class="container text-center mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3 order-md-last">
            <h1 class="text-success mb-4">Portal Usuarios</h1>
            <h2>Inicio de Sesión</h2>
            <form action="procesos/carga_datos_cliente.jsp" method="POST" class="mt-4" onsubmit="return validarFormulario();">
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" class="form-control" id="correo" name="correo" placeholder="example@hoteldeluxe.com">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="clave" name="password" placeholder="Ingrese su contraseña">
                </div>
                <br>
                <button type="submit" class="btn btn-primary btn-block" name="ingreso_cliente" value="ingreso_cliente">Iniciar Sesión</button>
                <br>
                <h6 class="text-info" style="font-family: 'Arial', sans-serif;">
                    Comuníquese con el Soporte en caso de necesitar ayuda.
                </h6>
            </form>
        </div>
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <img class="img-fluid oval-image" src="assets/img/banner_img_logo_opcional.jpg" alt="">
                   
                </div>
            </div>
        </div>
    </div>
    <%@include file="template/menu/footer_menu.jsp" %>
