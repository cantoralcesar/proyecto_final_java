<%-- 
    Document   : login
    Created on : 15 dic. 2023, 14:01:59
    Author     : Cesar Cantoral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Bootstrap-->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <!--Icons Bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <section class="vh-100" style="background-color: #300759;">
                <div class="container py-5 h-100">
                  <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                      <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                          <div class="col-md-6 col-lg-5 d-none d-md-block">
                              <div class="d-flex justify-content-center align-items-center h-100" style="background-color: #fdd306; border-radius: 1rem 0 0 1rem;">
                                   <img src="../img/ba_login2.png" 
                                   alt="login form" class="img-fluid"  style="border-radius: 1rem; " />
                              </div>                        
                          </div>
                          <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">

                                  
                                   <form action="LoginServlet" method="post" class="mt-4">

                                        <div class="d-flex justify-content-center align-items-center mb-3">
                                          <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                          <!--<span class="h1 fw-bold mb-0">Logo</span>-->
                                          <img src="../img/codoacodo.png" alt="logo codo a codo" height="100">
                                        </div>

                                        <h5 class="fw-normal mb-3 pb-3 text-center" style="letter-spacing: 1px;">Iniciar sesión en su cuenta</h5>

                                        <div class="form-outline mb-4">
                                          <input type="username" id="username" name="username" class="form-control form-control-lg"/>
                                          <label class="form-label" for="username">Nombre de usuario</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                          <input type="password" id="password" name="password" class="form-control form-control-lg"/>
                                          <label class="form-label" for="password">contraseña</label>
                                        </div>

                                        <div class="pt-1 mb-4 text-center">
                                          <button type="submit" class="btn btn-warning btn-lg btn-block text-white">Acceder</button>
                                          <a href="../" class="btn btn-warning btn-lg btn-block text-white">Volver</a>
                                        </div>                    
                                  </form>
                                    
                                    
                                    <!-- 
                                          Este código verifica si hay un mensaje de error y, si existe, muestra una alerta de 
                                          Bootstrap con el mensaje de error correspondiente. 
                                    -->
                                    
                                    <% String error = (String) request.getAttribute("error");
                                        if (error != null) { %>
                                                <div class="alert alert-danger text-center" role="alert">
                                                       <%= error %>
                                                </div>
                                     <% } %>
                                    

                                </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
            </section>
        </div>
       

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
