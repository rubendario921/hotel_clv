<%-- 
    Document: registro
    Created on: 17-jul-2023, 19:27:08
    Author: Ruben Dario 921
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="template/menu/header_menu.jsp" %>
<style>
    .container {
        margin-top: 50px;
    }

    .form-control {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
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
        width: 200px; /* Ajusta el tamaño de la imagen */
        height: 200px; /* Ajusta el tamaño de la imagen */
        object-fit: cover; /* Ajusta el contenido de la imagen */
    }

    /* Estilos para el formulario */
    .form-wrapper {
        background-color: #f9f9f9;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
    }

    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="password"] {
        width: 100%;
    }

    .form-group input[type="text"]:focus,
    .form-group input[type="email"]:focus,
    .form-group input[type="password"]:focus {
        border-color: #719ECE;
    }

    .form-group .form-text {
        color: #777;
    }

    .form-group .alert-warning {
        margin-top: 5px;
    }

    .form-group .btn {
        width: 100%;
    }

    /* Estilos para el botón Registrar */
    .btn-registrar {
        background-color: #27ae60;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
    }

    .btn-registrar:hover {
        background-color: #219653;
    }

    .btn-registrar:focus {
        outline: none;
    }

    /* Estilos para el encabezado del formulario */
    .form-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .form-header h3 {
        margin: 0;
        font-size: 24px;
        font-weight: bold;
        color: #333;
    }
</style>

<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombres = document.getElementById("nombre").value.trim();
        var apellidos = document.getElementById("apellido").value.trim();
        var cedula = document.getElementById("cedula").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var usuario = document.getElementById("usuario").value.trim();
        var clave = document.getElementById("clave").value.trim();
        var fregistro = document.getElementById("fregistro").value.trim();


        // Validar campos obligatorios
        if (nombres === "" || apellidos === "" || cedula === "" || usuario === "" || telefono === "" || correo === "" || clave === "" || fregistro === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        // Validar que la contraseña contenga al menos una mayúscula, una minúscula y un número
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/;
        if (!passwordPattern.test(clave)) {
            alert("La contraseña debe contener al menos una mayúscula, una minúscula y un número.");
            return false; // Detener el envío del formulario
        }

        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="form-wrapper">
                <div class="form-header">
                    <img class="img-fluid oval-image" src="assets/img/banner_img_logo_opcional.jpg" alt="">
                    <h3>Usuario Nuevo</h3>
                </div>
                <form action="Mantenimiento/crudcliente_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                    <div class="form-group">
                        <label for="fregistro" class="label-text">Fecha de Registro</label>
                        <input type="datetime-local" id="fregistro" name="fregistro" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="nombre" class="label-text">Nombres Completos</label>
                        <input type="text" id="nombre" name="nombre" placeholder="Ingrese sus dos nombres" class="form-control"   maxlength="200" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido" class="label-text">Apellidos Completos</label>
                        <input type="text"  id="apellido" name="apellido" placeholder="Ingrese sus dos apellidos" class="form-control"   maxlength="200" required>
                    </div>
                    <div class="form-group">
                        <label for="cedula" class="label-text">Cédula de Identidad</label>
                        <input type="text" id="cedula" name="cedula" placeholder="Ingrese su numero de cedula o RUC" class="form-control"   maxlength="13" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono" class="label-text">Teléfono</label>
                        <input type="text" id="telefono" name="telefono" placeholder="Ingrese su numero telefonico" class="form-control" maxlength="10"  required >
                    </div>
                    <div class="form-group">
                        <label for="usuario" class="label-text">Ingrese un Usuario</label>
                        <input type="text" id="usuario" name="usuario" placeholder="Ingrese un usuario para el sistema" class="form-control" maxlength="45" required>
                    </div>
                    <div class="form-group">
                        <label for="correo" class="label-text">Correo Electrónico</label>
                        <input type="email" id="correo" name="correo" placeholder="Ingrese su correo electronico" class="form-control"  required maxlength="200">
                        <small class="form-text">*Su inicio de sesión será con el correo electrónico</small>
                    </div>
                    <div class="form-group">
                        <label for="clave" class="label-text">Contraseña</label>
                        <input type="password" id="clave" name="clave"  placeholder="Ingrese su contraseña personal" class="form-control" required maxlength="16">
                        <small class="form-text">*Entre 8 y 16 dígitos con caracteres especiales</small>
                    </div>
                    <button class="btn btn-registrar" value="Registrar" name="nuevo_cliente">Registrar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="template/menu/footer_menu.jsp" %>
