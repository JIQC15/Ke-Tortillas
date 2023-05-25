package com.example.webapp.controladores;

import com.example.webapp.modelos.Usuario;
import com.example.webapp.repositorios.UsuarioRepositorioImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/cargarInformacion")
public class CargarInformacionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        Usuario usuario = new Usuario();

        UsuarioRepositorioImpl usuarioRepositorio = new UsuarioRepositorioImpl();

        List<Usuario> usuarios = usuarioRepositorio.listar();

        for(int i = 0; i < usuarios.size(); i++){
            if(usuarios.get(i).getEmail().equals(email)){
                usuario.setNombre(usuarios.get(i).getNombre());
                usuario.setEmail(usuarios.get(i).getEmail());
                usuario.setPrimerApellido(usuarios.get(i).getPrimerApellido());
                usuario.setSegundoApellido(usuarios.get(i).getSegundoApellido());
                usuario.setContrasenia(usuarios.get(i).getContrasenia());
                usuario.setId(usuarios.get(i).getId());
            }
        }

        req.setAttribute("usuario", usuario);
        getServletContext().getRequestDispatcher("/modificar.jsp").forward(req, resp);
    }
}
