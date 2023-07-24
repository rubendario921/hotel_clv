<%-- 
    Document   : registro
    Created on : 17-jul-2023, 19:27:08
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/menu/header_menu.jsp" %>


<div class="container text-center">
    <div class="row">
        <div class="col">
            <img class="img-fluid" src="assets/img/shop_09.jpg" alt="">
        </div>
        <div class="col-6">
            <br>
            <h3>Usuario Nuevo</h3>
            <form action="Mantenimiento/crudregistrar_cliente.jsp" method="POST" class="align-items-center">

                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Nombres Completos" aria-label="First name" id="nombre" name="nom">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Apellidos Completos" aria-label="Last name" id="apellido" name="ape">
                    </div>                    
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Cedula de Identidad" aria-label="First name" id="cedula" name="cedu">
                    </div>  
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Ingrese un usuario" aria-label="Last name" id="usuario" name="usu">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Telefono de Contacto" aria-label="Last name" id="contacto" name="cont">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <input type="email" class="form-control alert alert-warning" rol="alert" placeholder="Correo Electronico" aria-label="First name" id="correo" name="corr">
                        <h6 style="font-size: xx-small">*Su inicio de sesión sera con el correo electronico</h6>
                    </div>
                    <div class="col">
                        <input type="password" class="form-control alert alert-warning" rol="alert" placeholder="Contraseña" aria-label="Last name" id="clave" name="pass">
                        <h6 style="font-size: xx-small">*Entre 8 y 16 digitos con caracteres especiales</h6>
                    </div>
                </div>
                <br>
                <div class="text-center">
                    <button class="btn btn-success" value="Registrar" name="nuevo">Regsitrar</button>
                </div>

                <!--
                <div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 75%"></div>
                </div>-->



            </form>
        </div>

        <div class="col">
            <img class="img-fluid" src="assets/img/shop_11.jpg" alt="">
        </div>
    </div>
</div>


<%@include file="template/menu/footer_menu.jsp" %>
