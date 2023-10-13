<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="./assets/styles/index.css" />
    <title>Resultado de la Consulta</title>
</head>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>
    
    <%@ page import="java.util.List" %>
	<%@ page import="datatypes.DtClase" %>
	
	
     <!-- Contenido de la página principal -->
      <div class="container mt-5">
	    <h1>Resultados de la Consulta</h1>
	    <!-- Acceso a los atributos de DtActividad -->
			  <table class="table table-sm table-dark">
  			<thead>
		    <tr>
		        <th>Atributo</th>
		        <th>Valor</th>
		    </tr>
		    </thead>
		    <tr>
		        <td>Nombre</td>
		        <td>${reqActividad.nombre}</td>
		    </tr>
		    <tr>
		        <td>Descripción</td>
		        <td>${reqActividad.descripcion}</td>
		    </tr>
		    <tr>
		        <td>Duración (minutos)</td>
		        <td>${reqActividad.duracionMinutos}</td>
		    </tr>
		    <tr>
		        <td>Costo</td>
		        <td>${reqActividad.costo}</td>
		    </tr>
		    <tr>
		        <td>Fecha de Registro</td>
		        <td>${reqActividad.fechaRegistro}</td>
		    </tr>
		</table>
	
    </div>
    
    <div class="container mt-5">
    	<h1>Clases Asociadas</h1>
    	<table class="table table-sm table-dark">
    <tbody>
    <div style="display: flex; justify-content: space-evenly; flex-wrap: wrap;" class="mt-2"> 
        <%
            List<DtClase> clases = (List<DtClase>) request.getAttribute("reqClases");
            for (DtClase clase : clases) {
        %>
        
                  <div class="card m-2" style="width: 250px;" >
			<div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between;">
				<h5 class="card-title"><%= clase.getNombre() %></h5>
				<p class="card-text">
					<span style="font-weight: 600;">Actividad Deportiva:</span> <%= clase.getActividadDeportiva().getNombre() %>
					<br>
					<span style="font-weight: 600;">Hora de inicio:</span> <%= clase.getHoraInicio() %>
					<br>
					<span style="font-weight: 600;">URL:</span> <%= clase.getUrl() %>
				</p>
			
			   <form
				   	action="ConsultaDictadoClase"
					method="post"
			   >
			   		<input type="hidden" id="clase" name="clase" value="<%= clase.getNombre() %>">
               		<input type="submit" value="Consultar Clase" class="btn btn-primary">
			   </form>
			   
			</div>
			</div>

        <%
            }
        %>
       </div>
    </tbody>
</table>

    </div>
    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>

