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

<div class="container text-center">
  <div class="row justify-content-center">
    <!--Formulario/ Section lado izquierdo-->
    <div class="col-md-6">
      <h2 class="h4">Formulario de Contacto</h2>
      <div class="card">
        <section>
          <form class="row g-3" title="Contact Form">
            <div class="col-md-6">
              <label for="nombre" class="form-label">Nombre</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese su nombre" required>
            </div>

            <div class="col-md-6">
              <label for="correo" class="form-label">Correo Electrónico</label>
              <input type="email" class="form-control" id="correo" name="correo" placeholder="Ingrese su correo electrónico" required>
            </div>
              
              <div class="col-md-66">
              <label for="telefono" class="form-label">Telefono</label>
              <input type="text" class="form-control" id="correo" name="telefono" placeholder="Ingrese su numero de contacto" required>
            </div>

            <div class="col-md-12">
              <label for="asunto" class="form-label">Asunto</label>
              <input type="text" class="form-control" id="asunto" name="asunto" placeholder="Ingrese el asunto del mensaje" required>
            </div>

            <div class="col-md-12">
              <label for="mensaje" class="form-label">Mensaje</label>
              <textarea class="form-control" id="mensaje" name="mensaje" rows="4" placeholder="Escriba aquí su mensaje" required></textarea>
            </div>

            <div class="col-md-6">
              <label for="inputCity" class="form-label">Ciudad</label>
              <input type="text" class="form-control" id="inputCity" placeholder="Quito, Ecuador" name="ciudad">
            </div>

            <div class="col-md-6">
              <label for="inputState" class="form-label">Opciones</label>
              <select id="inputState" class="form-select" name="estado">
                <option selected>Opciones</option>
                <option>Precios</option>
                <option>Estadia</option>
                <option>Habitaciones</option>
              </select>
            </div>
                                      
            <div class="col-12">
              <fieldset>
                <legend class="form-label">Gracias por Preferirnos..!</legend>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="gridCheck" name="check">
                  <label class="form-check-label" for="gridCheck">Acepto los términos y condiciones</label>
                </div>
              </fieldset>
            </div>

            <div class="col-12">
              <button type="submit" class="btn btn-primary btn-block">Enviar</button>
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