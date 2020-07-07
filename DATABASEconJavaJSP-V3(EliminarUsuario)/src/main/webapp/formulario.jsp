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
    String edad = "";
    String telefono = "";
    String correo = "";
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
            rs = st.executeQuery("SELECT nombre,edad,telefono,correo FROM usuario WHERE id=" + idI + "");

            if (rs.next()) {
                nombre = rs.getString(1);
                edad = rs.getInt(2);
                telefono = rs.getString(3);
                correo = rs.getString(4);
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
                
                <h1><%=titulo%></h1>
                
                <form action="<%=form%>" method="POST">
                    
                        <label for="nombre">Nombre</label>
                        <input value="<%=nombre%>" type="text" id="nombre" name="nombre" required>
                    
                    	<label for="edad">Edad</label>
                        <input value="<%=edad%>" type="number" id="edad" name="edad" required>

                        <label for="telefono">Telefono</label>
                        <input value="<%=telefono%>" type="text" id="telefono" name="telefono" required>

                        <label for="correo">Correo</label>
                        <input value="<%=correo%>" type="text" id="correo" name="correo" required>

                    <% if (!editar) { %>
                    
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    
                    <%} else {%>
                    <input type="hidden" value="<%=idI%>" name="id">
                    <%}%>
                    <button type="submit" class="btn" name="enviar">Enviar datos</button>
                </form>
                
            </div>

        </div>
    </body>
</html>




