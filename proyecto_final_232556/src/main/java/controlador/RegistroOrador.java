package controlador;

import dao.OradoresDAO;
import modelo.Orador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;


@WebServlet("/registroOrador")
public class RegistroOrador extends HttpServlet {
      
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  {
        
         // Obtener datos del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String mail = request.getParameter("mail");
        String tema = request.getParameter("tema");

        
        // Crear un objeto Orador con los datos
        Orador orador = new Orador();
        orador.setNombre(nombre);
        orador.setApellido(apellido);
        orador.setMail(mail);
        orador.setTema(tema);

        
        // Obtener la fecha actual
        java.util.Date fechaActual = new java.util.Date();  // Es una forma de utilizar la clase sin necesitar una declaración 'import'
        orador.setFechaAlta(new Date(fechaActual.getTime()));
        
        // Agregar el orador a la base de datos
        OradoresDAO oradoresDAO = new OradoresDAO();
        oradoresDAO.agregarOrador(orador);
        
        // Redireccionar a la página de visualización de oradores
        // response.sendRedirect(request.getContextPath() + "/vistas/verOradores.jsp");
        
        // Establecer un atributo en la request para indicar que el registro fue exitoso
        //request.setAttribute("registroExitoso", true);
        
        // Establecer un atributo en la sesión para indicar que el registro fue exitoso
        request.getSession().setAttribute("registroExitoso", "true");

        // Redirigir de vuelta al formulario de registro
        //request.getRequestDispatcher("/index.html").forward(request, response);
        
        // Redirigir a la misma página index.html con un mensaje de éxito
        response.sendRedirect(request.getContextPath() + "/index.html?registroExitoso=true");
        
        //response.sendRedirect(request.getContextPath() + "/gestionOradores.jsp?registroExitoso=true");

         
    }
    
}

