package com.example.webapp.controladores;

import com.example.webapp.modelos.Usuario;
import com.example.webapp.repositorios.UsuarioRepositorioImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet({"/login","/login-modificar", "/login-eliminar"})
public class loginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Boolean usuarioEcontrado = false;
        boolean isModificar = req.getServletPath().endsWith("modificar");
        boolean isEliminar = req.getServletPath().endsWith("eliminar");

        UsuarioRepositorioImpl usuarioRepositorio = new UsuarioRepositorioImpl();

        List<Usuario> usuarios = usuarioRepositorio.listar();

        for(int i = 0; i < usuarios.size(); i++){
            if(usuarios.get(i).getEmail().equals(email) && usuarios.get(i).getContrasenia().equals(password)){
                usuarioEcontrado = true;
            }
        }

        if (usuarioEcontrado) {
            if(isModificar){
                req.setAttribute("email", email);
                getServletContext().getRequestDispatcher("/cargarInformacion").forward(req, resp);
            } else if (isEliminar) {
                req.setAttribute("email", email);
                getServletContext().getRequestDispatcher("/eliminar-usuario").forward(req, resp);
            } else{
                req.setAttribute("usuarioEncontrado", usuarioEcontrado);
                getServletContext().getRequestDispatcher("/index.html").forward(req, resp);
            }
        } else {
            Map<String, String> errores = new HashMap<>();
            errores.put("usuarioInvalido", "Email o password incorrectos, intentelo de nuevo.");
            req.setAttribute("errores", errores);
            if(isModificar || isEliminar){
                getServletContext().getRequestDispatcher("/login_modificar").forward(req, resp);
            }else{
                getServletContext().getRequestDispatcher("/registro.jsp").forward(req, resp);
            }
        }
    }
}
