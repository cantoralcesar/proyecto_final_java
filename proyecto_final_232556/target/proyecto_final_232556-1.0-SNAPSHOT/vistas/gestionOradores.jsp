<%-- 
    Document   : gestionOradores
    Created on : 15 dic. 2023, 16:15:47
    Author     : WINDOWS
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Orador"%>
<%@page import="dao.OradoresDAO"%>
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

        <title>Gestión de Oradores</title>
    </head>
    <body>
        <div class="container mt-5">
             <div class="d-flex justify-content-center align-items-center">
                 <img src="../img/ba.png" alt="logo codo a codo" height="80" class="d-none d-md-block">
                 <h2 class="text-center align-self-center">:Gestión de Oradores:</h2>
            </div>
            
            <!-- Tabla para mostrar contactos existentes con opciones para editar y eliminar -->
            <div class="table-responsive">
                    <table class="table table-sm align-middle table-striped table-dark table-hover text-center">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Email</th>
                                <th>Tema</th>
                                <th>Fecha Alta</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                int registrosPorPagina = 10; // Definir la cantidad de registros por página
                                int paginaActual = (request.getParameter("pagina") != null) ? Integer.parseInt(request.getParameter("pagina")) : 1;

                                OradoresDAO oradoresDAO = new OradoresDAO();

                                int numeroTotalRegistros = oradoresDAO.obtenerNumeroTotalOradores();
                                int numeroTotalPaginas = (int) Math.ceil((double) numeroTotalRegistros / registrosPorPagina);

                                 List<Orador> oradores = oradoresDAO.obtenerOradoresPaginados(paginaActual, registrosPorPagina);


                                // Crear una instancia de OradoresDAO para acceder a la base de datos
                                //OradoresDAO oradoresDAO = new OradoresDAO();

                                // Obtener la lista de oradores desde la base de datos
                                //List<Orador> oradores = oradoresDAO.obtenerTodos();

                                /*
                                Si la variable oradores no es nula y además no está vacía, entonces ejecuta el bloque de código 
                                que sigue a esta condición". Esta verificación previene errores al intentar realizar operaciones en
                                una lista o colección que no ha sido inicializada o que no contiene elementos.
                                */
                                if (oradores != null && !oradores.isEmpty()) {
                                     // Iterar sobre la lista de oradores y mostrar sus datos en la tabla
                                     for (Orador orador: oradores) {
                            %>
                            <tr >
                                <td><%= orador.getIdOrador()%></td>
                                <td><%= orador.getNombre()%></td>
                                <td><%= orador.getApellido()%></td>
                                <td><%= orador.getMail()%></td>
                                <td><%= orador.getTema()%></td>
                                <td><%= orador.getFechaAlta()%></td>
                                <td>
                                    <div colspan="6">
                                           <!-- Formulario para actualizar  -->
                                           <div class="d-flex justify-content-center text-center p-1 pt-1">
                                                    <form action="GestionOradorServlet" method="post" class="mr-2">
                                                             <input type ="hidden" name="accion" value="actualizar">
                                                             <input type ="hidden" name="id" value="<%= orador.getIdOrador()%>">
                                                             <button type="submit" class ="btn btn-warning btn-block">Editar</button>                                  
                                                    </form>

                                                     <!-- Formulario para eliminar  -->
                                                     <form id="eliminarOradorForm_<%= orador.getIdOrador()%>" action="GestionOradorServlet" method="post">
                                                             <input type="hidden" name="accion" value="eliminar">
                                                             <input type="hidden" name="id" value="<%= orador.getIdOrador()%>">
                                                             <button type="button" class="btn btn-danger btn-block" onclick="setOradorId(<%= orador.getIdOrador()%>)" 
                                                                     data-toggle="modal" data-target="#confirmarEliminarModal_<%= orador.getIdOrador()%>">
                                                                 Eliminar
                                                             </button>
                                                     </form>
                                           </div>
                                             <!-- Script para manejar la asignación del ID del orador al modal -->
                                             <script>
                                                    function setOradorId(id) {
                                                        document.getElementById('oradorIdAEliminar_' + id).innerText = id;
                                                    }
                                             </script>

                                            <!-- Modal de confirmación para cada orador -->
                                            <div class="modal fade" id="confirmarEliminarModal_<%= orador.getIdOrador()%>" tabindex="-1" 
                                                 role="dialog" aria-labelledby="confirmarEliminarModalLabel_<%= orador.getIdOrador()%>" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content bg-dark text-light">
                                                        <!-- Resto del contenido del modal -->
                                                        <div class="modal-body">
                                                            ¿Estás seguro de que deseas eliminar el orador con ID <span id="oradorIdAEliminar_<%= orador.getIdOrador()%>"></span>?
                                                        </div>
                                                        <!-- Resto del contenido del modal -->
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                            <!-- Botón de confirmación -->
                                                            <button type="submit" form="eliminarOradorForm_<%= orador.getIdOrador()%>" class="btn btn-danger">Eliminar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                    </div>
                                </td>
                            </tr>
                            <%
                                     }
                                } else {
                            %>
                            <tr>
                                <td colspan = "6">No hay oradores registrados</td>
                            </tr>
                            <%
                                }
                            %>


                        </tbody>
                    </table>
             </div>        
             <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center">
                          <% for (int i = 1; i <= numeroTotalPaginas; i++) { %>
                                    <li class="page-item <%= (paginaActual == i) ? "active" : "" %>">
                                    <a class="page-link" href="gestionOradores.jsp?pagina=<%= i %>"><%= i %></a>
                                    </li>
                          <% } %>
                   </ul>
             </nav>
                    
                    
             <!-- Botón para volver al índice -->   
             <div class="d-flex justify-content-center">
                 <a href="dashboard.jsp" class="btn btn-lg btn-success">Regresar a Principal</a>
                 <!-- Botón Registrar para mostrar el modal -->
                 <!--
                 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#miModal">
                       Registrar
                 </button>
                 -->
             </div>
             
             <!-- Modal para registar al cual si realiza pero me redirige al index cuando debe de quedarse en la misma página-->
             <!--
                <div class="modal fade" id="miModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registro de Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
             -->
             
                        <!-- Formulario para el registro de datos -->
             <!--           
                        <form action="../registroOrador" method="post" class="row g-3 mt-3" id="miForm">

                                <div class="col-lg-6 col-sm-12">
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese su nombre" required>
                                </div>
                               <div class="col-lg-6 col-sm-12">
                                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Ingrese sus apellidos" required>
                                </div>

                                 <div class="col-12">
                                 <input type="email" class="form-control" id="mail" name="mail" placeholder="Ingrese su correo electrónico" required>
                                 </div>

                                 <div class="mb-3 mt-3">
                                     <textarea class="form-control" rows="5" id="tema" name="tema" placeholder="Sobre que quieres hablar?" required></textarea>
                                 </div>

                               <!-- Botón para enviar el formulario -->
             <!--
                               <button type="submit" class="btn btn-success">Guardar</button>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
             -->
                    
        </div>
         <style>
  /* Estilos personalizados para la paginación */
  .pagination .page-item.active .page-link {
    background-color: #007bff; /* Cambiar al color deseado para la página activa */
    border-color: #007bff; /* Cambiar al color deseado para el borde de la página activa */
  }

  .pagination .page-item .page-link {
    background-color: #343a40; /* Cambiar al color deseado para las páginas inactivas */
    border-color: #343a40; /* Cambiar al color deseado para el borde de las páginas inactivas */
  }

  .pagination .page-item .page-link:hover {
    background-color: #0069d9; /* Cambiar al color deseado para el hover de las páginas inactivas */
    border-color: #0069d9; /* Cambiar al color deseado para el borde en el hover de las páginas inactivas */
  }
</style>

         

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>

