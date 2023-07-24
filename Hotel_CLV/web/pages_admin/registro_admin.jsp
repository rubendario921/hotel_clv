<%-- 
    Document   : registro_admin
    Created on : 20-jul-2023, 12:13:12
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DocumentHTML>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div>
                    <h2 class="page-header">Registro de Nuevo Colaborador </h2>
                </div>

                <form action="Mantenimiento/crudregistrar_admin.jsp" method="POST" class="align-items-center">

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
                            <input type="text" class="form-control" placeholder="Telefono de Contacto" aria-label="Last name" id="contacto" name="cont">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col">
                            <input type="text" class="form-control" placeholder="Usuario" aria-label="First name" id="usuario" name="usu">
                        </div>
                        <div class="col">
                            <input type="password" class="form-control" placeholder="Contraseña" aria-label="Last name" id="clave" name="pass">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col">
                            <input type="email" class="form-control" placeholder="Correo Electronico" aria-label="First name" id="correo" name="corr">
                        </div>
                        <div class="col">
                            <input type="number" class="form-control" placeholder="Perfil" aria-label="Last name" id="perfil" name="perfil">
                        </div>
                    </div>
                    <br>    
                    <div class="align-items-center">
                        <button type="submit" class="btn btn-primary" value="nuevo" name="nuevo">Registrar</button>    
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="template/footer_admin.jsp" %>