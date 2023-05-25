package com.example.webapp.controladores;

import com.example.webapp.modelos.Usuario;
import com.example.webapp.repositorios.UsuarioRepositorioImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@WebServlet("/modificar-usuario")
public class ModificarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname1 = req.getParameter("surname1");
        String surname2 = req.getParameter("surname2");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Map<String, String> errores = new HashMap<>();

        if(name == null || name.isEmpty()){
            errores.put("name","El nombre es requerido");
        }
        if (password == null || password.isBlank()) {
            errores.put("password","el password no puede ser vacio.");
        }
        if(email == null || !email.contains("@")){
            errores.put("email","el email es requerido debe tener un formato de correo.");
        }
        if(surname1 == null || surname1.isBlank()){
            errores.put("surname1","El primer apellido es requerido.");
        }
        if(surname2 == null || surname2.isBlank()){
            errores.put("surname2","El segundo apellido es requerido.");
        }

        if(errores.isEmpty()) {
            boolean userModified = true;
            long hiddenId = Long.parseLong(req.getParameter("hiddenId"));
            long idUsuario = 1;

            UsuarioRepositorioImpl usuarioRepositorio = new UsuarioRepositorioImpl();

            List<Usuario> usuarios = usuarioRepositorio.listar();

            for(int i = 0; i < usuarios.size(); i++){
                if(usuarios.get(i).getId() == hiddenId){
                    idUsuario = usuarios.get(i).getId();
                }
            }

            Usuario usuario = new Usuario(name, email, surname1, surname2, password, idUsuario);

            usuarioRepositorio.guardar(usuario);

            req.setAttribute("userModified", userModified);
            getServletContext().getRequestDispatcher("/index.html").forward(req, resp);
        } else {
            boolean userModified = false;
            req.setAttribute("errores", errores);
            req.setAttribute("userModified", userModified);
            getServletContext().getRequestDispatcher("/registro.jsp").forward(req, resp);
        }
    }
}
