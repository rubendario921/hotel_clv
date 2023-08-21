<%-- 
    Document   : editar_admin
    Created on : 20-jul-2023, 11:33:36
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DocumentHTML>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificación de Datos</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar</h3>
                    </div>
                    <div class="panel-body">
                        <form action="" method="POST">
                            <%
                                String id = request.getParameter("id");
                                int idUsuario = Integer.parseInt(id);
                                conexion cn = new conexion();

                                String sql = "SELECT * FROM personas WHERE per_id = ?";
                                PreparedStatement st = cn.getConexion().prepareStatement(sql);
                                st.setInt(1, idUsuario);
                                ResultSet rs = st.executeQuery();

                                while (rs.next()) {%>

                            <label>Codigo_Id: </label><input type="text" value="<%= rs.getInt("per_id")%>" class="form-control" name="id" />            
                            <br>
                            <label>Nombres: </label><input type="text" value="<%=rs.getString("per_nombres")%>" class="form-control" name="nom"/>
                            <br>
                            <label>Apellidos: </label><input type="text" value="<%=rs.getString("per_apellidos")%>" class="form-control" name="ape"/>
                            <br>
                            <label>Cedula de Identidad: </label><input type="text" value="<%=rs.getString("per_cedula")%>" class="form-control" name="cedu"/>
                            <br>
                            <label>Número de Contacto: </label><input type="textr" value="<%=rs.getInt("per_telefono")%>" class="form-control" name="cont"/>
                            <br>
                            <label>Correo Electronico: </label><input type="email" value="<%=rs.getString("per_correo")%>" class="form-control" name="corr"/>
                            <br>                            
                            <label>Usuario: </label><input type="text" value="<%=rs.getString("per_usuario")%>" class="form-control" name="cedu"/>
                            <br>
                            <label>Contraseña: </label><input type="text" value="<%=rs.getString("per_clave")%>" class="form-control" name="pass"/>
                            <br>
                            <label>Estado: </label><input type="text" value="<%=rs.getString("estados_esta_id")%>" class="form-control" name="est"/>
                            <br>
                            <label>Perfil: </label><select name="perfil" id="perfil" class="form-control">
                                <option>Seleccionar una Opcion</option>
                                <option value="1">Administrador</option>
                                <option value="2">Supervisor</option>
                                <option value="3">Recepcionista</option>
                                <option value="4">Cliente</option>
                            </select>
                            <br>
                            <% }%>
                            <input type="submit" value="Editar" name="editar" class="btn-primary"/>
                        </form>                       
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>

<%@include file="../template/admin/footer_admin.jsp" %>