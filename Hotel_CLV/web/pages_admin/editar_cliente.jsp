<%-- 
    Document   : editar_cliente
    Created on : 20-jul-2023, 0:51:44
    Author     : Ruben Dario 921
--%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Model.conexion" %>
<%@include file="../template/admin/header_admin.jsp" %>

<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificación - Datos del Cliente</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Cliente</h3>
                    </div>
                    <div class="panel-body">
                        <form action="../Mantenimiento/crudeditar_cliente.jsp" method="POST">
                            <%
                                String id = request.getParameter("id");
                                int idUsuario = Integer.parseInt(id);
                                conexion cn = new conexion();

                                String sql = "SELECT * FROM personas WHERE per_id = ?";
                                PreparedStatement st = cn.getConexion().prepareStatement(sql);
                                st.setInt(1, idUsuario);
                                ResultSet rs = st.executeQuery();

                                while (rs.next()) {%>

                            <label>Codigo_Id: </label><input type="text" value="<%=rs.getInt("per_id")%>" class="form-control" name="id"/>            
                            <br>
                            <label>Nombres: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4("per_nombres"())%>" class="form-control" name="nom"/>
                            <br>
                            <label>Apellidos: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4("per_apellidos"())%>" class="form-control" name="ape"/>
                            <br>
                            <label>Cedula de Identidad: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4("per_cedula"())%>" class="form-control" name="cedu"/>
                            <br>
                            <label>Número de Contacto: </label> <input type="number" value="<%=rs.getString("per_telefono")%>" class="form-control" name="cont"/>
                            <br>
                            <label>Correo Electronico: </label><input type="email" value="<%= StringEscapeUtils.escapeHtml4("per_correo"())%>" class="form-control" name="corr"/>
                            <br>
                            <label>Usuario: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4("per_usuario"())%>" class="form-control" name="usu"/>
                            <br>
                            <label>Contraseña: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4("per_clave"())%>" class="form-control" name="pass"/>
                            <br>
                            <label>Estado: </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4("estados_esta_id"())%>" class="form-control" name="est"/>
                            <br>
                            <%}%>
                            <input type="submit" value="Editar" name="editar" class="btn-primary"/>
                        </form>                       
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<%@include file="template/footer_admin.jsp" %>