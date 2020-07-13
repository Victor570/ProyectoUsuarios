package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private static final String HOST = "Localhost";
    private static final String DB = "usuariosvictor?serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    

    public Connection getConexion() {

        Connection conexion = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://" + HOST + "/" + DB + "", USER, PASSWORD);
            System.out.println("La conexion de ha realizado correctamente..");
        } catch (SQLException e) {
            System.out.println("SQLERROR: ha ocurrido un error al establecer la conexion");
        } catch (ClassNotFoundException e) {
            System.out.println("ERROR: ha ocurrido un error con el driver de conexion --> " + e);
        }

        return conexion;

    }

}