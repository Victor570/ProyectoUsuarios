<%-- 
    Document   : formularioPassword
    Created on : 3/07/2020, 03:25:00 PM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%

    String id = request.getParameter("id");


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Actualizar password usuario || Formulario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">

            <div class="row">  

                <div class="col-md-6">
                    <br>
                    <br>
                    <br>

                    <form action="actualizarPassword.jsp" method="GET">
                        <label for="antiguo">Antiguo password</label>
                        <input type="password" class="form-control" id="antiguo" name="antiguo" required>

                        <label for="nuevo1">Nuevo password</label>
                        <input type="password" class="form-control" id="nuevo1" name="nuevo1" required>

                        <label for="nuevo2">Repita password</label>
                        <input type="password" class="form-control" id="nuevo2" name="nuevo2" required>

                        <input type="hidden" value="<%=id%>" name="id">                        
                        
                        <br>
                        
                        <button type="submit" class="btn btn-light">Enviar datos</button>
                    </form>

                    
                </div>
            </div>
        </div>
    </body>
</html>
