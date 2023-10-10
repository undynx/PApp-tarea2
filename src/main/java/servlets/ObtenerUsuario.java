package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtProfesor;
import datatypes.DtSocio;
import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.IUsuario;

/**
 * Servlet implementation class ObtenerUsuario
 */
@WebServlet("/ObtenerUsuario")
public class ObtenerUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtenerUsuario() {
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
		IUsuario iUsuario = f.getIUsuario();
		
		String nicknameUsuario = (String) request.getSession().getAttribute("nickname");
		String tipoUsuario = (String) request.getSession().getAttribute("tipo");
		
		if(iUsuario.esSocio(nicknameUsuario)) {
			DtSocio dtSocio = iUsuario.getDtSocio(nicknameUsuario);
			request.setAttribute("usuarioObtenido", dtSocio);
		} else {
			DtProfesor dtProfesor = iUsuario.getDtProfesor(nicknameUsuario);
			request.setAttribute("usuarioObtenido", dtProfesor);
		}
		
		request.setAttribute("tipoUsuarioObtenido", tipoUsuario);
		request.getRequestDispatcher("/ModificarUsuario.jsp").forward(request, response);
	}

}
