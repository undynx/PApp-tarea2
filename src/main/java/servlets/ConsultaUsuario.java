package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtActividad;
import datatypes.DtClase;
import datatypes.DtProfesor;
import datatypes.DtSocio;
import excepciones.UsuarioNoEsProfesorException;
import interfaces.Fabrica;
import interfaces.IActividadDeportiva;
import interfaces.IUsuario;
import interfaces.IClase;
/**
 * Servlet implementation class ConsultaUsuario
 */
@WebServlet("/ConsultaUsuario")
public class ConsultaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultaUsuario() {
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
		Fabrica fabric = Fabrica.getInstancia();
	    IActividadDeportiva iAD = fabric.getIActividadDeportiva();
	    IUsuario iUs = fabric.getIUsuario();
	    IClase iCl = fabric.getIClase();
	 // Obtén la sesión actual o crea una nueva si no existe
	    HttpSession session = request.getSession();

	    // Obtiene el valor del atributo "nickname" de la sesión
	    String nickname = (String) session.getAttribute("nickname");

	    // Verifica si el atributo existe y no es nulo antes de usarlo
	    try {
	    	if (nickname != null) {
		        // Ahora puedes usar la variable "nickname" en tu servlet
		    	if (iUs.esSocio(nickname)) {
			    	DtSocio dtSoc = iUs.getDtSocio(nickname);
			    	request.setAttribute("usuario", dtSoc);
			    	 request.getRequestDispatcher("/ConsultaUsuarios.jsp").forward(request, response);
			    	/*request.setAttribute("esSocio", true);
			    	request.setAttribute("esProfesor", false);*/
			    } else {
			    	DtProfesor dtProf = iUs.getDtProfesor(nickname);
			    	request.setAttribute("usuario", dtProf);
			    	request.getRequestDispatcher("/ConsultaUsuarios.jsp").forward(request, response);
			    	/*request.setAttribute("esSocio", false);
			    	request.setAttribute("esProfesor", true);*/
			    }
		    } else {
		    	throw new UsuarioNoEsProfesorException("La cagaste wawachine");
		    }
    	} catch (UsuarioNoEsProfesorException unp) {
	        // Manejar la excepción aquí, por ejemplo, redirigiendo a una página de error
	        request.getRequestDispatcher("/Error.jsp").forward(request, response);
    	}
	}

}
