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
import interfaces.IInstitucionDeportiva;
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
		// TODO Auto-generated method stub
		Fabrica fabrica = Fabrica.getInstancia();
		IActividadDeportiva iAD = fabrica.getIActividadDeportiva();

        // Obtener la lista de nombres de instituciones deportivas
        List<DtActividad> nombresActividades = iAD.getActividades();

        // Guardar la lista en un atributo de solicitud
        request.setAttribute("nombresActividades", nombresActividades);

        // Reenviar la solicitud a la página JSP
        request.getRequestDispatcher("/ConsultaActividadDeportiva.jsp").forward(request, response);
  
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}

}
