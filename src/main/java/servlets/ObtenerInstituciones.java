package servlets;

import java.io.IOException;
import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtInstitucion;
import interfaces.Fabrica;
import interfaces.IInstitucionDeportiva;

/**
 * Servlet implementation class ObtenerInstitucion
 */
@WebServlet("/ObtenerInstituciones")
public class ObtenerInstituciones extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtenerInstituciones() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		try {
			Fabrica f = Fabrica.getInstancia();
			IInstitucionDeportiva iInstitucion = f.getIInstitucionDeportiva();
			List<DtInstitucion> dtInstitucion = iInstitucion.getInstituciones();
			request.setAttribute("reqInstituciones", dtInstitucion);
			request.getRequestDispatcher("/RegistroDictadoClases.jsp").forward(request, response);
		} catch (NoSuchElementException nsee) {
			request.getRequestDispatcher("/Error.jsp").forward(request, response);
		}
	}

}
