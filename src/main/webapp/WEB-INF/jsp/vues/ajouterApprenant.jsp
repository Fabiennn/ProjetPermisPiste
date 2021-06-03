<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp" %>
<main>
<div class="jumbotron text-center">
    <H1> Ajout d'un apprenant </H1>
</div>
<div class="container">
    <div class="container">
        <form method="post" action="ajouter">
            <div class="col-md-35 well well-md">
                <c:if test="${not empty alerte}">
                <script>alert("Un apprenant a déjà ce nom !");
                </script>
                </c:if>
                <div class="col-md-18 well well-md">
                    <h1>Ajouter l'apprenant que vous voulez</h1>
                    <div class="row">
                        <div class="col-md-12" style="border:none; background-color:transparent; height :15px;">
                        </div>
                    </div>
                    <div class="form-horizontal">

                    <div class="form-group">
                        <label class="col-md-3 control-label">Prénom : </label>
                        <div class="col-md-6  col-md-3">
                            <input type="text" name="surname" class="form-control"
                                   required autofocus/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Nom : </label>
                        <div class="col-md-6 col-md-3">
                            <input type="text" name="forname" ng-model="pwd" class="form-control"
                                   required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Email : </label>
                        <div class="col-md-6 col-md-3">
                            <input type="text" name="email" ng-model="pwd" class="form-control"
                                   required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Mot de passe : </label>
                        <div class="col-md-6 col-md-3">
                            <input type="password" name="motdepasse" ng-model="pwd" class="form-control"
                                   required/>
                        </div>
                    </div>
                </div>
                <div class="form-group" style="text-align: center">
                    <button type="submit" class="btn btn-default btn-primary"><span
                            class="glyphicon glyphicon-ok"></span>
                        Ajouter
                    </button>

                    <button type="button" class="btn btn-default btn-primary"
                            onclick="{
                            window.location = '../index.jsp';
                        }">
                        <span class="glyphicon glyphicon-remove"></span> Annuler

                    </button>
                </div>
                </div>
        </form>
    </div>
</div>
<%@include file="footer.jsp" %>
</main>
</body>

</html>