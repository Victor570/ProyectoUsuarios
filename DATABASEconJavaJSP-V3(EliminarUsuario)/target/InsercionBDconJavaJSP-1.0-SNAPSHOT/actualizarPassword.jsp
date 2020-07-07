<%@ page import="com.voidkey.md5.Encode" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : actualizarPassword
    Created on : 19/06/2020, 07:15:38 PM
    Author     : ACER
--%>

<%

    String mensaje = null;
    boolean actualizado = false;

    String idS = request.getParameter("id");;
    String ap = request.getParameter("aPassword");
    String p1 = request.getParameter("password1");
    String p2 = request.getParameter("password2");

    if (idS != null && idS != null && ap != null && p1 != null && p2 != null && ap != "" && p1 != "" && p2 != "") {

        Connection conexion = null;
        Statement st = null;
        ResultSet rs = null;

        int id = Integer.parseInt(idS);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
            st = conexion.createStatement();
            rs = st.executeQuery("SELECT nombre, password FROM usuario WHERE id=" + id + "");

            if (rs.next()) {

                Encode encode = new Encode();

                String pdb = rs.getString(2);

                if (encode.encode(ap).equals(pdb)) {

                    if (p1.equals(p2)) {

                        st.executeUpdate("UPDATE usuario SET password = '" + encode.encode(p1) + "' WHERE id=" + id + "");

                        mensaje = "Se ha actualizado la contraseña correctamente";
                        actualizado = true;

                    } else {
                        mensaje = "Lo sentimos, has cometido un error al repetir el password";
                    }

                } else {
                    mensaje = "Lo sentimos, no has ingresado correctamente el antiguo password";
                }

            } else {
                mensaje = "Se ha perdido, o no existe el usuario";
            }

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
                    <% if (actualizado) {%>

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
