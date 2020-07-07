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
    passwordString = request.getParameter("password");

    if (nombre != null && passwordString != null && nombre!="" && passwordString!="") {
        
        String password = encode.encode(passwordString);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
            st = conexion.createStatement();
            st.executeUpdate("INSERT INTO usuario SET nombre='" + nombre + "', password='" + password + " ' ");

            mensaje = "El usuario se ha insertado de forma correcta";
            insertado = true;

        } catch (SQLException e) {
            int[] arrErrCodigo = new int[]{0, 1044, 1045, 1146, 1049, 1064};
            String[] arrErrMensaje = new String[]{"No hay conexion a servidor de base de datos, no se encontro un controlador para el mismo.", "Acceso denegado para el usuario a logear a mysql.", "Los datos del usuario en la conexion son incorrectos", "El nombre de la tabla no existe en la base de datos", "No se encuentra la base de datos elegida en el intento de conexion.", "Hay un error de sintaxis en la cosulta."};
            String[] arrErrAyuda = new String[]{"Verfica el tipo de conexion y direccion del sevidor.", "Verifica que el password sea el correcto.", "Verfifica que ingresas correctamente el nombre de usuario.", "Verifica que los nombres de la tablas en las consultas estén correctamente escritos.", "Verifica que el nombre de la base de datos correspoda a la que deseas.", "Verifica la sintaxis y claúsulas de la consulta."};
            boolean noHallado = true;
            int iterador = 0;

            while (noHallado && iterador <= 5) {
                if (e.getErrorCode() == arrErrCodigo[iterador]) {
                    mensaje = "Codigo de error SQL(" + arrErrCodigo[iterador] + ")<br> Mensaje de error: " + arrErrMensaje[iterador] + "<br> Mesaje de ayuda: " + arrErrAyuda[iterador] + "<br>";
                    noHallado = false;
                }
                iterador++;
            }

            if (noHallado) {
                mensaje = "ERROR(" + e.getErrorCode() + "): " + e.getMessage();
            }
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

            <h1>Resultados</h1>
            <p>EL resultado del proceso de insertar un usuario se muestra a continuación</p>

            <div class="row">

                <div class="col-md-3">
                    
                </div>
                <div class="col-md-6" style="text-align: center">
                    <% if (insertado) {%>

                    <div class="alert alert-success" role="alert">
                        <%out.print(mensaje);%>
                    </div>

                    <a href="formulario.jsp" type="button" class="btn btn-primary">Insertar Usuario</a>
                    <a href="index.jsp" type="button" class="btn btn-success">Ver registros</a>
                    
                    <%} else {%>
                    
                    <div class="alert alert-danger" role="alert">
                        <%out.print(mensaje);%>
                    </div>
                    
                    <a href="index.jsp" type="button" class="btn btn-primary">Volver a inicio</a>
                    <a href="formulario.jsp" type="button" class="btn btn-success">Volver a formulario</a>
                    <%}%> 
                </div>
            </div>
        </div>
    </body>
</html>

