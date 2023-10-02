<%-- 
    Document: registro
    Created on: 17-jul-2023, 19:27:08
    Author: Ruben Dario 921
--%>
<%@page import="Controller.TipoDocumentos"%>
<%@page import="java.util.List"%>
<%@page import="Controller.TipoDocumentoDao"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="template/menu/header_menu.jsp" %>
<style>
    .form-control {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
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
    h2 {
        color: #007bff;    
    }
</style>

<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombres = document.getElementById("nombres").value.trim();
        var apellidos = document.getElementById("apellidos").value.trim();
        var numDocumento = document.getElementById("numDocumento").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var usuario = document.getElementById("usuario").value.trim();
        var clave = document.getElementById("clave").value.trim();
        // Validar campos obligatorios
        if (nombres === "" || apellidos === "" || numDocumento === "" || usuario === "" || telefono === "" || correo === "" || clave === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }

        // Verifica que el número  tenga 10 dígitos numéricos
        if (!/^\d{10}$/.test(telefono)) {
            alert("La teléfono de contacto debe tener 10 dígitos numéricos");
            return false;
        }
        //Validacion de la cedula de identidad
        var cedula = numDocumento;
        // Verificar que la cédula tenga 10 dígitos numéricos
        if (!/^\d{10}$/.test(cedula)) {
            alert("La cédula de identidad debe tener 10 dígitos numéricos");
            return false;
        }
        // Validar el dígito verificador
        var coeficientes = [2, 1, 2, 1, 2, 1, 2, 1, 2];
        var total = 0;
        for (var i = 0; i < 9; i++) {
            var digito = parseInt(cedula.charAt(i), 10);
            var producto = digito * coeficientes[i];
            total += producto >= 10 ? producto - 9 : producto;
        }
        var digitoVerificador = (Math.ceil(total / 10) * 10) - total;
        if (digitoVerificador !== parseInt(cedula.charAt(9), 10)) {
            alert("La cédula de identidad no es válida");
            return false;
        }
        // Validar que la contraseña contenga al menos una mayúscula, una minúscula y un número
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/;
        if (!passwordPattern.test(clave)) {
            alert("La contraseña debe contener al menos una mayúscula, una minúscula y un número.");
            return false; // Detener el envío del formulario
        }
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<br />
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="img-fluid">
                <img src="assets/img/shop_11.jpg" alt="Imagen">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-wrapper">
                <div class="form-header">
                    <h2>Usuario Nuevo</h2>
                </div>
                <form action="Mantenimiento/crudcliente_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                    <div class="form-group">
                        <label for="nombre" class="label-text">Nombres Completos</label>
                        <input type="text
                               " id="nombres" name="nombres" placeholder="Ingrese sus nombres" class="form-control"   maxlength="200" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido" class="label-text">Apellidos Completos</label>
                        <input type="text"  id="apellidos" name="apellidos" placeholder="Ingrese sus dos apellidos" class="form-control"   maxlength="200" autocomplete="off" required>
                    </div>

                    <!-- Tipo de Documento-->

                    <label for="nombre" class="label-text">Tipo</label>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-auto">                             
                                <select class="form-select">
                                    <option selected>Seleccione una opción</option>
                                    <%
                                        TipoDocumentoDao mostrar_tipoDoc = new TipoDocumentoDao();
                                        List<TipoDocumentos> tipoDocumentos = mostrar_tipoDoc.mostrarListaTipoDocumento();
                                        for (TipoDocumentos tipoDoc : tipoDocumentos) {
                                    %>
                                    <option value="<%= tipoDoc.getDocI_id()%>"><%= tipoDoc.getDocI_nombre()%></option>
                                    <% }%>
                                </select>
                            </div>
                            <div class="col-auto">
                                <input type="text" id="numDocumento" name="numDocumento" placeholder="Número de Documento" class="form-control" minlength="20"  maxlength="20" autocomplete="off" required>
                            </div>                               

                        </div>
                    </div>

                    <!--Tipo de Prefijo-->

                    <!--Tipo de Prefijo-->
                    <div class="form-group">
                        <label for="telefono" class="label-text">Teléfono Celular</label>
                        <input type="text" id="telefono" name="telefono" placeholder="Ingrese su número telefonico celular" class="form-control" minlength="10" maxlength="10" autocomplete="off" required >
                    </div>
                    <div class="form-group">
                        <label for="correo" class="label-text">Correo Electrónico</label>
                        <input type="email" id="correo" name="correo" placeholder="Ingrese su correo electronico" class="form-control" maxlength="200" autocomplete="off" required>
                        <small class="form-text">*Su inicio de sesión será con el correo electrónico</small>
                    </div>
                    <div class="form-group">
                        <label for="usuario" class="label-text">Usuario Personal</label>
                        <input type="text" id="usuario" name="usuario" placeholder="Ingrese su usuario para el sistema" class="form-control" maxlength="45" autocomplete="off" required>
                    </div>                 
                    <div class="form-group">
                        <label for="clave" class="label-text">Contraseña</label>
                        <input type="password" id="clave" name="clave"  placeholder="Ingrese su contraseña personal" class="form-control" required maxlength="16" autocomplete="off">
                        <small class="form-text"><b>*Entre 8 y 16 dígitos con MAYUSCULAS, minusculas, c@r@ctere$ e$peciales</b></small>
                    </div>
                    <button class="btn btn-registrar" value="Registrar" name="nuevo_cliente">Registrar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="template/menu/footer_menu.jsp" %>