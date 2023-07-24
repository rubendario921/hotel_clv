<%-- 
    Document   : editar_admin
    Created on : 20-jul-2023, 11:33:36
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.clUsuarios, java.sql.*"%>
<%@page import="Model.conexion,java.sql.*" %>
<%@include file="template/header_admin.jsp"%>

<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificación - Datos del Colaborador</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Empleado</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento/crudedtiar_admin.jsp" method="POST">
                            <%
                                String id = request.getParameter("id");
                                int idUsuario = Integer.parseInt(id);
                                conexion cn = new conexion();

                                String sql = "SELECT * FROM empleados WHERE emp_id = ?";
                                PreparedStatement st = cn.getConexion().prepareStatement(sql);
                                st.setInt(1, idUsuario);
                                ResultSet rs = st.executeQuery();

                                while (rs.next()) {%>

                            <label>Codigo_Id: </label><input type="text" value="<%= rs.getInt("emp_id")%>" class="form-control" name="id" disabled="True"/>            
                            <br>
                            <label>Nombres: </label><input type="text" value="<%=rs.getString("emp_nombres")%>" class="form-control" name="nom"/>
                            <br>
                            <label>Apellidos: </label><input type="text" value="<%=rs.getString("emp_apellidos")%>" class="form-control" name="ape"/>
                            <br>
                            <label>Cedula de Identidad: </label><input type="text" value="<%=rs.getString("emp_cedula")%>" class="form-control" name="cedu"/>
                            <br>
                            <label>Usuario: </label><input type="text" value="<%=rs.getString("emp_usuario")%>" class="form-control" name="cedu"/>
                            <br>
                            <label>Contraseña: </label><input type="text" value="<%=rs.getString("emp_clave")%>" class="form-control" name="pass"/>
                            <br>
                            <label>Número de Contacto: </label><input type="number" value="<%=rs.getInt("emp_contacto")%>" class="form-control" name="cont"/>
                            <br>
                            <label>Correo Electronico: </label><input type="email" value="<%=rs.getString("emp_correo")%>" class="form-control" name="corr"/>
                            <br>                            
                            <label>Perfil: </label><input type="text" value="<%=rs.getInt("emp_perfil")%>" class="form-control" name="per"/>
                            <br>
                            <label>Estado: </label><input type="text" value="<%=rs.getString("emp_estado")%>" class="form-control" name="est"/>
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