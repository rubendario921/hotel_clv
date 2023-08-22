<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="template/menu/header_menu.jsp" %>

<style>
    /* Estilos para el formulario */
    .container {
        margin-top: 30px;
    }

    .card {
        background-color: #f9f9f9;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
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
    }

    .btn-primary {
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        color: #fff;
        cursor: pointer;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    /* Estilos para la imagen */
    .img-fluid img {
        width: 100%;
        border-radius: 5px;
    }
</style>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombres = document.getElementById("nombre").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var asunto = document.getElementById("asunto").value.trim();
        var mensaje = document.getElementById("mensaje").value.trim();
        var ciudad = document.getElementById("ciudad").value.trim();

        // Validar campos obligatorios
        if (nombres === "" || correo === "" || telefono === "" || asunto === "" || mensaje === "" || ciudad === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div class="container text-center">
    <div class="row justify-content-center">
        <!--Formulario/ Section lado izquierdo-->
        <div class="col-md-6">
            <h2>Formulario de Contacto</h2>
            <div class="card">
                <section>
                    <form class="row g-3" action="Mantenimiento/crudcontacto_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                        <div class="col-md-6">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese su nombre" maxlength="50" autocomplete="true" required>
                        </div>

                        <div class="col-md-6">
                            <label for="correo" class="form-label">Correo Electrónico</label>
                            <input type="email" class="form-control" id="correo" name="correo" placeholder="Ingrese su correo electrónico" autocomplete="true" required>
                        </div>

                        <div class="col-md-6">
                            <label for="telefono" class="form-label">Teléfono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Ingrese su numero de contacto" autocomplete="true" maxlength="10" required>
                        </div>

                        <div class="col-md-12">
                            <label for="asunto" class="form-label">Asunto</label>
                            <input type="text" class="form-control" id="asunto" name="asunto" placeholder="Ingrese el asunto del mensaje" autocomplete="true" required>
                        </div>

                        <div class="col-md-12">
                            <label for="mensaje" class="form-label">Mensaje</label>
                            <textarea class="form-control" id="mensaje" name="mensaje" rows="4" placeholder="Escriba aquí su mensaje" required></textarea>
                        </div>

                        <div class="col-md-6">
                            <label for="ciudad" class="form-label">Ciudad</label>
                            <input type="text" class="form-control" id="ciudad" name="ciudad" placeholder="Ciudad de residencia" maxlength="45" autocomplete="true" required>
                        </div>                                              
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block" value="nuevo_formulario" name="nuevo_formulario">Enviar</button>
                        </div>
                    </form>
                </section>
            </div>
        </div>
        <!--Imagen lado derecho-->
        <div class="col-md-4">
            <div class="img-fluid">
                <img src="assets/img/shop_07.jpg" alt="Imagen">
            </div>
        </div>
    </div>
</div>
<%@include file="template/menu/footer_menu.jsp" %>