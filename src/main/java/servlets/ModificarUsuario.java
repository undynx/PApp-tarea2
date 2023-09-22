package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.DateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interfaces.Fabrica;
import interfaces.IUsuario;

/**
 * Servlet implementation class ModificarUsuario
 */
@WebServlet("/ModificarUsuario")
public class ModificarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarUsuario() {
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
		String campoEditar = (String) request.getParameter("campoEditar");
		String nickname = (String) request.getSession().getAttribute("nickname");
		
		if (campoEditar.equals("nombre")) {
			String nuevoValor = request.getParameter("input-nombre");
			iUsuario.modificarNombre(nickname, nuevoValor);
		} else if (campoEditar.equals("apellido")) {
			String nuevoValor = request.getParameter("input-apellido");
			iUsuario.modificarApellido(nickname, nuevoValor);
		} else if (campoEditar.equals("fecha")) {
			String nuevoValor = request.getParameter("input-fecha");
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// Parsear el String en un objeto Date
			try {
				Date fecha = sdf.parse(nuevoValor);
				iUsuario.modificarFechaNacimiento(nickname, fecha);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		request.getRequestDispatcher("/ModificarSuccess.jsp").forward(request, response);
	}

}
