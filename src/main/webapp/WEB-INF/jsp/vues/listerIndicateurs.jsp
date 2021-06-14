<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp"%>

<main>
    <div class="jumbotron text-center">
        <h1>Listing des Apprenants</h1>
    </div>

    <div class="container">
        <a class="btn btn-secondary" href="/authentification/accueil" role="button"><span class="glyphicon glyphicon-menu-left"></span> Retour accueil</a>
        <h2>Tableau des Apprenants</h2>
        <div class="container">
            <h3>Liste des Apprenants</h3>
            <table class="table table-hover">
                <tr>
                    <th class="col-md-1">Numero</th>
                    <th class="col-md-2">Formulation</th>
                    <th class="col-md-3">Valeur si coché</th>
                    <th class="col-md-4">Valeur si non coché</th>
                    <th class="col-md-5">Voir action lié</th>
                </tr>

                <c:forEach items="${mesIndicateurs}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.wording}</td>
                        <td>${item.valueIfCheck}</td>
                        <td>${item.valueIfUnCheck}</td>
                        <td><a class="btn btn-info" href="/action/getAction/${item.id}" role="button"><span
                                class="glyphicon glyphicon-share-alt"></span> Consulter l'action lié</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</main>

</body>

</html>