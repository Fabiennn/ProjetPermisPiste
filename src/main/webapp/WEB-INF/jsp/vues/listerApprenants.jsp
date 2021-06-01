<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp"%>
<div class="jumbotron text-center">
    <h1>Listing des Apprenants</h1>
</div>
zaeeza

<div class="container">
    <a class="btn btn-secondary" href="/authentification/accueil" role="button"><span class="glyphicon glyphicon-menu-left"></span> Retour accueil</a>
    <h2>Tableau des Apprenants</h2>
    <div class="container">
        <h3>Liste des Apprenants</h3>
        <table class="table table-hover">
            <tr>
                <th class="col-md-1">Numero</th>
                <th class="col-md-2">Nom</th>
                <th class="col-md-2">Prénom</th>
                <th class="col-md-4">E-mail</th>

            </tr>

            <c:forEach items="${mesApprenants}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.surname}</td>
                    <td>${item.forname}</td>
                    <td>${item.email}</td>
                    <td><a class="btn btn-info" href="/apprenant/modifierApprenant.htm?id=${item.id}" role="button"><span
                            class="glyphicon glyphicon-pencil"></span> Modifier</a>
                        <a class="btn btn-danger" href="supprimerAdherent.htm?id=${item.id}" role="button"><span
                                class="glyphicon glyphicon-remove-circle"></span> Supprimer</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>

</html>