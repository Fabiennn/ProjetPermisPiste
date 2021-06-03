<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp"%>
<div class="jumbotron text-center">
    <h1>Liste des actions</h1>
</div>

<div class="container">
    <a class="btn btn-secondary" href="/authentification/accueil" role="button"><span class="glyphicon glyphicon-menu-left"></span> Retour accueil</a>
    <h2>Tableau des Actions</h2>
    <div class="container">
        <h3>Liste des Action</h3>
        <table class="table table-hover">
            <tr>
                <th class="col-md-1">Id</th>
                <th class="col-md-2">Formulation</th>
                <th class="col-md-3">Score minimum</th>
                <th class="col-md-4">Consulter Mission</th>
                <th class="col-md-5">Modifier</th>
                <th class="col-md-6">Ajouter une mission à cette action</th>
                <th class="col-md-7">Supprimer</th>
            </tr>

            <c:forEach items="${mesActions}" var="item">
                <tr>
                    <c:if test="${item.id != 20}">
                    <td>${item.id}</td>
                    <td>${item.wording}</td>
                    <td>${item.scoreMinimum}</td>
                    <td><a class="btn btn-info" href="/action/consulterMission/${item.id}" role="button"><span
                            class="glyphicon glyphicon-pencil"></span> Consulter Mission</a>
                    </td>
                    <td><a class="btn btn-info" href="/action/modifierAction/${item.id}" role="button"><span
                            class="glyphicon glyphicon-share-alt"></span> Modifier</a>
                    </td>
                        <td><a class="btn btn-info" href="/action/ajouterMissionAAction/${item.id}" role="button"><span
                                class="glyphicon glyphicon-eye-open"></span> Ajouter une mission à cette action</a></td>
                        <td><a class="btn btn-danger" href="/action/supprimerAction/${item.id}" role="button"><span
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
</body>

</html>