<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.List" %>
  <%@page import ="datatypes.DtActividad" %>
    
 <!-- Actores 
 		Profesor/Socio
	  Descripción
	  	El caso de uso comienza cuando un usuario desea consultar una
		actividad deportiva. El usuario indica el nombre de la actividad
		deportiva y el sistema devuelve todos los datos de la actividad,
		incluyendo la lista de clases asociadas(es suficiente con el nombre). Si
		el usuario selecciona una clase asociada a esa actividad deportiva, se
		muestra la información detallada(redirigiendo a la vista de la clase), tal
		como se indica en el caso de uso Consulta de Dictado de Clase. 
-->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta de Actividades</title>
</head>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>

    <!-- Contenido de la página principal -->
       <div class="container mt-5">
        <form data-bs-theme="dark">
            <div class="form-group">
             	<label for="actividad">Actividad Deportiva:</label>
                <select class="form-control" id="actividad">
                
                   <option value="">Selecciona una Actividad</option>
					    <% 
					    	List<DtActividad> nombresActividades = (List<DtActividad>) request.getAttribute("nombresActividades");
					        if (nombresActividades != null) {
					            for (DtActividad nombreActividades : nombresActividades) {
					    %>
					                <option value="<%= nombreActividades.getNombre() %>"><%= nombreActividades.getNombre() %></option>
					    <%
					            }
					        }
					    %>
				</select>
      
            </div>
            <div class="form-group">
                <label for="institucion">Institución:</label>
                <select class="form-control" id="institucion">
                    <!-- Opciones para el ComboBox de Institución -->
                    <option value="club1">inst Deportiva 1</option>
                    <option value="club2">inst Deportiva 2</option>
                    <!-- Agrega más opciones según tus necesidades -->
                </select>
            </div>
        </form>
        <div class="mt-4" id="detalleForm" style="display: none;" data-bs-theme="dark">
            <h4>Detalles:</h4>
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <span class="form-control" id="nombre"></span>
            </div>
            <div class="form-group">
                <label for="fecha">Fecha:</label>
                <span class="form-control" id="fecha"></span>
            </div>
            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <span class="form-control" id="descripcion"></span>
            </div>
            <div class="form-group">
                <label for="costo">Costo:</label>
                <span class="form-control" id="costo"></span>
            </div>
            <div class="form-group">
                <label for="duracion">Duración:</label>
                <span class="form-control" id="duracion"></span>
            </div>
        </div>
        <div class="mt-4" id="tablaForm" style="display: none;">
            <h4>Clases:</h4>
            <table class="table table-dark table-striped">
                <thead>
                    <tr>
                        <th scope="col">Nombre Clase</th>
                        <th scope="col">URL</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Aquí puedes agregar filas para la tabla según tus necesidades -->
                    <tr>
                        <td>Clase 1</td>
                        <td><a href="#">Enlace</a></td>
                    </tr>
                    <tr>
                        <td>Clase 2</td>
                        <td><a href="#">Enlace</a></td>
                    </tr>
                    <!-- Agrega más filas según tus necesidades -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Enlace a Bootstrap JavaScript (opcional) -->
    <script>
        // Obtener elementos del formulario y la tabla
        const detalleForm = document.getElementById("detalleForm");
        const tablaForm = document.getElementById("tablaForm");

        // Obtener elementos de los combos
        const actividadCombo = document.getElementById("actividad");
        const institucionCombo = document.getElementById("institucion");

        // Escuchar cambios en los combos
        actividadCombo.addEventListener("change", mostrarDetalles);
        institucionCombo.addEventListener("change", mostrarDetalles);

        function mostrarDetalles() {
            // Verificar si se han seleccionado ambas opciones
            if (actividadCombo.value && institucionCombo.value) {
                // Rellenar las etiquetas con los valores de los combos
                document.getElementById("nombre").textContent = actividadCombo.value + " en " + institucionCombo.value;
                document.getElementById("fecha").textContent = "01/01/2023"; // Cambia esta fecha según tus necesidades
                document.getElementById("descripcion").textContent = "Descripción de la actividad deportiva"; // Cambia la descripción según tus necesidades
                document.getElementById("costo").textContent = " $50"; // Cambia el costo según tus necesidades
                document.getElementById("duracion").textContent = " 1 hora"; // Cambia la duración según tus necesidades

                // Mostrar el formulario de detalles y la tabla
                detalleForm.style.display = "block";
                tablaForm.style.display = "block";
            } else {
                // Si alguna de las opciones no está seleccionada, ocultar el formulario de detalles y la tabla
                detalleForm.style.display = "none";
                tablaForm.style.display = "none";
            }
        }
    </script>

    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>