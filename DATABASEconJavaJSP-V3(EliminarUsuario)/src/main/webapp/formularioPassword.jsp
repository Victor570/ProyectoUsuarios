<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : formularioPassword
    Created on : 19/06/2020, 07:02:57 PM
    Author     : ACER
--%>

<%
    String idS = request.getParameter("id");

    int idI = 0;

    if (idS != null && idS != "") {
        idI = Integer.parseInt(idS);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Password || Formulario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>

        <div class="container" style="text-align: center;padding-top: 30px;">
            <div class="row">
                
                    <p>Ingresa los datos que se solicitan</p>
                    <form action="actualizarPassword.jsp" method="GET">

                        
                            <label for="aPassword">Antiguo password</label>
                            <input type="password" id="aPassword" name="aPassword" required>
                        

                        
                            <label for="password1">Password</label>
                            <input type="password" id="password1" name="password1" required>
                        

                        
                            <label for="password2">Repita el password</label>
                            <input type="password" id="password2" name="password2" required>
                        

                        <input type="hidden" value="<%=idI%>" name="id">

                        <button type="submit" class="btn" name="enviar">Enviar datos</button>
                    </form>
                
            </div>

        </div>
    </body>
</html>
