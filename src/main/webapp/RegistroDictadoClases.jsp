<!-- El caso de uso comienza cuando un socio desea realizar un registro en
una actividad deportiva. El administrador indica la institución, la
actividad deportiva y la clase. El sistema se redirige a mostrar los datos
básicos de las clases, si existen. El usuario procede a realizar el registro.
En caso de que ya exista un registro de el/la se le notifica al usuario
que no fue posible realizar el registro por esa razón. Finalmente, el
sistema realiza el registro de el/la socio/a a la clase en dicha fecha y
con el costo del registro.  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import ="datatypes.DtInstitucion" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro Dictado Clases</title>
<link rel="stylesheet" type="text/css" href="./assets/styles/index.css" />
</head>
<body class="body">
<!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>

    <!-- Contenido de la página principal -->
    <div class="container mt-4">
        <h3 class="mb-4">Registro Dictado Clases</h3>
        <form
        	action="ObtenerActividades" 
			method="post"
        >

        <label for="institucion">Elegí la Institución</label>
        <select name="institucion" class="form-select form-select-lg mb-3">
	        <% 
		        List<DtInstitucion> instituciones = (List<DtInstitucion>) request.getAttribute("reqInstituciones");
				for (DtInstitucion inst : instituciones) { 
			%>
			  <option value="<%= inst.getNombre() %>"><%= inst.getNombre() %></option>
			<% } %>
        </select>
        
        	<button type="submit" class="btn btn-primary">Siguiente</button>
        </form>
        
    </div>

    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>