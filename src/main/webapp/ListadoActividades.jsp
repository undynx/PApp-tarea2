<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import ="datatypes.DtActividad" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./assets/styles/index.css" />
<title>Listado Actividades</title>
</head>
<body class="body">
	<%@ include file="header.jsp" %>
	
	<div class="container mt-4">
		<h3 class="mb-4">Listado de Actividades en ${institucionObtenida.nombre}</h3>
		
		
		<form
			action="ObtenerClases"
			method="post"
		>	
			<% List<DtActividad> actividades = (List<DtActividad>) request.getAttribute("listaActividades"); %>
			<% if (actividades.size() == 0) { %>
				<div>No existen actividades en esta institucion</div>
			<% } else { %>
				<label for="actividades">Elegí la Actividad</label>
				<select name="actividades" class="form-select form-select-lg mb-3">
					<% for (DtActividad act: actividades) { %>
						<option value="<%= act.getNombre() %>"> <%= act.getNombre() %> </option>
					<% } %>
				</select>

				<button type="submit" class="btn btn-primary">Siguiente</button>
			<% } %>
			
		</form>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>