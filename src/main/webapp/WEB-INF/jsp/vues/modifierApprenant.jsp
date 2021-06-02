<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp" %>
<div class="jumbotron text-center">
    <h1>Listing des Apprenants</h1>
</div>

<div class="container">
    <c:if test="${not empty alerte}">
        <script>alert("Nom d'utilisateur déjà prit !");
        </script></c:if>
    <a class="btn btn-secondary" href="/authentification/accueil" role="button"><span
            class="glyphicon glyphicon-menu-left"></span> Retour accueil</a>
    <div class="container">
        <form method="post" action="modifier">
            <div class="col-md-12 well well-md">
                <center><h1>Modifier un Apprenant</h1></center>
                <input type="hidden" name="id" class="form-control" value="${monApprenant.id}"/>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Nom : </label>
                        <div class="col-md-6  col-md-3">
                            <input type="text" name="surname" class="form-control" value="${monApprenant.surname}"
                                   required autofocus/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Prénom : </label>
                        <div class="col-md-6 col-md-3">
                            <input type="text" name="forname" ng-model="pwd" class="form-control"
                                   value="${monApprenant.forname}" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">E-mail : </label>
                        <div class="col-md-6 col-md-3">
                            <input type="text" name="email" ng-model="pwd" class="form-control"
                                   value="${monApprenant.email}" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-default btn-primary"><span
                                    class="glyphicon glyphicon-log-in"></span> Valider modification
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>

</html>