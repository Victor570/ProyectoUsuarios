<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : index
    Created on : 14/06/2020, 04:04:51 PM
    Author     : Jose Enrique Zempoaltecatl Moyotl
--%>

<%
    Connection conexion = null;
    Statement st = null;
    ResultSet rs = null;

    int i = 1;

    try {

        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios?serverTimezone=UTC", "root", "");
        st = conexion.createStatement();
        rs = st.executeQuery("SELECT * FROM usuario");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de usuarios || Inicio Usuarios</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>

        <div class="container" style="text-align: center; padding-top: 30px;">
            <h1>Usuarios registrados</h1>
            <p>En la siguiente tabla se muestran los registros de la tabla usuario en usuarios</p>

            <a href="formulario.jsp" type="button" class="btn">Insertar usuario</a>    

            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">nombre</th>
                        <th scope="col">passsword</th>
                        <th scope="col" colspan="3">Opciones</th>
                    </tr> 
                </thead>
                <tbody>
                    <%while (rs.next()) {%>

                    <tr>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td>
                            <a href="formularioPassword.jsp?id=<%=rs.getString(1)%>">Editar password</a>
                        </td>
                        <td style="max-width: 1.2em;">
                            <a href="formulario.jsp?id=<%=rs.getString(1)%>">Editar Usuario</a>
                        </td>
                        <td>
                            <a data-toggle="modal" data-target="#exampleModal<%=rs.getString(1)%>">
                                Eliminar Usuario
                            </a>
                            <!-- Modal -->
                            <div title="" class="modal fade" id="exampleModal<%=rs.getString(1)%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Eliminar Usuario</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>¿Seguro que deseas eliminar de forma permanente a <br>[<%=rs.getString(2)%>]?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                            <form action="eliminarUsuario.jsp" method="GET">
                                                <input type="hidden" value="<%=rs.getString(1)%>" name="id">
                                                <button type="submit" class="btn btn-danger" name="enviar">Eliminar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <%}%>
                </tbody>
            </table>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </div>
    </body>
</html>

<%
    } catch (SQLException e) {

        out.print("ERROR(" + e.getErrorCode() + "): " + e.getMessage());

    } catch (Exception e) {
        out.print("ERROR: " + e.getMessage());
    }


%>