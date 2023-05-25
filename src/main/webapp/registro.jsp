<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
    Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");
    Boolean isInserted = (Boolean)request.getAttribute("isInserted");
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
                    <h6 class="mb-0 pb-3"><span>Iniciar Sesión </span><span>Registro</span></h6>
                    <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                    <label for="reg-log"></label>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3">Iniciar Sesión</h4>
                                        <form action="${pageContext.request.contextPath}/login" method="post">
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
                            <div class="card-back">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-3 pb-3">Registro</h4>
                                        <form action="${pageContext.request.contextPath}/registro-usuarios" method="post">
                                            <div class="form-group">
                                                <input type="text" name="name" class="form-style" placeholder="Nombre" value="${param.name}">
                                                <i class="input-icon uil uil-user"></i>
                                                <%
                                                    if(errores != null && errores.containsKey("name")){
                                                        out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("name") + "</small>");
                                                    }
                                                %>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="text" name="surname1" class="form-style" placeholder="Apellido Paterno" value="${param.surname1}">
                                                <i class="input-icon uil uil-user"></i>
                                                <%
                                                    if(errores != null && errores.containsKey("surname1")){
                                                        out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("surname1") + "<br></small>");
                                                    }
                                                %>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="text" name="surname2" class="form-style" placeholder="Apellido Materno" value="${param.surname2}">
                                                <i class="input-icon uil uil-user"></i>
                                                <%
                                                    if(errores != null && errores.containsKey("surname2")){
                                                        out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("surname2") + "<br></small>");
                                                    }
                                                %>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="email" name="email" class="form-style" placeholder="Email" value="${param.email}">
                                                <i class="input-icon uil uil-at"></i>
                                                <%
                                                    if(errores != null && errores.containsKey("email")){
                                                        out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("email") + "<br></small>");
                                                    }
                                                %>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="password" name="password" class="form-style" placeholder="Contraseña">
                                                <i class="input-icon uil uil-lock-alt"></i>
                                                <%
                                                    if(errores != null && errores.containsKey("name")){
                                                        out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("password") + "<br></small>");
                                                    }
                                                %>
                                            </div>
                                            <input type="submit" class="btn mt-4" value="Registrarse">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<p style="text-align:center" >Si desea <a href="${pageContext.request.contextPath}/esModificar">modificar</a> o <a href="${pageContext.request.contextPath}/esEliminar">eliminar</a> su cuenta selecione la opción aquí</p>
</body>
</html>
