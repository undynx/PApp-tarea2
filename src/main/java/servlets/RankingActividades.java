package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtActividad;
import interfaces.Fabrica;
import interfaces.IActividadDeportiva;

/**
 * Servlet implementation class RankingActividades
 */
@WebServlet("/RankingActividades")
public class RankingActividades extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankingActividades() {
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

		Fabrica fabric = Fabrica.getInstancia();
	    IActividadDeportiva iAD = fabric.getIActividadDeportiva();
	    List<DtActividad> actividadesOrdenadas;
	    actividadesOrdenadas = iAD.getRankingActividades();
		try {
			
			if(actividadesOrdenadas != null) {
			// Guardar la lista de Dtclases procesada en un atributo de solicitud
	        request.setAttribute("reqClasesOrdenadas", actividadesOrdenadas); 
			
	        // Reenviar la solicitud a la página JSP
		    request.getRequestDispatcher("/RankingActividades.jsp").forward(request, response);
			}
		
		}catch(Exception e){
	        // Manejar la excepción aquí, por ejemplo, redirigiendo a una página de error
	        request.getRequestDispatcher("/Error.jsp").forward(request, response);
	    	}   

	}

}
