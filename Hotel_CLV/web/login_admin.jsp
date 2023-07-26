<%-- 
    Document   : login_admin
    Created on : 17-jul-2023, 20:09:09
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="template/menu/header_menu.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos

        var usuario = document.getElementById("usuario").value.trim();
        var clave = document.getElementById("clave").value.trim();
        // Validar campos obligatorios
        if (usuario === "" || clave === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }

        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>



<div class="container text-center">
    <h1 class="text-success">Portal Administrativo</h1>
    <h2>Inicio de Sesion</h2>
    <div class="row">
        <div class="col">
            <form action="procesos/carga_datos_admin.jsp" method="POST" onsubmit="return validarFormulario();">
                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingrese su usuario empresarial">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="clave" name="password" placeholder="Debe tener entre 8 y 20 caracteres."
                </div>
                <br>
                <button type="submit" class="btn btn-primary" name="ingreso_admin" value="ingreso_admin">Iniciar Sesion</button>
                <br>
                <h6 class="text-info" style="font-family: inherit">
                    Comuniquese con el Administrador, en caso de necesitar ayuda. 
                </h6>
            </form>
        </div>
    </div>
    <!--<img class="img-circle img-responsive"  src="assets/img/login_admin.png">-->
</div>
</div>
<%@include file="template/menu/footer_menu.jsp" %>

