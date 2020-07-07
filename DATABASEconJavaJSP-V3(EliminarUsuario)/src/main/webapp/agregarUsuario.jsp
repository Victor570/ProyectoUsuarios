<%@ page import="com.voidkey.md5.Encode" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : agregarUsuario
    Created on : 14/06/2020, 05:59:26 PM
    Author     : ACER
--%>

<%
    Connection conexion = null;
    Statement st = null;

    Encode encode = new Encode();

    String mensaje = null;
    boolean insertado = false;

    String nombre = null, passwordString = null;

    nombre = request.getParameter("nombre");
    edadS = request.getParameter("edad");
    telefono = request.getParameter("telefono");
    correo = request.getParameter("correo");
    passwordString = request.getParameter("password");

    if (nombre != null && passwordString != null && edadS!=null && telefono!=null && correo!=null ) {
        
        String password = encode.encode(passwordString);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
            st = conexion.createStatement();
            st.executeUpdate("INSERT INTO usuario SET nombre='" + nombre + "', edad=" + edad + ", telefono='" + telefono + "', correo='" + correo + "', password='" + password + "' ");

            mensaje = "El usuario se ha insertado de forma correcta";
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
            
            <% if (insertado) {%>

            <div class="alert alert-success" role="alert">
                <%out.print(mensaje);%>
            </div>
            
            <%} else {%>
            
            <div class="alert alert-danger" role="alert">
                <%out.print(mensaje);%>
            </div>
            
            <%}%> 
             
        </div>
    </body>
</html>

