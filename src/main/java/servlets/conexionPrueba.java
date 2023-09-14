package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Servlet implementation class conexionPrueba
 */
@WebServlet("/conexionPrueba")
public class conexionPrueba extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public conexionPrueba() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	        // Configuración de la conexión a la base de datos
	        String jdbcUrl = "jdbc:postgresql://localhost:5432/gymbd";
	        String user = "postgres";
	        String pass = "1234";

	        // Intentar conectar a la base de datos
	        try {
	            PrintWriter out = response.getWriter();

	            out.println("Conectándose a la base de datos: " + jdbcUrl);

	            Class.forName("org.postgresql.Driver");

	            Connection connection = DriverManager.getConnection(jdbcUrl, user, pass);

	            out.println("Conexión exitosa!");

	            connection.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new ServletException(e);
	        }

		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
