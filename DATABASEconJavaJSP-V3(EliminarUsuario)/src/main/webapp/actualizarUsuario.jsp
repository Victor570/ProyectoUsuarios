<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : actualizarUsuario
    Created on : 19/06/2020, 06:15:04 PM
    Author     : ACER
--%>


<%

    String mensaje = null;
    boolean insertado = false;

    String idS = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String edadS = request.getParameter("edad");
    String telefono = request.getParameter("telefono");
    String correo = request.getParameter("correo");

    if (nombre != null && idS != null && edadS!=null && telefono!=null && correo!=null) {

        Connection conexion = null;
        Statement st = null;

        int idI = Integer.parseInt(idS);
        int edad = Integer.parseInt(edadS);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
            st = conexion.createStatement();
            st.executeUpdate("UPDATE usuario SET nombre = '" + nombre + "', edad=" + edad + ", telefono='" + telefono + "', correo='" + correo + "' WHERE id=" + idI + "");

            mensaje = "El usuario [" + nombre + "] se ha actualizado de forma correcta";
            insertado = true;

        } catch (SQLException e) {

            mensaje = "ERROR(" + e.getErrorCode() + "): " + e.getMessage();

        } catch (Exception e) {
            mensaje = "ERROR: " + e.getMessage();
        }

    } else {
        mensaje = "Ha ocurrido un error al ingresar a la página.";
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="container" style="text-align: center; padding-top: 30px;">

            <div class="row">
                
                <% if (insertado) {%>

                <div class="alert alert-success" role="alert">
                    <%out.print(mensaje);%>
                </div>

                <a href="index.jsp" type="button" class="btn btn-success">Ver registros</a>

                <%} else {%>

                <div class="alert alert-danger" role="alert">
                    <%out.print(mensaje);%>
                </div>

                <%}%> 
            </div>
            
        </div>
    </body>
</html>
