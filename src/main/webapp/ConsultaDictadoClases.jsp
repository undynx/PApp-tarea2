<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta dictado de clases</title>
</head>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>

    <!-- Contenido de la página principal -->     
  <div class="container mt-5">
  <form action="ConsultaDictadoClase" method="post">
    <div class="form-group col-md-4">
      <label for="Instituto">Instituto:</label>
      <input type="text" class="form-control" id="instituto" name="instituto" required>
    </div>
    <div class="form-group col-md-4">
      <label for="Actividad">Actividad:</label>
      <input type="text" class="form-control" id="actividad" name="actividad" required>
    </div>
    <div class="form-group col-md-4">
      <label for="Clase">Clase:</label>
      <input type="text" class="form-control" id="clase" name="clase" required>
    </div>
    <br></br>
    <button type="submit" class="btn btn-primary">Consultar</button>	
  </form>
</div>
       
    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>