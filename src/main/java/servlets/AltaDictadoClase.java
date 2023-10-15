package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtActividad;
import datatypes.DtInstitucion;
import datatypes.DtProfesor;
import excepciones.ClaseRepetidaException;
import interfaces.Fabrica;
import interfaces.IActividadDeportiva;
import interfaces.IClase;
import interfaces.IInstitucionDeportiva;
import interfaces.IUsuario;

/**
 * Servlet implementation class AltaDictadoClase
 */
@WebServlet("/AltaDictadoClase")
public class AltaDictadoClase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaDictadoClase() {
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
		HttpSession sesion = request.getSession();
		Fabrica f = Fabrica.getInstancia();
		IInstitucionDeportiva iInstitucion = f.getIInstitucionDeportiva();
		IClase iClase = f.getIClase();
		IActividadDeportiva iActividad = f.getIActividadDeportiva();
		IUsuario iUsuario = f.getIUsuario();
		String nombreInstitucion = request.getParameter("nombreInstitucion");
		System.out.println(nombreInstitucion);
		
		DtInstitucion institucion =iInstitucion.getDtInstitucion(nombreInstitucion);
		if (institucion == null)
	        request.getRequestDispatcher("/Error.jsp").forward(request, response);
		else {
			String nombreActividad = request.getParameter("nombreActividad");
			System.out.println("prueba1 bien");
			System.out.println(nombreActividad);
			if(!iInstitucion.existeActividadEnUnaInstitucion(nombreInstitucion, nombreActividad)) {
				System.out.println("prueba1 error");
			    request.getRequestDispatcher("/Error.jsp").forward(request, response);
			}else {
				DtActividad actividad = iActividad.getDtActividad(nombreActividad);
				String nombreClase = request.getParameter("nombreClase");
				System.out.println("prueba2 bien");
				System.out.println(nombreClase);
				if(iInstitucion.existeClaseDeActividad(nombreInstitucion, nombreActividad, nombreClase)) {
					System.out.println("prueba2 error");
			        request.getRequestDispatcher("/Error.jsp").forward(request, response);
				}else {
					String horaInicio = request.getParameter("horaInicio");
					String url = request.getParameter("url");
					Date fechaRegistro = new Date();
					String nickname = (String) sesion.getAttribute("nickname");
					//DtProfesor profe =iUsuario.getDtProfesor(nickname);
					//String nombre = profe.getNombre();
					try {
						System.out.println("prueba3 bien");
						iClase.altaDictadoClase(nombreClase, actividad, fechaRegistro, nickname, horaInicio, url, new Date());
				        request.getRequestDispatcher("/AltaDictadoClases.jsp").forward(request, response);
					}catch(ClaseRepetidaException e) {
						System.out.println("prueba3 error");
				        request.getRequestDispatcher("/Error.jsp").forward(request, response);
						}
					}
				}
					
			}
			
		}
		
		
	}


