<%-- 
    Document   : login_admin
    Created on : 17-jul-2023, 20:09:09
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="template/menu/header_menu.jsp" %>
<!DOCTYPE html>

<div class="container text-center">
    <h1 class="text-success">Portal Administrativo</h1>
    <h2>Inicio de Sesion</h2>
    <div class="row">
        <div class="col">
            <form action="procesos/carga_datos_admin.jsp" method="POST">
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
    <div class="col-md-auto">
        <img class="img-circle img-responsive"  src="assets/img/login_admin.png">
    </div>

</div>
</div>
<%@include file="template/menu/footer_menu.jsp" %>

