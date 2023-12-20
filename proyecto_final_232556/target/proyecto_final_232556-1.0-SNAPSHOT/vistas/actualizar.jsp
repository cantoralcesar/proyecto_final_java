<%-- 
    Document   : actualizar
    Created on : 15 dic. 2023, 18:36:26
    Author     : Cesar Cantoral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Bootstrap-->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <!--Icons Bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <title>Actualizar Orador</title>
    </head>
    <body>
        <div class="container justify-content-center">
               <form action="GestionOradorServlet" method="post">
                        <input type ="hidden" name="accion" value="confirmarActualizacion">
                        <input type ="hidden" name="id" value="${orador.idOrador}">

                        <div class="form-group">
                            <label for="nombre">Nombre: </label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="${orador.nombre}" required>
                        </div>

                        <div class="form-group">
                            <label for="nombre">Apellido: </label>
                            <input type="text" class="form-control" id="apellido" name="apellido" value="${orador.apellido}" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email: </label>
                            <input type="email" class="form-control" id="mail" name="mail" value="${orador.mail}" required>
                        </div>

                        <div class="form-group">
                            <label for="tema">Tema: </label>
                            <input type="text" class="form-control" id="tema" name="tema" value="${orador.tema}" required>
                        </div>

                        <div class="form-group">
                            <label for="fechaAlta">Fecha Alta:</label>
                            <input type="date" class="form-control" id="fechaAlta" name="fechaAlta" value="${orador.fechaAlta}" required>
                        </div>
                    
                        <div class="d-flex justify-content-center">
                                <button type="submit" class="btn btn-lg btn-primary">Actualizar</button>
                                <a href="gestionOradores.jsp" class="btn btn-lg btn-success">Regresar</a>   
                         </div>   
               </form>
          </div>
         
    </body>
</html>
