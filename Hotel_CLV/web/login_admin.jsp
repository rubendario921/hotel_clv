<%-- 
    Document   : login_admin
    Created on : 17-jul-2023, 20:09:09
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="template/menu/header_menu.jsp" %>

<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
    <title>Portal Administrativo - Inicio de Sesión</title>
    <link rel="stylesheet" href="ruta/tu_estilo_personalizado.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <img src="./assets/img/logo-opcional.jpg" alt="Logo del hotel" width="200">
                        <h1>Portal Administrativo</h1>
                        <h2>Inicio de Sesión</h2>
                    </div>
                    <div class="card-body">
                        <form action="carga_datos_admin.jsp" method="POST">
                            <div class="form-group">
                                <label for="usuario">Usuario</label>
                                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingrese su Usuario Empresarial" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Contraseña</label>
                                <input type="password" class="form-control" id="clave" name="password" placeholder="Debe tener entre 8 y 20 caracteres." required>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" name="ingreso_admin" value="ingreso_admin">Iniciar Sesión</button>
                            </div>
                            <br>
                            
                        </form>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%@include file="template/footer_menu.jsp" %>
=======
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
>>>>>>> 8d5d4e45e06d921f5c1bdcf547f25c092b27c2bb
