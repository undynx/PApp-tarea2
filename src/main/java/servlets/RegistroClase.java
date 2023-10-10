package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import excepciones.RegistroClaseRepetidoException;
import interfaces.Fabrica;
import interfaces.IClase;
import interfaces.IRegistro;

/**
 * Servlet implementation class RegistroClase
 */
@WebServlet("/RegistroClase")
public class RegistroClase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroClase() {
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
		IRegistro iRegistro = f.getIRegistro();
		
		String nombreClase = request.getParameter("claseSeleccionada");
		String nombreUsuario = (String) request.getSession().getAttribute("nickname");
		
		request.setAttribute("nombreClase", nombreClase);
		request.setAttribute("nombreUsuario", nombreUsuario);
		
		try {
			iRegistro.RegistroDictadoClases(new Date(), nombreUsuario, nombreClase);
			request.getRequestDispatcher("/RegistroSuccess.jsp").forward(request, response);
		} catch (RegistroClaseRepetidoException e) {
			request.getRequestDispatcher("/RegistroError.jsp").forward(request, response);
		}

	}

}
