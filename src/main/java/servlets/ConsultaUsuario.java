package servlets;

import java.io.IOException;
import java.util.ArrayList;
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
import datatypes.DtRegistro;
import logica.Registro;
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
		//response.getWriter().append("Served at: ").append(request.getContextPath());
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
			    	List<DtClase> listaClases = new ArrayList<>();
			    		List<DtRegistro> listaRegistros = (List<DtRegistro>) dtSoc.getRegistros();
			            for(DtRegistro r: listaRegistros) {
			            	listaClases.add(r.getClase());
			            	System.out.println(r.getClase().getNombre());
			            }
			        
			    	request.setAttribute("usuario", dtSoc);
			    	request.setAttribute("listaClasesSoc", listaClases);
			    	request.getRequestDispatcher("/ConsultaUsuarios.jsp").forward(request, response);
			    		
			    	for(DtClase r: listaClases) {
			            	System.out.println(r.getNombre());
				    		}
			    	 
			    	 /*request.setAttribute("esSocio", true);
			    	 * 
			    	request.setAttribute("esProfesor", false);*/
			    } else {
			    	DtProfesor dtProf = iUs.getDtProfesor(nickname);
			    	String intitusion = dtProf.getNombreInstitucion();
			    	List<DtClase> clasercias = dtProf.getClases();
			    	
			    
			    	
			    	request.setAttribute("usuario", dtProf);
			    	
			    	request.setAttribute("listaClasesProf", clasercias);
			    	
			    	request.setAttribute("nombreIntitusion", intitusion);
			    	request.getRequestDispatcher("/ConsultaUsuarios.jsp").forward(request, response);
			    	/*request.setAttribute("esSocio", false);
			    	request.setAttrib
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
