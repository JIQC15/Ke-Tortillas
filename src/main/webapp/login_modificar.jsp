<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.Map"%>
<%
    Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");
    Boolean esModificar = (Boolean) request.getAttribute("esModificar");
%>
<!doctype html>
<html lang="en">
<head>
    <title>Registro</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="180x180" href="IMG/Trigo-removebg-preview.png">
    <link rel="icon" type="image/png" sizes="32x32" href="IMG/Trigo-removebg-preview.png">
    <link rel="icon" type="image/png" sizes="16x16" href="IMG/Trigo-removebg-preview.png">
    <link rel="manifest" href="IMG/Trigo-removebg-preview.png">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="maquetado_Inicio.css">

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

<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <!--<h6 class="mb-0 pb-3"><span>Iniciar Sesión </span><span>Registro</span></h6>
                    <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>-->
                    <label for="reg-log"></label>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3">Para continuar, inicie sesion</h4>
                                        <form action="${pageContext.request.contextPath}/<%if(esModificar) out.print("login-modificar"); else out.print("login-eliminar");;%>" method="post">
                                            <div class="form-group">
                                                <input type="email" class="form-style" name="email" placeholder="Correo Electrónico" value="${param.email}">
                                                <i class="input-icon uil uil-at"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="password" class="form-style" name="password" placeholder="Contraseña">
                                                <i class="input-icon uil uil-lock-alt"></i>
                                            </div>
                                            <%
                                                if(errores != null && errores.containsKey("usuarioInvalido")){
                                                    out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("usuarioInvalido") + "<br></small>");
                                                }
                                            %>
                                            <input type="submit" class="btn mt-4" value="Iniciar sesion">
                                        </form>
                                    </div>
                                </div>
                            </div>
