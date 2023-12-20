<%-- 
    Document   : verOradores
    Created on : 14 dic. 2023, 01:11:05
    Author     : Cesar Cantoral
--%>

<%@page import="dao.OradoresDAO"%>
<%@page import="modelo.Orador"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <!--Icons Bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <link rel="stylesheet" href="css/style.css">

        <title>Lista de Oradores</title>
    </head>
    <body>
        
     
        <div class="container mt-5">
            <div class="d-flex justify-content-center align-items-center">
                 <img src="../img/ba.png" alt="logo codo a codo" height="80" class="d-none d-md-block">
                 <h2 class="text-center align-self-center">Lista de Oradores</h2>
            </div>
            
            <!-- Botón para volver al índice -->   
             <div class="d-flex justify-content-center">
              <!-- Botón centrado -->
                    <a href="../" class="btn btn-success btn-lg">Regresar</a>
             </div>      
            <br>
            <div class="table-responsive">
              <!-- Tabla para mostrar contactos existentes con opciones para editar y eliminar -->
            <table class="table table-sm table-striped table-dark">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Tema</th>
                        <th>Fecha Alta</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Crear una instancia de OradoresDAO para acceder a la base de datos
                        OradoresDAO oradoresDAO = new OradoresDAO();
                        
                        // Obtener la lista de oradores desde la base de datos
                        List<Orador> oradores = oradoresDAO.obtenerTodos();
                        
                        /*
                        Si la variable oradores no es nula y además no está vacía, entonces ejecuta el bloque de código 
                        que sigue a esta condición". Esta verificación previene errores al intentar realizar operaciones en
                        una lista o colección que no ha sido inicializada o que no contiene elementos.
                        */
                        if (oradores != null && !oradores.isEmpty()) {
                             // Iterar sobre la lista de oradores y mostrar sus datos en la tabla
                             for (Orador orador: oradores) {
                    %>
                    <tr>
                        <td><%= orador.getIdOrador()%></td>
                        <td><%= orador.getNombre()%></td>
                        <td><%= orador.getApellido()%></td>
                        <td><%= orador.getMail()%></td>
                        <td><%= orador.getTema()%></td>
                        <td><%= orador.getFechaAlta()%></td>
                    </tr>
           
                    <%
                             }
                        }else {
                    %>
                    <tr>
                        <td colspan = "5">No hay oradores registrados</td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
            </div>
                    
        </div>
       

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
