package com.example.webapp.repositorios;



import com.example.webapp.modelos.Usuario;
import com.example.webapp.util.conexionBaseDatos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioRepositorioImpl implements Repositorio<Usuario> {
    private Connection getConnection() throws SQLException {
        return conexionBaseDatos.getInstance();
    }

    @Override
    public List<Usuario> listar() {
        List<Usuario> usuarios = new ArrayList<>();
        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios")) {
            while(rs.next()){
                Usuario usuario = crearUsuario(rs);
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuarios;
    }

    @Override
    public Usuario porId(Long id) {
        Usuario usuario = null;
        try(Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT FROM usuarios WHERE id = ?")) {
            ps.setLong(1,id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuario = crearUsuario(rs);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }

    @Override
    public void guardar(Usuario usuario) {
        String sql;
        if (usuario.getId() != null && usuario.getId() > 0) {
            sql = "UPDATE usuarios SET nombre = ?, email = ?, contrasenia = ?, primer_apellido = ?, segundo_apellido = ? WHERE idUsuario = ?";
        } else {
            sql = "INSERT INTO usuarios(nombre, email, contrasenia, primer_apellido, segundo_apellido) VALUES (?,?,?,?,?)";
        }
        try(Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getContrasenia());
            stmt.setString(4, usuario.getPrimerApellido());
            stmt.setString(5, usuario.getSegundoApellido());

            if (usuario.getId() != null && usuario.getId() > 0) {
                stmt.setLong(6, usuario.getId());
            }else{}

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void eliminar(Long id) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM usuarios WHERE idUsuario = ?")){
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Usuario crearUsuario(ResultSet rs) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setNombre(rs.getString("nombre"));
        usuario.setEmail(rs.getString("email"));
        usuario.setPrimerApellido(rs.getString("primer_apellido"));
        usuario.setSegundoApellido(rs.getString("segundo_apellido"));
        usuario.setContrasenia(rs.getString("contrasenia"));
        usuario.setId(rs.getLong("idUsuario"));
        return usuario;
    }
}
