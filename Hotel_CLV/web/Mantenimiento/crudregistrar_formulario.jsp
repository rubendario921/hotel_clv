<%-- 
    Document   : crudregistrar_formulario
    Created on : 27-jul-2023, 18:05:43
    Author     : Ruben Dario 921
--%>

<%@page import="java.sql.*"%>
<%@page import="Model.conexion" %>
<%
    try {
        conexion con = new conexion();
        if (request.getParameter("nuevo_formulario") != null) {
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String telefono = request.getParameter("telefono");
            String asunto = request.getParameter("asunto");
            String mensaje = request.getParameter("mensaje");
            String cuidad = request.getParameter("cuidad");
            String opciones = request.getParameter("estado");
            //int rol = Integer.parseInt(request.getParameter("rol"));

            String sql = "INSERT INTO formulario  (formu_nombres,formu_correo,formu_telefono,formu_asunto,formu_mensaje,formu_cuidad,formu_opciones)values(?,?,?,?,?,?,?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, nombre);
            pst.setString(2, correo);
            pst.setString(3, telefono);
            pst.setString(4, asunto);
            pst.setString(5, mensaje);
            pst.setString(6, cuidad);
            pst.setString(7, opciones);
            int n = pst.executeUpdate();
            if (n > 0) {
                out.print("<script>alert('Registro Guardado')</script>");
                out.print("<script>window.location.href='../contactenos.jsp'</script>");
            } else {
                out.print("<script>alert('Registro NO Guardado')</script>");
                out.print("<script>window.location.href='../contactenos.jsp'</script>");
            }
        }

    } catch (SQLException e) {
        if (e.getErrorCode() == 1062) {
            out.print("<script>alert('El registro  ya existe en la base de datos, intente nuevamente');</script>");// 1062 es el código de error para valor duplicado en MySQL
            out.print("<script>window.location.href='../contactenos.jsp'</script>");
        } else if (e.getErrorCode() == 1048) {
            out.print("<script>alert('Los campos no puede estar vacios,, intente nuevamente');</script>");// 1048 es el código de error para valor duplicado en MySQL
            out.print("<script>window.location.href='../contactenos.jsp'</script>");
        } else {
        }
        // Si la excepción es por otro motivo, muestra un mensaje de error genérico
        out.print("<script>alert('Error al insertar el registro');</script>");
    }
%>