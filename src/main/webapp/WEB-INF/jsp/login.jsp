<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<html lang="en">

	<!-- ========================= SECTION CONTENT ========================= -->
	<section class="section-conten padding-y" style="min-height:84vh">

		<!-- ============================ COMPONENT LOGIN   ================================= -->
		<div class="card mx-auto" style="max-width: 380px; margin-top:100px;">
			<div class="card-body">
				<h4 class="card-title mb-4"><spring:message code="signIn"/></h4>

				<form:form
						method="post"
						modelAttribute="user">

					<div class="form-group">
						<form:label path="username"><spring:message code="username"/></form:label>
						<form:input path="username"/>
					</div>

					<div class="form-group">
						<form:label path="password"><spring:message code="password"/></form:label>
						<form:input path="password"/>
					</div>

					<div class="form-group">
						<form:button type="submit" class="btn btn-primary btn-block"> <spring:message code="login"/> </form:button>
					</div>

				</form:form>

			</div> <!-- card-body.// -->
		</div> <!-- card .// -->

		<p class="text-center mt-4"><spring:message code="noAccount"/><a href="<spring:url value='/register' />"> <spring:message code="signUp"/></a></p>
		<br><br>
		<!-- ============================ COMPONENT LOGIN  END.// ================================= -->
	</section>
<!-- ========================= SECTION CONTENT END// ========================= -->
</html>