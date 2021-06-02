<%--
  Created by IntelliJ IDEA.
  User: christian
  Date: 06/04/2018
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionScope.id == null }">
        <%@include file="vues/home.jsp"%>
    </c:when>
    <c:otherwise>
        <%@include file="vues/header.jsp" %>
        <body>
        <%@include file="vues/navigation.jsp"%>
        <div class="title ui-corner-left">

            <h1 style="margin-left: auto">Accueil</h1>
        </div>
        <div class="jumbotron text-center">
            <h2>Bienvenue dans l'application Permis Piste</h2>
        </div>

        <%@include file="vues/footer.jsp"%>
        </body>
        </html>
    </c:otherwise>
</c:choose>


