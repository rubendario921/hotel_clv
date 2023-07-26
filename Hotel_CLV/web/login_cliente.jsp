<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="template/menu/header_menu.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3 order-md-last">
            <h1 class="text-success mb-4">Inicio de Sesión Usuarios</h1>
            <h2>Inicio de Sesión</h2>
            <form action="procesos/carga_datos_cliente.jsp" method="POST" class="mt-4">
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
        <div class="col-md-4 offset-md-1 order-md-first">
            <img class="img-circle img-responsive" src="assets/img/login_admin.png" alt="Login Image">
        </div>
    </div>
</div>

<%@include file="template/menu/footer_menu.jsp" %>
