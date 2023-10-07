package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtClase;
import interfaces.Fabrica;
import interfaces.IClase;
import interfaces.IInstitucionDeportiva;

/**
 * Servlet implementation class ConsultaDictadoClase
 */
@WebServlet("/ConsultaDictadoClase")
public class ConsultaDictadoClase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultaDictadoClase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Fabrica factory = Fabrica.getInstancia();
	    IInstitucionDeportiva iInstitucion = factory.getIInstitucionDeportiva();
	    IClase iclase = factory.getIClase();
	    
	    String nomIns = request.getParameter("instituto");
	    String nomAct = request.getParameter("actividad");
	    String nomCla = request.getParameter("clase");
	   
	    try {
	    	if(iInstitucion.existeClaseDeActividad(nomIns, nomAct, nomCla)) {   	 
				DtClase clase = iInstitucion.obtenerDtClase(nomIns, nomAct, nomCla);
				List<String> listaSocios = iclase.obtenerSociosDeUnaClase(nomCla);
		    	request.setAttribute("setCla",clase);
		    	request.setAttribute("listaSocios",listaSocios);
			    request.getRequestDispatcher("/ResultConsultaDictadoClase.jsp").forward(request, response);
	    	}else{
	    		throw new Exception("Error: No existe clase");
	    	}
	    }catch (Exception e) {
	    	request.getRequestDispatcher("/Error.jsp").forward(request, response);
    	}
	}
}