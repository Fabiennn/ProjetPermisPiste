<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp" %>
<main>
    <div class="jumbotron text-center">
        <h1>Liste des actions</h1>
    </div>

    <div class="container">
        <a class="btn btn-secondary" href="/authentification/accueil" role="button"><span
                class="glyphicon glyphicon-menu-left"></span> Retour accueil</a>
        <h2>Tableau des Actions</h2>
        <div class="container">
            <h3>Liste des Action</h3>
            <table class="table table-hover">
                <tr>
                    <th class="col-md-1">Id</th>
                    <th class="col-md-2">Formulation</th>
                    <th class="col-md-3">Score minimum</th>
                    <th class="col-md-4">Consulter Mission</th>
                    <c:if test="${sessionScope.role.equals('admin')}">
                        <th class="col-md-5">Modifier</th>
                        <th class="col-md-6">Ajouter une mission à cette action</th>
                        <th class="col-md-7">Supprimer</th>
                    </c:if>
                </tr>

                <tr>
                    <c:if test="${monAction.id != 20}">
                        <td>${monAction.id}</td>
                        <td>${monAction.wording}</td>
                        <td>${monAction.scoreMinimum}</td>
                        <td><a class="btn btn-info" href="/action/consulterMission/${monAction.id}" role="button"><span
                                class="glyphicon glyphicon-pencil"></span> Consulter Mission</a>
                        </td>
                        <c:if test="${sessionScope.role.equals('admin')}">
                            <td><a class="btn btn-info" href="/action/modifierAction/${monAction.id}"
                                   role="button"><span
                                    class="glyphicon glyphicon-share-alt"></span> Modifier</a>
                            </td>
                            <td><a class="btn btn-info" href="/action/ajouterMissionAAction/${monAction.id}"
                                   role="button"><span
                                    class="glyphicon glyphicon-eye-open"></span> Ajouter une mission à cette action</a>
                            </td>
                            <td><a class="btn btn-danger" href="/action/supprimerAction/${monAction.id}"
                                   role="button"><span
                                    class="glyphicon glyphicon-remove-circle"></span> Supprimer</a></td>
                        </c:if>
                    </c:if>
                </tr>
                </tr>
            </table>
        </div>
        <c:if test="${sessionScope.role.equals('admin')}">

            <form method="post" action="/mission/ajoutMissionAdmin" onsubmit="return teste()">
                <div class="form-group">
                    <button type="submit" class="btn btn-default btn-primary"><span
                            class="glyphicon glyphicon-ok"></span>
                        Ajouter une mission
                    </button>
                </div>
            </form>
        </c:if>
    </div>
    <%@include file="footer.jsp" %>
</main>

</body>

</html>