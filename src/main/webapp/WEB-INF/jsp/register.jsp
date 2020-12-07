<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>
<html>
<head>
    <meta charset="UTF-8">

    <!-- Special version of Bootstrap that only affects content wrapped in .bootstrap-iso -->
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

    <!--Font Awesome (added because you use icons in your prepend/append)-->
    <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

    <!-- Extra JavaScript/CSS added manually in "Settings" tab -->
    <!-- Include jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <!-- Include Date Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

    <script>
        $('.datepicker').datepicker();
    </script>

</head>
<body>

    <!-- ========================= SECTION CONTENT ========================= -->
    <section class="section-content padding-y">

        <!-- ============================ COMPONENT REGISTER   ================================= -->
        <div class="card mx-auto" style="max-width:520px; margin-top:40px;">
            <article class="card-body">
                <header class="mb-4"><h4 class="card-title">Sign up</h4></header>
                <div class="bootstrap-iso">
                    <form:form id="registerForm"
                               method="post"
                               action="/register/send"
                               modelAttribute="user">

                        <div class="form-row">
                            <div class="col form-group">
                                <form:label path="username">
                                    Username :
                                </form:label>
                                <form:input path="username"/>
                            </div> <!-- form-group end.// -->

                            <div class="form-group">
                                <form:label path="password">
                                    Password :
                                </form:label>
                                <form:input path="password" type="password"/>
                            </div> <!-- form-group end.// -->
                        </div> <!-- form-row end.// -->

                        <div class="form-row">
                            <div class="col form-group">
                                <form:label path="firstName">
                                    First name :
                                </form:label>
                                <form:input path="firstName"/>
                            </div> <!-- form-group end.// -->

                            <div class="col form-group">
                                <form:label path="lastName">
                                    Last name :
                                </form:label>
                                <form:input path="lastName"/>
                            </div> <!-- form-group end.// -->
                        </div> <!-- form-row end.// -->

                        <div class="form-group">
                            <form:label path="birthdate" class="control-label " for="date">
                                Birthdate :
                            </form:label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar">
                                    </i>
                                </div>
                                <form:input path="birthdate" data-provide="datepicker" class="form-control" id="date" name="date" placeholder="mm/dd/yyyy" type="text"/>
                            </div>

                        </div> <!-- form-group end.// -->

                        <div class="form-group">
                            <form:label path="email">
                                Email :
                            </form:label>
                            <form:input path="email"/>
                        </div> <!-- form-group end.// -->

                        <div class="form-group">
                            <form:label path="phoneNumber">
                                Phone number :
                            </form:label>
                            <form:input path="phoneNumber"/>
                        </div> <!-- form-group end.// -->

                        <div class="form-group">
                            <form:label path="VATNumber">
                                VAT number :
                            </form:label>
                            <form:input path="VATNumber"/>
                        </div> <!-- form-group end.// -->

                        <div class="form-group">
                            <form:radiobutton path="gender" value="m" label="Man" class="custom-control-label custom-control custom-radio custom-control-inline"/>
                            <form:radiobutton path="gender" value="f" label="Women" class="custom-control-label custom-control custom-radio custom-control-inline"/>
                        </div> <!-- form-group end.// -->

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <form:label path="street">
                                    Street :
                                </form:label>
                                <form:input path="street"/>
                            </div> <!-- form-group end.// -->

                            <div class="form-group col-md-6">
                                <form:label path="number">
                                    Number :
                                </form:label>
                                <form:input path="number"/>
                            </div> <!-- form-group end.// -->

                            <div class="form-group col-md-6">
                                <form:label path="city">
                                    City :
                                </form:label>
                                <form:input path="city"/>
                            </div> <!-- form-group end.// -->

                            <div class="form-group col-md-6">
                                <form:label path="postalCode">
                                    Postal code :
                                </form:label>
                                <form:input path="postalCode"/>
                            </div> <!-- form-group end.// -->

                            <div class="form-group col-md-6">
                                <form:label path="country">
                                    Country :
                                </form:label>
                                <form:input path="country"/>
                            </div> <!-- form-group end.// -->

                        </div> <!-- form-row.// -->

                        <div class="form-group">
                            <form:button type="submit" class="btn btn-primary btn-block"> Register </form:button>
                        </div>

                    </form:form>
                </div>

            </article><!-- card-body.// -->
        </div> <!-- card .// -->
        <p class="text-center mt-4">Have an account? <a href="/login">Log In</a></p>
        <br><br>
        <!-- ============================ COMPONENT REGISTER  END.// ================================= -->
    </section>
</body>
</html>
