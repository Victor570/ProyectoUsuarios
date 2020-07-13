<%-- 
    Document   : index
    Created on : 5/07/2020, 03:30:44 PM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio || usuarios registrados || Users Home</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <style>
            .indiceTabla{
                max-width: 10px;
            }
            .modal{
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <br>
            <br>

            <a type="button" class="btn btn-light" href="formularioUsuario.jsp">Agregar Usuario</a>

            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">nombre</th>
                        <th scope="col">edad</th>
                        <th scope="col">teléfono</th>
                        <th scope="col">password</th>
                        <th colspan="4" scope="col">opciones</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        UsuarioBD usuarioBD = new UsuarioBD();

                        ArrayList<Usuario> usuarios = usuarioBD.obtenerUsuarios();

                        if (!usuarios.isEmpty()) {
                            
                            for (Usuario usuario : usuarios) {
                    %>
                    <tr>
                        <td><%=usuario.getNombre()%></td>
                        <td><%=usuario.getEdad()%></td>
                        <td><%=usuario.getTelefono()%></td>
                        <td><%=usuario.getPassword()%></td>
                        <!--Password-->
                        <td>
                            <form action="formularioPassword.jsp" method="GET">
                                <input type="hidden" value="<%=usuario.getId()%>" name="id">
                                <button type="submit" class="btn btn-secondary btn-sm">
                                    Password
                                </button>
                            </form>
                        </td>
                        <!--Datos generales-->
                        <td>
                            <form action="formularioUsuario.jsp" method="POST">
                                <input type="hidden" value="<%=usuario.getId()%>" name="id">
                                <button type="submit" class="btn btn-secondary btn-sm">
                                    otros Datos
                                </button>
                            </form>
                        </td>
                        <!--Eliminacion con confirmacion-->
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModal<%=usuario.getId()%>">
                                Eliminar
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal<%=usuario.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Se eliminara a <br><%=usuario.getNombre()%>....</p>
                                        </div>
                                        <div class="modal-footer">
                                            <form action="eliminarUsuario.jsp" method="POST">
                                                <input type="hidden" value="<%=usuario.getId()%>" name="id">
                                                <button type="submit" class="btn btn-danger" name="validar" value="si">Eliminar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <!--Eliminacion espntanea-->
                        <td>
                            <form action="eliminarUsuario.jsp" method="POST">
                                <input type="hidden" value="<%=usuario.getId()%>" name="id">
                                <button type="submit" class="btn btn-danger btn-sm">
                                    Eliminar
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }

                        } else {
                            out.print("<tr><td>No hay registro de usuarios</td></tr>");
                        }
                    %>

                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>