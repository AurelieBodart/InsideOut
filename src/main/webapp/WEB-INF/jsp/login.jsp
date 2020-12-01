<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<html lang="en">
<head>
	<meta charset="UTF-8">
</head>
<body>
<form:form
		method="post"
		modelAttribute="user">

	<form:label path="username">Username : </form:label>
	<form:input path="username"/>

	<form:label path="password">Password : </form:label>
	<form:input path="password"/>

	<form:button>Submit</form:button>
</form:form>
</body>
</html>