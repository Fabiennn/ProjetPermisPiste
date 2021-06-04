<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp"%>
<main>
<div class="jumbotron text-center">
    <h1>Liste des missions</h1>
</div>

<div class="container">
    <a class="btn btn-secondary" href="/authentification/accueil" role="button"><span class="glyphicon glyphicon-menu-left"></span> Retour accueil</a>
    <h2>Tableau des Missions</h2>
    <div class="container">
        <h3>Liste des Missions</h3>
        <table class="table table-hover">
            <tr>
                <th class="col-md-1">Id</th>
                <th class="col-md-2">Formulation</th>
                <c:if test="${sessionScope.role.equals('admin')}">
                <th class="col-md-3">Modifier</th>
                <th class="col-md-4">Supprimer</th>
                </c:if>
            </tr>

            <c:forEach items="${mesMissions}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.wording}</td>
                    <c:if test="${sessionScope.role.equals('admin')}">
                    <td><a class="btn btn-info" href="/mission/modifierMission/${item.id}" role="button"><span
                            class="glyphicon glyphicon-pencil"></span> Modifier</a></td>
                        <td><a class="btn btn-danger" href="/mission/supprimerMission/${item.id}" role="button"><span
                                class="glyphicon glyphicon-remove-circle"></span> Supprimer</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
    <form method="post" action="/mission/ajoutMissionAdmin" onsubmit="return teste()">
        <div class="form-group">
            <button type="submit" class="btn btn-default btn-primary"><span class="glyphicon glyphicon-ok"></span>
                Ajouter une mission
            </button>
        </div>
    </form>
</div>
<%@include file="footer.jsp"%>
</main>

</body>

</html>