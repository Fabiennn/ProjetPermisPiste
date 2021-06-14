<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="header.jsp" %>
<body>
<link rel="stylesheet" href="<c:url value="/css/ajouterApprenant.css"/>">
<%@include file="navigation.jsp" %>
<main>
<H1> Ajout d'un apprenant </H1>
<form method="post" action="ajouter">
    <div class="container-primary">
        <c:if test="${not empty alerte}">
            <p class="text-danger">Un apprenant existe déjà à ce nom.</p>
        </c:if>
        <div class="input-field">
            <label for="iden"><span class="animated-label">Identifiant</span>&nbsp</label>
            <input type="text" id="iden" name="surname" class="form-control"
                   required autofocus/>
        </div>
        <div class="input-field">
            <label for="name"><span class="animated-label">Nom</span>&nbsp</label>
            <input type="text" id="name" name="forname" ng-model="pwd" class="form-control" required/>
        </div>
        <div class="input-field">
            <label for="email"><span class="animated-label">Email</span>&nbsp</label>
            <input type="text" id="email" name="email" ng-model="pwd" class="form-control"
                   required/>
        </div>
        <div class="input-field">
            <label for="mdp"><span class="animated-label">Mot de passe</span>&nbsp</label>
            <input type="password" id="mdp" name="motdepasse" ng-model="pwd" class="form-control" required/>
        </div>
    </div>
    <button type="submit" class="btn-primary">
        Ajouter
    </button>
</form>
</main>
<%@include file="footer.jsp" %>
<script src="<c:url value="/js/inputAnimatedLabel.js"/>"></script>
</body>

</html>