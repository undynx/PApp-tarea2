<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta usuario</title>
</head>
<body>
 <!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>
    <%@ page import="java.util.List" %>
    <%@ page import="datatypes.DtProfesor" %>
    <%@ page import="datatypes.DtClase" %>
    <%@ page import="datatypes.DtActividad" %>
    <%@ page import="datatypes.DtRegistro" %>
     <!-- 
		<form action="ConsultaUsuario" method="post">
        
        <input type="submit" value="ver usuario">
    </form>
    -->
    
    
    
    <!-- Contenido de la página principal -->
    <div class="container mt-4">
        <p>Consulta de Usuarios</p>
    </div>
    
    <div class="container-fluid">
		
		<% String nick = (String) session.getAttribute("nickname"); 
			if (nick != null) { 
		%>	
		<div class="row">
			<div class="col-sm-6">Nickname</div>
			<div class="col-sm-6">${usuario.nickname}</div>
			<div class="col-sm-6">Nombre</div>
			<div class="col-sm-6">${usuario.nombre}</div>
			<div class="col-sm-6">Apellido</div>
			<div class="col-sm-6">${usuario.apellido}</div>
			<div class="col-sm-6">Correo Electronico</div>
			<div class="col-sm-6">${usuario.correoElectronico}</div>
			<div class="col-sm-6">Fecha de Nacimiento</div>
			<div class="col-sm-6">${usuario.fechaNacimiento}</div>
		</div>
	</div>
	<div class="container-fluid" aria-labelledby="datosEspecificos">
	
	<% String tipo = (String) session.getAttribute("tipo");
	
	if ("Profesor".equals(tipo)) { %>

	<div class="row">
		<div class="col-sm-6">Institución:</div>
		<div class="col-sm-6"><%= request.getAttribute("nombreIntitusion") %></div>
		<div class="col-sm-6">Descripcion:</div>
		<div class="col-sm-6">${usuario.descripcionGeneral}</div>
		<div class="col-sm-6">Biografia:</div>
		<div class="col-sm-6">${usuario.biografia}</div>
		<div class="col-sm-6">Sitio Web:</div>
		<div class="col-sm-6">${usuario.sitioWeb}</div>
		<div class="col-sm-6">Lista de clases dictadas:</div>
		<!-- De esta forma se me ocurrió para mostrarlo lindo con bootstrap, pero no se si va a andar
			Noté intentando mostrar las actividades deportivas asociadas a la DtClase, que no tenemos 
			actividades deportivas guardadas en DtClase (sí en Clase) entonces opté por fingir 
			demencia respecto a ese requisito
			
			Esta forma es la que he logrado para que ande. Con la tabla no lo logro, pero capaz me ayudan con eso y queda más bonito.
			-->
		
		<div class="container" aria-labelledby="datosEspecificos">
			<%
			List<DtClase> clases = (List<DtClase>) request.getAttribute("listaClasesProf");
			  if(clases !=null){        
					for (DtClase clase : clases) {
			%>
				<div class="row mt-2 py-1">
					<div class="col-sm-3"><%= clase.getNombre() %></div>
					<div class="col-sm-3">
						<form action="ConsultaDictadoClase" method="post">
							<input type="hidden" id="instituto" name="instituto" value="<%= request.getAttribute("nombreIntitusion") %>">
							<input type="hidden" id="actividad" name="actividad" value="<%= clase.getActividadDeportiva().getNombre() %>">
							<input type="hidden" id="clase" name="clase" value="<%= clase.getNombre() %>">
			        		<input type="submit" value="Consultar">
				    	</form>
				    </div>
				</div>
			<%
	            }
			  }
			%>	   
		</div> 
		<!-- ------------------------------------------------------------------------------------------- -->
		
	    
	    <!-- Data de la lista de clases que tienen los profesores. Lo básico sería nombre y actividad asociada?
		    this.nombreClase = nombreClase;
			this.actividadDeportiva = actividadDeportiva;
			this.fechaClase = fechaClase;
			this.profesor = profesor;
			this.horaInicio = horaInicio;
			this.urlClase = urlClase;
			this.fechaRegistro = fechaRegistro;
	     -->
	     <!-- Esta forma la robé de no me acuerdo cuál caso de uso de alguno de ustedes  -->
	     <div class="container mt-3 border-top border-secondary">
	    	<h4>Clases Dictadas</h4>
	    	<table class="table table-bordered table-striped table-sm">
			    <thead>
			        <tr>
			            <th scope="col">Nombre de Clase</th>
			            <th scope="col">Actividad Deportiva Asociada</th>
			            <th scope="col">URL</th>
			        </tr>
			    </thead>
			    <tbody>
			        <%
			        List<DtClase> clases2 = (List<DtClase>) request.getAttribute("listaClasesProf");
			        if(clases2 !=null){ 	
					for (DtClase clase : clases2) {
			        %>
			        <tr>
			            <td>
			            <!-- pongo como link el nombre de la clase dirigido a consutlta dicatdo clase pasando el nonbre como parametro para utilizarlo despues -->
			                <a href="ConsultaDictadoClases.jsp?nombreClase=<%= clase.getNombre() %>">
			                <a href="ConsultaDictadoClases.jsp?clase=<%= clase.getNombre() %>&instituto=<%= request.getAttribute("nombreIntitusion") %>&actividad=<%= clase.getActividadDeportiva().getNombre() %>">
			                    <%= clase.getNombre() %>
			                </a>
			            </td>
			            <td>
							<a href="ConsultaActividades.jsp?unaActividad=<%= clase.getActividadDeportiva().getNombre() %>">
			                    <%= clase.getActividadDeportiva().getNombre() %>
			                </a>
						</td>
			            <td><%= clase.getUrl() %></td>
			        </tr>
			        <%
			            }
			        }
			        %>
			    </tbody>
			</table>

 			  </div>
	     

	</div>


	<% } else { %>
		<div class="col-sm-6">Clases a las cuales está registrado:</div>
		<!-- De esta forma se me ocurrió para mostrarlo lindo con bootstrap, pero no se si va a andar-->
		<%
        List<String> clasesS = (List<String>) request.getAttribute("listaClasesSoc");
		if(clasesS !=null){  
   	
		for (String clase : clasesS) {
			%>
				<div class="row mt-2 py-1">
					<div class="col-sm-3"><%= clase %></div>
					<div class="col-sm-3">
						<form action="ConsultaDictadoClase" method="post">
							<input type="hidden" id="instituto" name="instituto" value="<%= request.getAttribute("nombreIntitusion") %>">
							
							<!-- El buen socio como devuelve una lista de Strings 
							vamo a tener que ver como pasarle la actividad deportiva 
							asociada a la clase por parametros tambien -->
							<input type="hidden" id="actividad" name="actividad" value="<%= clase %>">
							<!-- LPM con esoooo Capaz podemos fijarnos la actividad dentro del .java de ConsultaDictadoClase-->
							
							<input type="hidden" id="clase" name="clase" value="<%= clase %>">
			        		<input type="submit" value="Consultar">
				    	</form>
				    </div>
				</div>
				<div class="col-sm-3"><%= clase %></div>
				<div class="col-sm-3">
					<form action="ConsultaDictadoClase" method="post">
						<input type="hidden" id="claseSeleccionada" name="claseSeleccionada" value="<%= clase %>">
		        		<input type="submit" value="Consultar">
			    	</form>
			    </div>
		<%
            }
		}
		%>
			    
		<!-- ------------------------------------------------------------------------------------------- -->
		<!-- DtSocios tiene una Lista de Registros. Los Registros tienen la siguiente información:
				private	Date fechaRegistro;
				private Socio socio;
				private Clase clase;
			
			Los DtRegistros por su parte tienen la siguiente información:
			    private Date fechaRegistro;
			    private DtSocio socio;
			    private DtClase clase;
			
			Funcion de DtSocio que podria ser util:
				List<DtRegistro> getRegistros();
		-->
	
	<% } %>
	</div>
						
	<% } else { %>
	
	<div class="display-1">HA OCURRIDO UN ERROR Y USTÉ NO DEVERÍA ESTAR BIENDO ESSTO MISHISHO</div>
	<% } %>
	</div>


    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>