<%-- 
    Document   : dashboard
    Created on : 19 dic. 2023, 23:51:56
    Author     : WINDOWS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <!--Icons Bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <style>
            /* Estilos adicionales para el botón "Cerrar sesión" */
            .fixed-bottom-50 {
                position: fixed;
                right: 50px;
                bottom: 50px;
                z-index: 1000; /* Ajusta si es necesario */
            }
            
            @media (min-width: 768px) {
                .fixed-bottom-50 {
                    left: unset;
                    bottom: 50px;
                    right: 50px;
                }
            }
        </style>
        
        <script type="text/javascript">
                function mostrarHora() {
                    var fecha = new Date();
                    var hora = fecha.getHours();
                    var minutos = fecha.getMinutes();
                    var segundos = fecha.getSeconds();

                    // Agrega un cero delante si la hora, minutos o segundos son menores que 10
                    hora = hora < 10 ? "0" + hora : hora;
                    minutos = minutos < 10 ? "0" + minutos : minutos;
                    segundos = segundos < 10 ? "0" + segundos : segundos;

                    var horaActual = hora + ":" + minutos + ":" + segundos;
                    document.getElementById("horaActual").innerText = "Hora actual: " + horaActual;

                    // Actualiza la hora cada segundo (1000 milisegundos)
                    setTimeout(mostrarHora, 1000);
                }

                // Llama a la función al cargar la página para iniciar la visualización de la hora
                window.onload = function() {
                    mostrarHora();
                };
         </script>
        
        <title>:Principal:</title>
    </head>
    <body>
<div class="container mt-5">
        <div class="row">
            <div class="col-12 text-center">
                <img src="../img/ba.png" alt="logo codo a codo" height="80" class="d-none d-md-block">
                <h2 class="mt-3">Gestión de Oradores</h2>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-3">
                <nav class="nav flex-column">
                    <button class="nav-link active btn btn-lg btn-light" type="button">Principal</button>
                    <button class="nav-link btn btn-lg btn-light" type="button" onclick="window.location.href='gestionOradores.jsp'">Gestión de Oradores</button>
                   
                </nav>
            </div>
            <div class="col-md-9">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4">
                    <h3 class="mb-0 text-center text-md-start">
                        <% 
                            String username = (String) session.getAttribute("usuario");
                            if (username != null) {
                        %>
                            Bienvenido, <%= username %> al sistema
                        <%
                            }
                        %>
                    </h3>
                    <div id="horaActual" class="text-center text-md-end mt-3 mt-md-0"></div>
                    
                </div>
                
                <!-- Botón "Cerrar sesión" en la parte inferior izquierda responsive-->
                <div class="fixed-bottom-50 text-center text-md-start">
                    <a href="../index.html" class="btn btn-danger">Cerrar sesión</a>
                </div>
                
            </div>
        </div>
    </div>
        
        <!-- Enlace 
            <a href="gestionOradores.jsp" class="btn btn-lg btn-warning">Ir a Gestión de Oradores</a>
            <a href="../index.html" class="btn btn-lg btn-danger">Cerrar sesión</a>
         -->
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
