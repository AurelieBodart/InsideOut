<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<html lang="en">
<head>
	<meta charset="UTF-8">
</head>
<body>
	<!-- ========================= SECTION CONTENT ========================= -->
	<section class="section-conten padding-y" style="min-height:84vh">

		<!-- ============================ COMPONENT LOGIN   ================================= -->
		<div class="card mx-auto" style="max-width: 380px; margin-top:100px;">
			<div class="card-body">
				<h4 class="card-title mb-4">Sign in</h4>

				<form:form
						method="post"
						modelAttribute="user">

				<div class="form-group">
					<form:label path="username">Username : </form:label>
					<form:input path="username"/>
				</div>

				<div class="form-group">
					<form:label path="password">Password : </form:label>
					<form:input path="password"/>
				</div>

				<div class="form-group">
					<form:button type="submit" class="btn btn-primary btn-block"> Login </form:button>
				</div>

				</form:form>

			</div> <!-- card-body.// -->
		</div> <!-- card .// -->

		<p class="text-center mt-4">Don't have account? <a href="/register">Sign up</a></p>
		<br><br>
		<!-- ============================ COMPONENT LOGIN  END.// ================================= -->


	</section>
<!-- ========================= SECTION CONTENT END// ========================= -->

</body>
</html>