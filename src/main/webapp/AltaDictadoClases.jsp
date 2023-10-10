<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta Dictado Clases</title>
</head>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>
	
	
	<div class="container mt-4">
		<h3 class="mb-4">Alta de Dictado de Clase</h3>
		<form action="AltaDictadoClase" method="post">
		
		<div style="padding-top: 20px;" class="form-row">
			<div class="form-group col-md-4">
	    	<label for="lblInstituciones">Nombre de la institucion: </label>
			<input type="text" class="form-control" name="nombreInstitucion" required>
	      	</div>
	    </div>
		<div id="comboBoxActividades">
			<div style="padding-top: 20px;" class="form-row">
				<div class="form-group col-md-4">
		    	<label for="lblActividades">Nombre de la Actividad: </label>
		     	<input type="text" class="form-control" name="nombreActividad" required>
		    	</div>
			</div>
		</div>
		 <div style="padding-top: 20px;" class="form-group col-md-4">
		 	<label for="nombreClase">Clase</label>
		    	<input type="text" class="form-control" name="nombreClase" required>
		 
	  	 </div>
		<div style="padding-top: 20px;" class="form-group col-md-4">
		  <label for="horaInicio">Hora de Inicio</label>
		  <input type="text" class="form-control" name="horaInicio" required >
		</div>
		<div style="padding-top: 20px; padding-bottom: 20px;" class="form-group col-md-4">
			<label for="url">URL</label>
			<input type="text" class="form-control" name="url" required>
		</div>
		<button type="submit" class="btn btn-primary">Agregar</button>	  	
	</form>
	</div>
    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>