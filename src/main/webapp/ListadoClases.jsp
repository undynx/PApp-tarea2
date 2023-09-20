<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import ="datatypes.DtClase" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./assets/styles/index.css" />
<title>Listado Clases</title>
</head>
<body class="body">
	
	<%@ include file="header.jsp" %>
	
	<div class="container mt-4">
		<h3 class="mb-4">Listado de Actividades en ${actividadObtenida.nombre}</h3>
		
		<table class="table table-sm">
  			<thead>
		    <tr>
		        <th>Atributo</th>
		        <th>Valor</th>
		    </tr>
		    </thead>
		    <tr>
		        <td>Nombre</td>
		        <td>${actividadObtenida.nombre}</td>
		    </tr>
		    <tr>
		        <td>Descripción</td>
		        <td>${actividadObtenida.descripcion}</td>
		    </tr>
		    <tr>
		        <td>Duración (minutos)</td>
		        <td>${actividadObtenida.duracionMinutos}</td>
		    </tr>
		    <tr>
		        <td>Costo</td>
		        <td>${actividadObtenida.costo}</td>
		    </tr>
		    <tr>
		        <td>Fecha de Registro</td>
		        <td>${actividadObtenida.fechaRegistro}</td>
		    </tr>
		</table>
		
		<form
			id="form"
			action="RegistroClase"
			method="post"
		>	
			<input type="hidden" id="claseSeleccionada" name="claseSeleccionada" value="">
			<div style="display: flex; justify-content: space-evenly; flex-wrap: wrap;" class="mt-2">
				<% List<DtClase> clases = (List<DtClase>) request.getAttribute("listaClases"); %>
				<% if (clases.size() == 0) { %>
					<div>No existen clases para esta actividad</div>
				<% } else { %>
					<% for (DtClase clase: clases) { %>
						<div class="card m-2" style="width: 250px;">
							<div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between;">
								<h5 class="card-title"><%= clase.getNombre() %></h5>
								<p class="card-text">
									<span style="font-weight: 600;">Hora de inicio:</span> <%= clase.getHoraInicio() %>
									<br>
									<span style="font-weight: 600;">URL:</span> <%= clase.getUrl() %>
								</p>
							<button 
								class="btn btn-primary"
								type="button"
								onClick="procesar('<%= clase.getNombre() %>')"
							>
								Inscribirme
							</button>
						</div>
					</div>
					<% } %>
				<% } %>
			</div>
		</form>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
<script type="text/javascript">
	function procesar(clase) {
		document.getElementById("claseSeleccionada").value = clase;
		document.getElementById("form").submit();
	}
</script>
</html>