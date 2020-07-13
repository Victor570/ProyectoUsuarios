package DAO;

import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
//import script.MD5;

public class UsuarioBD {

    private final Conexion CONEXION = new Conexion();
    private final Connection conexion = CONEXION.getConexion();

    public ArrayList obtenerUsuarios() {

        Usuario usuario = null;

        ArrayList<Usuario> usuarios = new ArrayList<>();

        try {

            Statement st = this.conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM usuario");

            while (rs.next()) {
                usuario = new Usuario(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5));
                usuarios.add(usuario);
            }

        } catch (SQLException e) {
            System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
        }

        return usuarios;

    }

    public Usuario obtenerUsuarioPorId(int idUsuario) {

        Usuario usuario = null;

        try {

            Statement st = this.conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM usuario where id=" + idUsuario + "");

            if (rs.next()) {
                usuario = new Usuario(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5));
            }

        } catch (SQLException e) {
            System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
        }

        return usuario;

    }
    
    
    public Usuario usuarioValido(int idUsuario, String password) {

        Usuario usuario = null;

        try {

            Statement st = this.conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM usuario where id=" + idUsuario + " AND password=MD5('"+password+"')");

            if (rs.next()) {
                usuario = new Usuario(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5));
            }

        } catch (SQLException e) {
            System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
        }

        return usuario;

    }

    public boolean eliminarUsuarioPorId(int idUsuario) {
        boolean eliminado = false;

        try {

            Statement st = this.conexion.createStatement();

            int res = st.executeUpdate("DELETE FROM usuario WHERE id = " + idUsuario + "");

            if (res > 0) {
                eliminado = true;
            }

        } catch (SQLException e) {
            System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
        }

        return eliminado;
    }

    public boolean insertarUsuario(Usuario usuario) {

        boolean insertado = false;

        try {

            Statement st = this.conexion.createStatement();

            String n = usuario.getNombre();
            int e = usuario.getEdad();
            String t = usuario.getTelefono();
            String p = usuario.getPassword();

            int res = st.executeUpdate("INSERT INTO usuario SET nombre = '" + n + "', edad=" + e + ", telefono='" + t + "', password=MD5('" + p + "')");

            if (res > 0) {
                insertado = true;
            }

        } catch (SQLException e) {
            System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
        }

        return insertado;

    }

    public boolean actualizarUsuarioPorId(Usuario newUser, int id) {
        boolean actualizado = false;

        try {
            Statement st = this.conexion.createStatement();

            String n = newUser.getNombre();
            int e = newUser.getEdad();
            String t = newUser.getTelefono();
            String p = newUser.getPassword();

            int res = st.executeUpdate("UPDATE usuario SET nombre = '" + n + "', edad=" + e + ", telefono='" + t + "' WHERE id = " + id + "");

            if (res > 0) {
                actualizado = true;
            }
        } catch (SQLException e) {
            System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
        }

        return actualizado;

    }

    public boolean actualizarPasswordUsuario(String newPass, int id) {
        boolean actualizado = true;

        if (this.conexion != null) {

            try {
                Statement st = this.conexion.createStatement();

                int res = st.executeUpdate("UPDATE usuario SET password=md5('" + newPass + "') WHERE id = " + id + "");

                if (res > 0) {
                    actualizado = true;
                }
            } catch (SQLException e) {
                System.out.println("SQLERROR: ha ocurrido un error en la recolecion de datos.");
            }
        }

        return actualizado;

    }

}
