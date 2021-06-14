<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="header.jsp" %>
<body>
<link rel="stylesheet" href="<c:url value="/css/ajouterApprenant.css"/>">
<%@include file="navigation.jsp" %>
<main>
    <h1>Modifier Apprenants</h1>
    <form method="post">
        <input type="hidden" name="id" class="form-control" value="${monApprenant.id}"/>
        <div class="container-primary">
            <c:if test="${not empty alerte}">
                <p class="text-danger">Un apprenant existe déjà à ce nom.</p>
            </c:if>
            <div class="input-field">
                <label for="iden"><span class="animated-label non-empty">Identifiant</span>&nbsp</label>
                <input type="text" id="iden" name="surname" value="${monApprenant.surname}"
                       required autofocus/>
            </div>
            <div class="input-field">
                <label for="name"><span class="animated-label non-empty">Nom</span>&nbsp</label>
                <input type="text" id="name" name="forname" value="${monApprenant.forname}" required/>
            </div>
            <div class="input-field">
                <label for="email"><span class="animated-label non-empty">Email</span>&nbsp</label>
                <input type="text" id="email" name="email" value="${monApprenant.email}"
                       required/>
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