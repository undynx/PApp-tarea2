package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtActividad;
import datatypes.DtInstitucion;
import interfaces.Fabrica;
import interfaces.IActividadDeportiva;
import interfaces.IInstitucionDeportiva;

/**
 * Servlet implementation class ObtenerActividades
 */
@WebServlet("/ObtenerActividades")
public class ObtenerActividades extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtenerActividades() {
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
		IInstitucionDeportiva iInstitucion = f.getIInstitucionDeportiva();
		
		String nombreInstitucion = request.getParameter("institucion");
		
		DtInstitucion dtInstitucion = iInstitucion.getDtInstitucion(nombreInstitucion);
		
		List<DtActividad> dtActividades = dtInstitucion.getActividades();
		
		request.setAttribute("institucionObtenida", dtInstitucion);
		request.setAttribute("listaActividades", dtActividades);
		
		request.getRequestDispatcher("/ListadoActividades.jsp").forward(request, response);
		
	}

}
