<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<script>
    $('.datepicker').datepicker();
</script>

<!-- ========================= SECTION CONTENT ========================= -->
<section class="section-content padding-y">

    <!-- ============================ COMPONENT REGISTER   ================================= -->
    <div class="card mx-auto" style="max-width:520px; margin-top:40px;">
        <article class="card-body">
            <header class="mb-4"><h4 class="card-title"><spring:message code="signUp"/></h4></header>
            <div class="bootstrap-iso">
                <form:form id="registerForm"
                           method="post"
                           action="/register/send"
                           modelAttribute="user">

                    <div class="form-row">
                        <div class="col form-group">
                            <form:label path="username">
                                <spring:message code="username"/>
                            </form:label>
                            <form:input path="username" cssClass="form-control" />
                            <form:errors path="username"/>
                        </div> <!-- form-group end.// -->
                    </div>
                    <div class="form-row">
                        <div class="col form-group">
                            <form:label path="password">
                                <spring:message code="password"/>
                            </form:label>
                            <form:input path="password" type="password" cssClass="form-control" />
                            <form:errors path="password"/>
                        </div> <!-- form-group end.// -->

                        <div class="col form-group">
                            <form:label path="password">
                                <spring:message code="confirmationPassword"/>
                            </form:label>
                            <form:input path="confirmationPassword" type="password" cssClass="form-control" />
                            <form:errors path="password"/>
                        </div> <!-- form-group end.// -->
                    </div> <!-- form-row end.// -->

                    <div class="form-row">
                        <div class="col form-group">
                            <form:label path="firstName">
                                <spring:message code="firstName"/>
                            </form:label>
                            <form:input path="firstName" cssClass="form-control" />
                            <form:errors path="firstName"/>
                        </div> <!-- form-group end.// -->

                        <div class="col form-group">
                            <form:label path="lastName">
                                <spring:message code="lastName"/>
                            </form:label>
                            <form:input path="lastName" cssClass="form-control" />
                            <form:errors path="lastName"/>
                        </div> <!-- form-group end.// -->
                    </div> <!-- form-row end.// -->

                    <div class="form-group">
                        <form:label path="birthdate" class="control-label " for="date">
                            <spring:message code="birthdate"/>
                        </form:label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <form:input path="birthdate" id="date" name="date" placeholder="mm/dd/yyyy" type="date" cssClass="form-control" />
                            <form:errors path="birthdate"/>
                        </div>

                    </div> <!-- form-group end.// -->

                    <div class="form-group">
                        <form:label path="email">
                            <spring:message code="email"/>
                        </form:label>
                        <form:input path="email" cssClass="form-control" />
                        <form:errors path="email"/>
                    </div> <!-- form-group end.// -->

                    <div class="form-group">
                        <form:label path="phoneNumber">
                            <spring:message code="phoneNumber"/>
                        </form:label>
                        <form:input type="phone" path="phoneNumber" cssClass="form-control" />
                        <form:errors path="phoneNumber"/>
                    </div> <!-- form-group end.// -->

                    <div class="form-group">
                        <form:label path="VATNumber">
                            <spring:message code="VAT"/>
                        </form:label>
                        <form:input path="VATNumber" cssClass="form-control" />
                    </div> <!-- form-group end.// -->

                        <div class="form-group">
                            <label class="custom-control custom-radio custom-control-inline">
                                <form:radiobutton path="gender" value="m" class="custom-control-input"/>
                                <span class="custom-control-label">
                                        <spring:message code='man'/>
                                </span>
                            </label>
                            <label class="custom-control custom-radio custom-control-inline">
                                <form:radiobutton path="gender" value="f" class="custom-control-input"/>
                                <span class="custom-control-label">
                                        <spring:message code='women'/>
                                </span>
                            </label>
                            <form:errors path="gender"/>
                        </div> <!-- form-group end.// -->

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <form:label path="street">
                                <spring:message code="street"/>
                            </form:label>
                            <form:input path="street" cssClass="form-control" />
                            <form:errors path="street"/>
                        </div> <!-- form-group end.// -->

                        <div class="form-group col-md-6">
                            <form:label path="number">
                                <spring:message code="streetNumber"/>
                            </form:label>
                            <form:input path="number" cssClass="form-control" />
                            <form:errors path="number"/>
                        </div> <!-- form-group end.// -->

                        <div class="form-group col-md-6">
                            <form:label path="city">
                                <spring:message code="city"/>
                            </form:label>
                            <form:input path="city" cssClass="form-control" />
                            <form:errors path="city"/>
                        </div> <!-- form-group end.// -->

                        <div class="form-group col-md-6">
                            <form:label path="postalCode">
                                <spring:message code="postalCode"/>
                            </form:label>
                            <form:input path="postalCode" cssClass="form-control" />
                            <form:errors path="postalCode"/>
                        </div> <!-- form-group end.// -->

                        <div class="form-group col-md-6">
                            <form:label path="country">
                                <spring:message code="country"/>
                            </form:label>
                            <form:input path="country" cssClass="form-control" />
                            <form:errors path="country"/>
                        </div> <!-- form-group end.// -->

                    </div> <!-- form-row.// -->

                    <div class="form-group">
                        <form:button type="submit" class="btn btn-primary btn-block"> <spring:message code="register"/> </form:button>
                    </div>

                </form:form>
            </div>

        </article><!-- card-body.// -->
    </div> <!-- card .// -->
    <p class="text-center mt-4"><spring:message code="alreadyAccount"/> <a href="<spring:url value='/goToLogin'/>"><spring:message code="login"/></a></p>
    <br><br>
    <!-- ============================ COMPONENT REGISTER  END.// ================================= -->
</section>
