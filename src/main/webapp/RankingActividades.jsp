<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ranking de Actividades</title>
</head>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
<%@ include file="header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="datatypes.DtActividad" %>
<!-- Contenido de la pï¿½gina principal -->
<div class="container mt-4">
    <h1>Ranking de Actividades</h1>

   
</div>

    <!-- Contenido de la pï¿½gina principal -->
   <div id="tabla-container" class="container mt-4">
            
     <table class="table table-sm table-dark">
        <thead>
        <tr>
            <th>Cantidad Inscriptos</th>
            <th>Nombre</th>
            <th>Descripción</th>        
            <th>Costo</th>
        </tr>
        </thead>
        <% 
            List<DtActividad> actividades = (List<DtActividad>) request.getAttribute("reqClasesOrdenadas");
            if (actividades != null) {
                for (DtActividad actividad : actividades) {
        %>
        <tr>
            <td><%= actividad.getCantidadClases() %></td>
            <td><%= actividad.getNombre() %></td>
            <td><%= actividad.getDescripcion() %></td>
            <td><%= actividad.getCosto() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</div>

    <!-- Incluye el pie de pï¿½gina desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>