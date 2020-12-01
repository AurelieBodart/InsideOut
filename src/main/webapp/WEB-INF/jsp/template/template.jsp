<%--
  Created by IntelliJ IDEA.
  User: Christophe Bernard
  Date: 13/10/2020 @ 11:24
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/importTags.jsp"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="max-age=604800" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- jQuery -->
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

	<script type="text/javascript">
        /// some script

        // jquery ready start
        $(document).ready(function() {
            // jQuery code

        });
        // jquery end
	</script>

	<title>${title}</title>
	<spring:url var="localeFr" value="">
		<spring:param name="locale" value="fr" />
	</spring:url>

	<spring:url var="localeEn" value="">
		<spring:param name="locale" value="en" />
	</spring:url>
</head>
<body>
<header class="section-header">
	<nav class="navbar navbar-dark navbar-expand p-0 bg-primary">
		<div class="container">
			<ul class="navbar-nav d-none d-md-flex mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<a href="${localeEn}" class="nav-link dropdown-toggle" data-toggle="dropdown"> English </a>
					<ul class="dropdown-menu dropdown-menu-right" style="max-width: 100px;">
						<li><a class="dropdown-item" href="${localeFr}">French</a></li>
					</ul>
				</li>
			</ul> <!-- list-inline //  -->
		</div> <!-- container //  -->
	</nav> <!-- header-top-light.// -->

	<section class="header-main border-bottom">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-2 col-6">
					<a href="http://localhost:8082/" class="brand-wrap">
						<img class="logo" src="<spring:url value='/images/logo.png' />">
					</a> <!-- brand-wrap.// -->
				</div>

				<div class="col-lg-6 col-12 col-sm-12">
				</div> <!-- col.// -->

				<div class="col-lg-4 col-sm-6 col-12">
					<div class="widgets-wrap float-lg-right">
						<div class="widget-header  mr-3">
							<a href="#" class="icon icon-sm rounded-circle border">
								<i class="fa fa-shopping-cart"></i>
							</a>
							<span class="badge badge-pill badge-danger notify">0</span>
						</div>
						<div class="widget-header icontext">
							<a href="#" class="icon icon-sm rounded-circle border">
								<i class="fa fa-user"></i>
							</a>
							<div class="text">
								<span class="text-muted">Welcome!</span>
								<div>
									<a href="#">Sign in</a> |
									<a href="#"> Register</a>
								</div>
							</div>
						</div>
					</div> <!-- widgets-wrap.// -->
				</div> <!-- col.// -->
			</div> <!-- row.// -->
		</div> <!-- container.// -->
	</section> <!-- header-main .// -->

	<nav class="navbar navbar-main navbar-expand-lg navbar-light border-bottom">
		<div class="container">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-controls="main_nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="main_nav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="#">Fashion</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Supermarket</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Electronics</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Baby &amp Toys</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Fitness sport</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Clothing</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Furnitures</a>
					</li>
				</ul>
			</div> <!-- collapse .// -->
		</div> <!-- container .// -->
	</nav>

</header> <!-- section-header.// -->

<tiles:insertAttribute name="main-content" />

<footer class="section-footer border-top padding-y">
	<div class="container">
		<p>	&copy Copyright 2020 All rights reserved</p>
		<p>	<a href="#">Terms and conditions</a> </p>
	</div><!-- //container -->
</footer>
</body>
</html>
