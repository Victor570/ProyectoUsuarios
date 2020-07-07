<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : formulario
    Created on : 14/06/2020, 05:14:16 PM
    Author     : ACER
--%>

<%
    String idS = request.getParameter("id");
    String titulo = "Formulario de registro";
    String form = "agregarUsuario.jsp";

    int idI = 0;
    String nombre = "";
    boolean editar = false;

    if (idS != null && idS != "") {
        Connection conexion = null;
        Statement st = null;
        ResultSet rs = null;

        titulo = "Actualiza tus datos";
        form = "actualizarUsuario.jsp";
        editar = true;

        idI = Integer.parseInt(idS);
        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
            st = conexion.createStatement();
            rs = st.executeQuery("SELECT nombre FROM usuario WHERE id=" + idI + "");

            if (rs.next()) {
                nombre = rs.getString(1);
            }

        } catch (SQLException e) {
            out.print("ERROR(" + e.getErrorCode() + "): " + e.getMessage());
        } catch (Exception e) {
            out.print("ERROR: " + e.getMessage());
        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=titulo%> || Formulario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>

        <div class="container" style="text-align: center;padding-top: 30px;">
            <div class="row">
                <div class="col-md-3">

                </div>
                <div class="col-md-6" style="background-color: rgba(0, 0, 0,.1); padding: 30px; border-radius: 10px;">
                    <h1><%=titulo%></h1>
                    <p>Ingresa los datos de usuario</p>
                    <form action="<%=form%>" method="POST">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input value="<%=nombre%>" type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>

                        <% if (!editar) { %>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <%} else {%>
                        <input type="hidden" value="<%=idI%>" name="id">
                        <%}%>
                        <button type="submit" class="btn btn-primary" name="enviar">Enviar datos</button>
                    </form>
                </div>
            </div>

        </div>
    </body>
</html>




