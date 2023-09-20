package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtActividad;
import datatypes.DtClase;
import interfaces.Fabrica;
import interfaces.IActividadDeportiva;

/**
 * Servlet implementation class ObtenerClases
 */
@WebServlet("/ObtenerClases")
public class ObtenerClases extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtenerClases() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Fabrica f = Fabrica.getInstancia();
		IActividadDeportiva iActividad = f.getIActividadDeportiva();
		
		String nombreActividad = request.getParameter("actividades");
		
		DtActividad actividad = iActividad.getDtActividad(nombreActividad);
		
		List<DtClase> dtClases = iActividad.getarrDtClase(nombreActividad);
		
		request.setAttribute("actividadObtenida", actividad);
		request.setAttribute("listaClases", dtClases);
		
		request.getRequestDispatcher("/ListadoClases.jsp").forward(request, response);
		
	}

}
