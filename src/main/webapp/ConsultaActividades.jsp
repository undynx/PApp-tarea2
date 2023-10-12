
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Consulta de Actividades</title>
</head>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>
    <%@ page import="java.util.List" %>
	<%@ page import="datatypes.DtClase" %>
	<%@ page import="datatypes.DtActividad" %>
    <!-- Contenido de la página principal -->


      <div class="container mt-5">
       <div class="row justify-content-center">
       	<div class="col-md-6">
        <form action="ConsultaActividadDeportiva" method="post" class="form-inline">
            <label for="Actividad" class="mr-2">Actividades</label>
            <select name="unaActividad" class="form-control">
                <%
                    List<DtActividad> actividades = (List<DtActividad>) request.getAttribute("reqNombreActividad");
                    if (actividades != null) {
                        for (DtActividad unaActividad : actividades) { 
                %>
                    <option value="<%= unaActividad.getNombre() %>"><%= unaActividad.getNombre() %></option>
                <%
                        }
                    }
                %>
            </select>
            <div class="form-group mt-2 mb-2"> 
                    <input type="submit" class="btn btn-primary btn-block" value="Consultar">
            </div>
        </form>
        </div>
        </div>
    </div>

       
    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>