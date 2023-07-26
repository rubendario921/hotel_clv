<%-- 
    Document: registro
    Created on: 17-jul-2023, 19:27:08
    Author: Ruben Dario 921
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="template/menu/header_menu.jsp" %>

<style>
    .container {
        margin-top: 20px;
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
        width: 250px; /* Ajusta el tamaño de la imagen */
        height: 250px; /* Ajusta el tamaño de la imagen */
        object-fit: cover; /* Ajusta el contenido de la imagen */
    }
</style>

<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombres = document.getElementById("nombre").value.trim();
        var apellidos = document.getElementById("apellido").value.trim();
        var cedula = document.getElementById("cedula").value.trim();
        var usuario = document.getElementById("usuario").value.trim();
        var telefono = document.getElementById("contacto").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var clave = document.getElementById("clave").value.trim();

        // Validar campos obligatorios
        if (nombres === "" || apellidos === "" || cedula === "" || usuario === "" || telefono === "" || correo === "" || clave === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }

        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>


<div class="container">
    <div class="row">
        <div class="col text-center">
            <img class="img-fluid oval-image" src="assets/img/banner_img_logo_opcional.jpg" alt="">
            <br>
            <br>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-6">
            <h3 class="text-center">Usuario Nuevo</h3>
            <br>
            <form action="Mantenimiento/crudregistrar_cliente.jsp" method="POST" onsubmit="return validarFormulario();">
                <div class="row">
                    <div class="col">
                        <label for="nombre" class="label-text">Nombres Completos</label>
                        <input type="text" class="form-control" id="nombre" name="nom">
                    </div>
                    <div class="col">
                        <label for="apellido" class="label-text">Apellidos Completos</label>
                        <input type="text" class="form-control" id="apellido" name="ape">
                    </div>                    
                </div>

                <div class="row mt-3">
                    <div class="col">
                        <label for="cedula" class="label-text">Cédula de Identidad</label>
                        <input type="text" class="form-control" id="cedula" name="cedu">
                    </div>  
                    <div class="col">
                        <label for="usuario" class="label-text">Ingrese un Usuario</label>
                        <input type="text" class="form-control" id="usuario" name="usu">
                    </div>
                    <div class="col">
                        <label for="contacto" class="label-text">Teléfono</label>
                        <input type="text" class="form-control" id="contacto" name="cont">
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col">
                        <label for="correo" class="label-text">Correo Electrónico</label>
                        <input type="email" class="form-control alert alert-warning" role="alert" id="correo" name="corr">
                        <small class="form-text">*Su inicio de sesión será con el correo electrónico</small>
                    </div>
                    <div class="col">
                        <label for="clave" class="label-text">Contraseña</label>
                        <input type="password" class="form-control alert alert-warning" role="alert" id="clave" name="pass">
                        <small class="form-text">*Entre 8 y 16 dígitos con caracteres especiales</small>
                    </div>
                </div>

                <div class="row mt-3 justify-content-center">
                    <div class="col-6 text-center">
                        <button class="btn btn-success" value="Registrar" name="nuevo">Registrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="template/menu/footer_menu.jsp" %>
