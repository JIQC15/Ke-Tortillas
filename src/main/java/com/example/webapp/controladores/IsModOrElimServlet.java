package com.example.webapp.controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({"/esModificar","/esEliminar"})
public class IsModOrElimServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean isModificar = req.getServletPath().endsWith("Modificar");
        if(isModificar){
            req.setAttribute("esModificar", isModificar);
            getServletContext().getRequestDispatcher("/login_modificar.jsp").forward(req, resp);
        }else{
            req.setAttribute("esModificar", isModificar);
            getServletContext().getRequestDispatcher("/login_modificar.jsp").forward(req, resp);
        }
    }

}
