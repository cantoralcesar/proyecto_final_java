package controlador;


import dao.OradoresDAO;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Orador;

@WebServlet("/vistas/GestionOradorServlet")
public class gestionOradorServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
 
        
     
        
        String accion = request.getParameter("accion");
        OradoresDAO oradoresDAO = new OradoresDAO();
        
        // Inicializar idOrador antes del switch para que este disponible en todos los casos
        int idOrador = Integer.parseInt(request.getParameter("id"));
        
        switch(accion) {
            case "actualizar":
                Orador orador = oradoresDAO.obtenerPorId(idOrador);
                request.setAttribute("orador", orador);   // Esto permite pasar datos del servlet a una vista (como un archivo JSP) 
                                                                               // o a otro servlet  al que se redirige o se reenvia la solicitud.
                request.getRequestDispatcher("actualizar.jsp").forward(request, response);
                break;
/*
            case "confirmarActualizacion":
                Orador oradorActualizado = new Orador();
                oradorActualizado.setIdOrador(idOrador);
                oradorActualizado.setNombre(request.getParameter("nombre"));
                oradorActualizado.setApellido(request.getParameter("apellido"));
                oradorActualizado.setMail(request.getParameter("mail"));
                oradorActualizado.setTema(request.getParameter("tema"));
                // Asume que el método setFechaAlta acepta un java.SqlDate
                oradorActualizado.setFechaAlta(java.sql.Date.valueOf(request.getParameter("fecha_alta")));
                
                oradoresDAO.actualizarOrador(oradorActualizado);
                response.sendRedirect("gestionOradores.jsp");
                break;  

         
            case "confirmarActualizacion":
    Orador oradorActualizado = new Orador();
    oradorActualizado.setIdOrador(idOrador);
    oradorActualizado.setNombre(request.getParameter("nombre"));
    oradorActualizado.setApellido(request.getParameter("apellido"));
    oradorActualizado.setMail(request.getParameter("mail"));
    oradorActualizado.setTema(request.getParameter("tema"));

    // Manejo de la conversión de la fecha
    String fechaAltaStr = request.getParameter("fecha_alta");
    java.sql.Date fechaAlta = null;

    try {
        SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date fechaUtil = formatoFecha.parse(fechaAltaStr);
        fechaAlta = new java.sql.Date(fechaUtil.getTime());
    } catch (ParseException | NullPointerException e) {
        e.printStackTrace(); // Trata adecuadamente la excepción
        // Aquí puedes manejar la excepción como desees,
        // como asignar una fecha por defecto o mostrar un mensaje de error.
    }

    // Asignación de la fecha a oradorActualizado
    oradorActualizado.setFechaAlta(fechaAlta);

    oradoresDAO.actualizarOrador(oradorActualizado);
    response.sendRedirect("gestionOradores.jsp");
    break;
*/
                
                case "confirmarActualizacion":
                Orador oradorActualizado = new Orador();
                oradorActualizado.setIdOrador(idOrador);
                oradorActualizado.setNombre(request.getParameter("nombre"));
                oradorActualizado.setApellido(request.getParameter("apellido"));
                oradorActualizado.setMail(request.getParameter("mail"));
                oradorActualizado.setTema(request.getParameter("tema"));
/*
                String fechaAltaString = request.getParameter("fecha_alta");
                try {
                    if (fechaAltaString != null && !fechaAltaString.isEmpty()) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        java.util.Date fechaAltaUtil = sdf.parse(fechaAltaString);
                        java.sql.Date fechaAltaSQL = new java.sql.Date(fechaAltaUtil.getTime());

                        oradorActualizado.setFechaAlta(fechaAltaSQL);
                    } else {
                        // Puedes establecer otro valor por defecto o manejarlo según tu lógica de aplicación
                    }

                    oradoresDAO.actualizarOrador(oradorActualizado);
                    response.sendRedirect("gestionOradores.jsp");
                } catch (ParseException e) {
                    e.printStackTrace();
                    // Manejar la excepción si ocurre algún problema al parsear la fecha
                }
*/
                String fechaAltaStr = request.getParameter("fechaAlta");
                if (fechaAltaStr != null && !fechaAltaStr.isEmpty()) {
                    try {
                        java.util.Date fechaAltaUtil = new SimpleDateFormat("yyyy-MM-dd").parse(fechaAltaStr);
                        java.sql.Date fechaAltaSql = new java.sql.Date(fechaAltaUtil.getTime());
                        oradorActualizado.setFechaAlta(fechaAltaSql);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
    
                // Continuar con la lógica de actualización
                oradoresDAO.actualizarOrador(oradorActualizado);
                response.sendRedirect("gestionOradores.jsp");
                
                break;
                
            case "eliminar":
                oradoresDAO.eliminarOrador(idOrador);
                response.sendRedirect("gestionOradores.jsp");
                break;
            default:
                response.sendRedirect("gestionOradores.jsp");
                break;
        }
        
    }
    
}
