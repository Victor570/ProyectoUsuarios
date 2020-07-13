<%-- 
    Document   : actualizarUsuario
    Created on : 3/07/2020, 09:41:54 AM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*"%>

<%

    String mensaje = null;
    boolean actualizado = false;

    String nombre = request.getParameter("nombre");
    String edad = request.getParameter("edad");
    String telefono = request.getParameter("telefono");
    String correo = request.getParameter("email");
    String id = request.getParameter("id");

    UsuarioBD usuarioBD = new UsuarioBD();

    Usuario usuario = usuarioBD.obtenerUsuarioPorId(Integer.parseInt(id));

    Usuario newUser = new Usuario(nombre, Integer.parseInt(edad), telefono, correo);

    if (usuarioBD.actualizarUsuarioPorId(newUser, usuario.getId())) {
        mensaje = "El usuario [" + usuario.getNombre() + "] se ha actualizado de forma correcta";
        actualizado = true;
    } else {
        mensaje = "Ha ocurrido un error al relizar la actualizacion";
    }


%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar usuario || Editar usuario || Formulario de actualización</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="container" style="text-align: center; padding-top: 30px;">
            <h1>Resultados</h1>
            <p>EL resultado del proceso de actualizar usuario se muestra a continuación</p>
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6" style="text-align: center">
                    <% if (actualizado) { %>
                    <div class="alert alert-success" role="alert">
                        <%out.print(mensaje);%>
                    </div>
                    <a href="index.jsp" type="button" class="btn btn-success">Ver registros</a>
                    <% } else { %>
                    <div class="alert alert-danger" role="alert">
                        <%out.print(mensaje);%>
                    </div>
                    <br>
                    <a href="index.jsp" type="button" class="btn btn-primary">Volver a inicio</a>
                    <%
                        }
                    %>
                    
                </div>
            </div>
        </div>

    </body>
</html>



