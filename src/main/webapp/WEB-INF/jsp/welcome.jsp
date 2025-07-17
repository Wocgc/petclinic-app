<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="home">
    <h3><fmt:message key="Look at the Sun"/></h3>

    <div class="row">
        <div class="col-md-12 text-center">
            <spring:url value="/resources/images/Made-by-sun.jpg" var="img1"/>
            <img src="${img1}" class="img-responsive" style="max-width: 80%; height: auto;" alt="sunny image" />
        </div>
    </div>
</petclinic:layout>

