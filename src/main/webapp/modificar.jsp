<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@ page import="com.example.webapp.modelos.Usuario" %>
<%
    Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");
    Usuario usuario = (Usuario)request.getAttribute("usuario");
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Modificar Datos</title>
    <link rel="apple-touch-icon" sizes="180x180" href="IMG/Trigo-removebg-preview.png">
    <link rel="icon" type="image/png" sizes="32x32" href="IMG/Trigo-removebg-preview.png">
    <link rel="icon" type="image/png" sizes="16x16" href="IMG/Trigo-removebg-preview.png">
    <link rel="manifest" href="IMG/Trigo-removebg-preview.png">
    <link rel="stylesheet" href="maquetado_Inicio.css">
    <link href="stylesContact.css" rel="stylesheet" type="text/css" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<header class="header">
    <div class="menu container">

        <img src="IMG\Trigo-removebg-preview.png" alt="Logo" class= "logo" width="50" height="60" class="d-inline-block align-text">
        <a href="index.html" class="logo">Ke Tortillas</a>
        <input type="checkbox" id="menu" />
        <label for="menu">
            <img src="IMG/Menu.png" class="menu-icono" alt="">
        </label>
        <nav class="navbar">
            <ul>
                <li><a href="index.html">INICIO</a></li>
                <li><a href="Pagina_Productos.html">PRODUCTOS</a></li>
                <li><a href="#">SERVICIOS</a></li>
                <li><a href="contactanos.html">CONTACTANOS</a></li>
                <li><a href="registro.html">REGISTRO</a></li>
            </ul>
        </nav>
    </div>
    <div class="header-content container">

        <h1>Ke Tortillas</h1>

        <p>
            Las tortillas de harina estilo Sonorense son una opción deliciosa y nutritiva para incluir en tu dieta
            diaria. Originarias del estado de Sonora en México, estas tortillas son muy diferentes a las
            tradicionales tortillas de maíz que se consumen en otras partes del país.
            Las tortillas de harina estilo Sonorense son más suaves y elásticas que las de maíz, lo que las hace
            ideales para enrollar y hacer burritos, quesadillas y otros platillos.
        </p>
        <br><br><a href="#" class="btn-1">Información</a>
    </div>
</header>
<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>

<div id="contactForm">
    <h1 style="margin-bottom: 10px;">Modificar Cuenta</h1>
    <form action="${pageContext.request.contextPath}/modificar-usuario" method="post">
        <input value="<%out.print(usuario.getNombre());%>" name="name" type="text"/>
        <%
            if(errores != null && errores.containsKey("name")){
                out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("name") + "</small>");
            }
        %>
        <input value="<%out.print(usuario.getPrimerApellido());%>" name="surname1" type="text"/>
        <%
            if(errores != null && errores.containsKey("surname1")){
                out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("surname1") + "<br></small>");
            }
        %>
        <input value="<%out.print(usuario.getSegundoApellido());%>" name="surname2" type="text"/>
        <%
            if(errores != null && errores.containsKey("surname2")){
                out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("surname2") + "<br></small>");
            }
        %>
        <input value="<%out.print(usuario.getEmail());%>" name="email" type="email" required />
        <%
            if(errores != null && errores.containsKey("email")){
                out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("email") + "<br></small>");
            }
        %>
        <input value="<%out.print(usuario.getContrasenia());%>" name="password" type="password" required />
        <%
            if(errores != null && errores.containsKey("name")){
                out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("password") + "<br></small>");
            }
        %>
        <input type="hidden" name="hiddenId" value="<%out.print(usuario.getId());%>">
        <input class="formBtn" type="submit" value="Modificar">
    </form>
</div>

</body>
</html>