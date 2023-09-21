package servlets;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import interfaces.Fabrica;
import interfaces.IActividadDeportiva;

import datatypes.DtClase;
import datatypes.DtActividad;
import excepciones.ExisteActividadDepException; // Importa la excepció

/**
 * Servlet implementation class ConsultaActividadDeportiva
 */
@WebServlet("/ConsultaActividadDeportiva")
public class ConsultaActividadDeportiva extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//IInstitucionDeportiva iID = fabrica.getIInstitucionDeportiva();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultaActividadDeportiva() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabric = Fabrica.getInstancia();
		IActividadDeportiva iAD = fabric.getIActividadDeportiva(); 
		List<DtActividad> listActividades = iAD.getRankingActividades();
		
		try {//llenar el combobox
				// Guardar la lista de DtActividades en reqNombreActividades
			    request.setAttribute("reqNombreActividad", listActividades);
		    	// Reenviar la solicitud a la página JSP
			    request.getRequestDispatcher("/ConsultaActividades.jsp").forward(request, response);
			   
				}catch (Exception e) {
			        // Manejar la excepción aquí, por ejemplo, redirigiendo a una página de error
			        request.getRequestDispatcher("/Error.jsp").forward(request, response);
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Fabrica fabric = Fabrica.getInstancia();
	    IActividadDeportiva iAD = fabric.getIActividadDeportiva();
	    
	    // Obtener la Actividad deportiva DADA
	    String nombreActividad = request.getParameter("unaActividad");
	   
	    try {
            // Intenta realizar la operación
	    //SI EXISTE
	    if(iAD.existeActividad(nombreActividad)) {   	 
	    	DtActividad dtActEncontrada = iAD.getDtActividad(nombreActividad);
	    	
	    	

	    	// Guardar contenido del DtActividad en un atributo de solicitud
	      
	    	request.setAttribute("reqActividad",dtActEncontrada);
	    	
	    	//las clases asociadas a la actividad obtenida
	    	List<DtClase> unDtClases=dtActEncontrada.getClases();
	    	
	    	// Guardar la lista de Dtclases procesada en un atributo de solicitud
	        request.setAttribute("reqClases", unDtClases);

	    	// Reenviar la solicitud a la página JSP
		    request.getRequestDispatcher("/ResultadoConsultaActividad.jsp").forward(request, response);
	    }else {
	    	 
	    	throw new ExisteActividadDepException("La actividad no existe");
	    }
	    
	}catch (ExisteActividadDepException e) {
        // Manejar la excepción aquí, por ejemplo, redirigiendo a una página de error
        request.getRequestDispatcher("/Error.jsp").forward(request, response);
    	}
	}
}
