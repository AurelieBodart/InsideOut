<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: Christophe Bernard
  Date: 31/12/2020 @ 14:48
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include/importTags.jsp"%>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>${title}</title>

	<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

	<!-- jQuery -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="<spring:url value='/vendor/js/jquery-2.0.0.min.js' />" type="text/javascript"></script>

	<!-- Bootstrap4 files-->
	<script src="<spring:url value='/vendor/js/bootstrap.bundle.min.js' />" type="text/javascript"></script>
	<link href="<spring:url value='/vendor/css/bootstrap.css' />" rel="stylesheet" type="text/css"/>

	<!-- Font awesome 5 -->
	<link href="<spring:url value='/vendor/fonts/fontawesome/css/all.min.css' />" type="text/css" rel="stylesheet">

	<!-- custom style -->
	<link href="<spring:url value='/vendor/css/ui.css' />" rel="stylesheet" type="text/css"/>
	<link href="<spring:url value='/vendor/css/responsive.css' />" rel="stylesheet" media="only screen and (max-width: 1200px)" />

	<!-- custom javascript -->
	<script src="<spring:url value='/vendor/js/script.js' />" type="text/javascript"></script>


	<!-- Special version of Bootstrap that only affects content wrapped in .bootstrap-iso -->
	<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

	<!--Font Awesome (added because you use icons in your prepend/append)-->
	<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

</head>
<body>

	<header class="section-header">
		<section class="header-main border-bottom">
			<div class="container">
				<a href="<spring:url value="/" />" class="brand-wrap"><img class="logo" src="images/logo.png"></a>
			</div> <!-- container.// -->
		</section>
	</header> <!-- section-header.// -->

	<section class="section-content padding-y">
		<div class="container">

			<header class="section-heading">
				<h2 class="section-title">About us</h2>
			</header><!-- sect-heading -->

			<article>

				<p>Inside Out, c'est LE magasin de vente de merchandising rock & metal qu'il vous faut !</p>
				<p>En passant par Avenged Sevenfold, Five Finger Death Punch ou encore Powerwolf, nous nous proposons un catalogue varié et inédit de produits dérivés.</p>
				<p>Aurélie et moi avons eu l'idée de créer Inside Out dans le cadre d'un cours de développement d'application web en Java. Le thème était de produire un site de vente en ligne ; nous avons choisi le thème des groupes de rock et metal parce que nous sommes de grands fans des groupes proposés .</p>

				<br><br><br><br><br><br><br><br><br>
				<button class="btn btn-dark" type="button" onclick="window.history.back()">Go back</button>
			</article>

		</div> <!-- container .//  -->
	</section>
	<!-- ========================= SECTION CONTENT END// ========================= -->

	<!-- ========================= FOOTER ========================= -->
	<footer class="section-footer border-top padding-y"></footer>
	<!-- ========================= FOOTER END // ========================= -->

</body>
</html>
