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
    <!-- Bootstrap -->
    <link href="<spring:url value='/vendor/css/bootstrap.css' />" rel="stylesheet" type="text/css"/>
    <!-- Font awesome 5 -->
    <link href="<spring:url value='/vendor/fonts/fontawesome/css/all.min.css' />" type="text/css" rel="stylesheet">
    <!-- ui style -->
    <link href="<spring:url value='/vendor/css/ui.css' />" rel="stylesheet" type="text/css"/>
    <link href="<spring:url value='/vendor/css/responsive.css' />" rel="stylesheet" />

    <!-- jQuery -->
    <script src="<spring:url value='/vendor/js/jquery-2.0.0.min.js' />" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="<spring:url value='/vendor/js/bootstrap.bundle.min.js' />" type="text/javascript"></script>
    <!-- custom javascript -->
    <script src="<spring:url value='/vendor/js/script.js' />" type="text/javascript"></script>

    <title>${title}</title>
    <meta charset="UTF-8" />
    <spring:url var="localeFr" value="">
        <spring:param name="locale" value="fr" />
    </spring:url>

    <spring:url var="localeEn" value="">
        <spring:param name="locale" value="en" />
    </spring:url>
</head>
<body>
    <header class="section-header">
        <div class="container">
            <a href="#" class="brand-wrap"><img class="logo" src="<spring:url value='/vendor/images/logo.png' />" alt="Logo d'Inside Out"></a>
        </div>
        <span>
            <a href="${localeFr}">
                <img src="<spring:url value='/images/france-flag.png' />"  alt="French"/>
            </a>
            <a href="${localeEn}">
                <img src="<spring:url value='/images/united-kingdom-flag.png' />"  alt="English"/>
            </a>
        </span>
    </header>

    <tiles:insertAttribute name="main-content" />

    <section class="section-content padding-y">
        <div class="container">

            <header class="section-heading">
                <h2 class="section-title">Starter page </h2>
            </header><!-- sect-heading -->

            <article>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <p>Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur.</p>
            </article>
        </div> <!-- container .//  -->
    </section>
    <!-- ========================= SECTION CONTENT END// ========================= -->

    <footer class="section-footer border-top padding-y">
        <div class="container">
            <p>	&copy Copyright 2020 All rights reserved</p>
            <p>	<a href="#">Terms and conditions</a> </p>
        </div><!-- //container -->
    </footer>
</body>
</html>
