<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : eliminarUsuario
    Created on : 19/06/2020, 10:04:24 PM
    Author     : ACER
--%>

<%

    String mensaje = null;
    boolean eliminado = false;

    String idS = request.getParameter("id");

    if (idS != null && idS != "") {

        Connection conexion = null;
        Statement st = null;

        int idI = Integer.parseInt(idS);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
            st = conexion.createStatement();
            st.executeUpdate("DELETE FROM usuario WHERE id=" + idI + "");

            mensaje = "El usuario se ha eliminado de forma permanente";
            eliminado = true;
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

            <h1>Resultados</h1>
            <p>EL resultado del proceso de insertar un usuario se muestra a continuación</p>

            <div class="row">

                <div class="col-md-3">

                </div>
                <div class="col-md-6" style="text-align: center">
                    <% if (eliminado) {%>

                    <div class="alert alert-success" role="alert">
                        <%out.print(mensaje);%>
                    </div>

                    <a href="index.jsp" type="button" class="btn btn-success">Ver registros</a>

                    <%} else {%>

                    <div class="alert alert-danger" role="alert">
                        <%out.print(mensaje);%>
                    </div>

                    <a href="index.jsp" type="button" class="btn btn-primary">Volver a inicio</a>
                    <%}%> 
                </div>
            </div>
        </div>
    </body>
</html>
