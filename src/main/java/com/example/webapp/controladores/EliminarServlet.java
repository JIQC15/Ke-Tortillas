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

@WebServlet("/eliminar-usuario")
public class EliminarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        Long idUsuario = null;

        UsuarioRepositorioImpl usuarioRepositorio = new UsuarioRepositorioImpl();

        List<Usuario> usuarios = usuarioRepositorio.listar();

        for(int i = 0; i < usuarios.size(); i++){
            if(usuarios.get(i).getEmail().equals(email)){
                idUsuario = usuarios.get(i).getId();
                usuarioRepositorio.eliminar(idUsuario);
            }
        }

        getServletContext().getRequestDispatcher("/index.html").forward(req, resp);
    }
}
