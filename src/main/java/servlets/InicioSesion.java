package servlets;

import java.io.IOException;
import java.util.NoSuchElementException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interfaces.Fabrica;
import interfaces.IUsuario;

/**
 * Servlet implementation class InicioSesion
 */
@WebServlet("/InicioSesion")
public class InicioSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioSesion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Fabrica f = Fabrica.getInstancia();
		IUsuario iUsuario = f.getIUsuario();
		String nicknameUser = request.getParameter("unNickname");
		String contrasenaUser = request.getParameter("unaPassword");
		
		try {
			if(iUsuario.existeUsuario(nicknameUser)) {
				if(iUsuario.esContrasena(nicknameUser, contrasenaUser)) {
					boolean esSocio = iUsuario.esSocio(nicknameUser);
					String tipo;
					
					if(!esSocio) {
						tipo = "Profesor";
					} else {
						tipo = "Socio";
					}
					
					request.getSession().setAttribute("nickname", nicknameUser);
					request.getSession().setAttribute("tipo", tipo);
					request.getRequestDispatcher("/index.jsp").forward(request, response);
					
				} else {
					throw new NoSuchElementException("No es la contraseña");
				}
			} else {
				throw new NoSuchElementException("No existe usuario");
			}
		} catch (NoSuchElementException nsee) {
			request.getRequestDispatcher("/Error.jsp").forward(request, response);
		}
	}

}
