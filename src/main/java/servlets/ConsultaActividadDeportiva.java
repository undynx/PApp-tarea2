package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import interfaces.Fabrica;
import interfaces.IActividadDeportiva;


import datatypes.DtActividad;

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
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
	    IActividadDeportiva iAD = fabrica.getIActividadDeportiva();
	    
	    // Obtener la Actividad deportiva DADA
	    String nombreActividad = request.getParameter("unaActividad");
	    //SI EXISTE
	    if(iAD.existeActividad(nombreActividad)) {   	 
	    	DtActividad dtActEncontrada = iAD.getDtActividad(nombreActividad);
	    	//String nom = actEncontrada.getNombre();
	    	//String des = actEncontrada.getDescripcion();
	       //int duracionM=actEncontrada.getDuracionMinutos();
	       // double costo =actEncontrada.getCosto();
	       // Date fRegistro =actEncontrada.getFechaRegistro();
	        
	    	// Guardar la actividad en un atributo de solicitud
	      
	    	request.setAttribute("reqActividad",dtActEncontrada);
	       
	    	// Reenviar la solicitud a la página JSP
		    request.getRequestDispatcher("/ResultadoConsultaActividad.jsp").forward(request, response);
	    }
	    
	}

}
