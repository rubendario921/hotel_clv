<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="template/menu/header_menu.jsp" %>

<style>
    /* Estilos para todo el formulario */
    .card {
        background-color: #f9f9f9;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-label {
        font-weight: bold;
        color: #333;
    }

    .form-control {
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        transition: border-color 0.3s;
    }

    .form-control:focus {
        border-color: #007bff; 
    }

    .btn-primary {
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn-primary:hover {
        background-color: #0056b3; 
    }

    /* Estilos para la imagen */
    .img-fluid img {
        width: 100%;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }


    h2 {
        color: #007bff;
    }


    body {
        background-color: #f3f3f3;
    }
</style>

<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombres = document.getElementById("nombres").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var asunto = document.getElementById("asunto").value.trim();
        var mensaje = document.getElementById("mensaje").value.trim();
        var ciudad = document.getElementById("ciudad").value.trim();

        // las validaciones de campos obligatorios
        if (nombres === "" || correo === "" || telefono === "" || asunto === "" || mensaje === "" || ciudad === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        return true;
    }
</script>
<br />
<div class="container text-center">
    <div class="row justify-content-center">
        <!-- Formulario quew  va al lado izquierdo -->
        <div class="col-md-6">
            <h2>Buzón de Sugerencias</h2>
            <div class="card">
                <section>
                    <form class="row g-3" action="Mantenimiento/crudcontacto_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                        <div class="col-md-6">
                            <label for="nombres" class="form-label">Nombre y Apellido</label>
                            <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Ingrese su nombre y apellido" maxlength="50" autocomplete="true" required>
                        </div>
                        <div class="col-md-6">
                            <label for="correo" class="form-label">Correo Electrónico</label>
                            <input type="email" class="form-control" id="correo" name="correo" placeholder="Ingrese su correo electrónico" autocomplete="true" required>
                        </div>
                        <div class="col-md-6">
                            <label for="telefono" class="form-label">Teléfono de Contacto</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Ingrese su teléfono de contacto" autocomplete="true" maxlength="10" required>
                        </div>
                        <div class="col-md-6">
                            <label for="ciudad" class="form-label">Ciudad</label>
                            <input type="text" class="form-control" id="ciudad" name="ciudad" placeholder="Ciudad de residencia" maxlength="45" autocomplete="true" required>
                        </div> 
                        <div class="col-md-12">
                            <label for="asunto" class="form-label">Asunto</label>
                            <input type="text" class="form-control" id="asunto" name="asunto" placeholder="Ingrese el asunto del mensaje" autocomplete="true" required>
                        </div>
                        <div class="col-md-12">
                            <label for="mensaje" class="form-label">Mensaje</label>
                            <textarea class="form-control" id="mensaje" name="mensaje" rows="4" placeholder="Escriba aquí su mensaje" required></textarea>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block" value="nuevo_formulario" name="nuevo_formulario">Enviar</button>
                        </div>
                    </form>
                </section>
            </div>
        </div>
        <!-- aqui va la imagen del lado derecho -->
        <div class="col-md-5">
            <div class="img-fluid">
                <img src="assets/img/shop_07.jpg" alt="Imagen">
            </div>
        </div>
    </div>
</div>
<%@include file="template/menu/footer_menu.jsp" %>