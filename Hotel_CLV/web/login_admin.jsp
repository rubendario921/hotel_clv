<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function validarFormulario() {
                // Obtener los valores de los campos
                var usuario = document.getElementById("usuario").value.trim();
                var password = document.getElementById("password").value.trim();

                // Validar campos obligatorios
                if (usuario === "" || password === "") {
                    alert("Por favor, complete todos los campos.");
                    return false; // Detener el envío del formulario
                }

                // Validar longitud de la contraseña
                if (password.length < 8 || password.length > 16) {
                    alert("La contraseña debe tener entre 8 y 20 caracteres.");
                    return false; // Detener el envío del formulario
                }
                return true; // Permitir el envío del formulario si todos los campos están llenos
            }
        </script>
        <title>Portal Administrativo</title>
        <%@include file="template/menu/header_menu.jsp" %>
        <style>
            /* Estilos para hacer que la imagen sea circular */
            .logo-container {
                width: 100px;
                height: 100px;
                overflow: hidden;
                border-radius: 50%;
                margin: 0 auto;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .logo {
                max-width: 100%;
                max-height: 100%;
                border-radius: 50%;
            }
            .inicio-sesion {
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-success text-white text-center">
                            <div class="logo-container">
                                <img src="assets/img/banner_img_logo_opcional.jpg" alt="Logo" class="logo">
                            </div>
                            <h1 class="mb-0">Portal Administrativo</h1>
                            <h2 class="mb-0 inicio-sesion">Inicio de Sesión</h2>
                        </div>
                        <div class="card-body">
                            <form action="procesos/carga_datos.jsp" method="POST" onsubmit="return validarFormulario();">
                                <div class="mb-3">
                                    <label for="usuario" class="form-label"><strong>Usuario</strong></label>
                                    <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingrese su usuario empresarial" required>
                                </div>

                                <div class="mb-3">
                                    <label for="password" class="form-label"><strong>Contraseña</strong></label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Debe tener entre 8 y 20 caracteres."  maxlength="16" required>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary" name="ingreso_admin" value="ingreso_admin">Iniciar Sesión</button>
                                </div>
                                <div class="text-info mt-3" style="font-family: inherit">
                                    Comuníquese con el Administrador en caso de necesitar ayuda.
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="template/menu/footer_menu.jsp" %>
    </body>
</html>
