<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<section class="section-content padding-y bg">
    <div class="container">
        <!-- ============================ COMPONENT 1 ================================= -->
        <div class="card">
            <div class="row no-gutters">

                <aside class="col-md-6">
                    <article class="gallery-wrap" style="margin-top: 40px">
                        <div class="img-big-wrap" style="display: flex; justify-content: center">
                            <img src="../../images/${product.getImage()}" />
                        </div> <!-- img-big-wrap.// -->
                    </article> <!-- gallery-wrap .end// -->
                </aside>

                <main class="col-md-6 border-left">
                    <article class="content-body">
                        <h2 class="title">${product.getName()}</h2>

                        <div class="mb-3">
                            <var class="price h4">${product.getPrice()}€</var>
                        </div>

                        <h5 style = "font-weight: bold"><spring:message code="productDescription"/></h5>
                        <ul>
                            <c:forTokens var="line" items="${product.getDescription()}" delims="°">
                                <li>${line}</li>
                            </c:forTokens>
                        </ul>

                        <dl class="row">
                            <dt class="col-sm-3"><spring:message code="color"/></dt>
                            <dd class="col-sm-9">${product.getColor()}</dd>

                            <dt class="col-sm-3"><spring:message code="size"/></dt>
                            <dd class="col-sm-9">${product.getSize()}</dd>

                            <dt class="col-sm-3"><spring:message code="targetedGender"/></dt>
                            <dd class="col-sm-9">${product.getTargetedGender() == 'f' ? "Femme" : product.getTargetedGender() == 'm' ? "Homme" : "Unisexe"}</dd>
                        </dl>

                        <hr>

                        <form:form id="addToCartForm" method="post" action="/cart/add/${product.getId()}" modelAttribute="orderLine">
                            <div class="row">
                                <div class="form-group col-md flex-grow-0">
                                    <form:label path="quantity">
                                        <spring:message code="quantity"/>
                                    </form:label>
                                    <div class="mb-3 input-spinner">
                                        <form:input cssStyle="max-width: 70px; width: 70px" type="number" cssClass="form-control" min="1" value="1" path="quantity" />
                                    </div>
                                </div> <!-- col.// -->

                            </div> <!-- row.// -->
                            <form:button class="btn  btn-outline-primary" >
                                <spring:message code="addToCart"/> <i class="fas fa-shopping-cart"></i>
                            </form:button>
                        </form:form>
                    </article> <!-- product-info-aside .// -->
                </main> <!-- col.// -->
            </div> <!-- row.// -->
        </div> <!-- card.// -->
        <!-- ============================ COMPONENT 1 END .// ================================= -->

        <br><br>

        <!-- ============================ COMPONENT 4  ================================= -->
        <article class="card">
            <div class="card-body">
                <div class="row">
                    <h5><spring:message code="band"/> : ${product.getBand().getName()}</h5>
                    <p>${product.getBand().getHistory()}</p>
                </div> <!-- row.// -->
            </div> <!-- card-body.// -->
        </article> <!-- card.// -->
        <!-- ============================ COMPONENT 4  .//END ================================= -->
    </div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->
