<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="header.jsp" %>
<body>
<link rel="stylesheet" href="<c:url value="/css/ajouterApprenant.css"/>">
<%@include file="navigation.jsp" %>
<main>
    <h1>${title}</h1>
    <form method="post">
        <div class="container-primary">
            <c:if test="${not empty alerte}">
                <p class="text-danger">Nom de mission déjà pris !</p>
            </c:if>
            <input type="hidden" name="id" class="form-control" value="${monAction.id}"/>
            <div class="input-field">
                <label for="iden"><span class="animated-label non-empty">Formulation</span>&nbsp</label>
                <input type="text" id="iden" value="${monAction.wording}" name="wording" class="form-control"
                       required autofocus/>
            </div>
            <div class="input-field">
                <label for="name"><span class="animated-label non-empty">Score Minimum</span>&nbsp</label>
                <input type="text" id="name" name="scoreMinimum" ng-model="pwd" class="form-control" value="${monAction.scoreMinimum}" required/>
            </div>
        </div>
        <button type="submit" class="btn-primary">
            Valider modification
        </button>
    </form>
</main>
<%@include file="footer.jsp" %>
<script src="<c:url value="/js/inputAnimatedLabel.js"/>"></script>
</body>

</html>