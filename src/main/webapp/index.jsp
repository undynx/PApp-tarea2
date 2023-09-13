<!-- @format -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" type="text/css" href="./assets/styles/index.css" />
		<title>EntrenamosUy</title>
	</head>

	<body class="body">
		<!-- Incluye el encabezado desde header.jsp -->
		<%@ include file="header.jsp" %>

		<!-- Contenido de la página principal -->
		<div class="pageContainer">
			<img src="./assets/images/poster.jpg" class="banner" />

			<div class="cardContainer">
				<div class="card" style="width: 300px">
					<img src="./assets/images/card-image1.jpg" class="card-img-top" />
					<div class="card-body">
						<h5 class="card-title">500 libras en Clean and Jerk</h5>
						<p class="card-text">
							Un increíble logro en el mundo del crossfit cuando un atleta rompe
							todas las expectativas al levantar...
						</p>
						<a
							href="https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"
							class="btn btn-primary"
							>Leer más</a
						>
					</div>
				</div>
				
				<div class="card" style="width: 300px">
					<img src="./assets/images/card-image3.jpg" class="card-img-top" />
					<div class="card-body">
						<h5 class="card-title">Retarse a diario: María Granizo</h5>
						<p class="card-text">
							La ganadora de los CrossFit Games 2023 cuenta que su fortaleza
							para ganar los CrossFit Games 2023 fu...
						</p>
						<a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley" class="btn btn-primary">Leer más</a>
					</div>
				</div>

				<div class="card" style="width: 300px">
					<img src="./assets/images/card-image2.jpg" class="card-img-top" />
					<div class="card-body">
						<h5 class="card-title">Beneficios del Crossfit</h5>
						<p class="card-text">
							Una investigación reciente revela cómo la práctica regular de
							crossfit no solo...
						</p>
						<a
							href="https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"
							class="btn btn-primary"
							>Leer más</a
						>
					</div>
				</div>
				
			</div>
		</div>

		<!-- Incluye el pie de página desde footer.jsp -->
		<%@ include file="footer.jsp" %>
	</body>
</html>
