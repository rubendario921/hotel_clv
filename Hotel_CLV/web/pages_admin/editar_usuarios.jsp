<%-- 
    Document   : editar_usuarios
    Created on : 20-jul-2023, 0:51:44
    Author     : Ruben Dario 921
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.clUsuarios, java.sql.*"%>
<%@page import="Model.conexion,java.sql.*" %>
<%@include file="template/header_admin.jsp"%>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificación - Datos del Usuario</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Cliente</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento/crudeditar_usuarios.jsp" method="POST">
                            <%
                                String id = request.getParameter("id");
                                int idUsuario = Integer.parseInt(id);
                                conexion cn = new conexion();

                                String sql = "SELECT * FROM usuarios WHERE usu_id = ?";
                                PreparedStatement st = cn.getConexion().prepareStatement(sql);
                                st.setInt(1, idUsuario);
                                ResultSet rs = st.executeQuery();

                                while (rs.next()) {%>

                            <label>Codigo_Id: </label><input type="text" value="<%= rs.getInt("usu_id")%>" class="form-control" name="id" disabled="True"/>            
                            <br>
                            <label>Nombres: </label><input type="text" value="<%=rs.getString("usu_nombres")%>" class="form-control" name="nom"/>
                            <br>
                            <label>Apellidos: </label><input type="text" value="<%=rs.getString("usu_apellidos")%>" class="form-control" name="ape"/>
                            <br>
                            <label>Cedula de Identidad: </label><input type="text" value="<%=rs.getString("usu_cedula")%>" class="form-control" name="cedu"/>
                            <br>
                            <label>Número de Contacto: </label><input type="number" value="<%=rs.getInt("usu_contacto")%>" class="form-control" name="cont"/>
                            <br>
                            <label>Correo Electronico: </label><input type="email" value="<%=rs.getString("usu_correo")%>" class="form-control" name="corr"/>
                            <br>
                            <label>Contraseña: </label><input type="text" value="<%=rs.getString("usu_clave")%>" class="form-control" name="pass"/>
                            <br>
                            <label>Estado: </label><input type="text" value="<%=rs.getString("usu_estado")%>" class="form-control" name="est"/>
                            <br>
                            <%}%>
                            <input type="submit" value="Editar" name="editar" class="btn-primary"/>
                        </form>                       
                    </div>

                </div>

            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->



<%@include file="template/footer_admin.jsp" %>