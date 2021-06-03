<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp"%>
<main>
<div class="jumbotron text-center">
    <h1>Listing de l'apprenant désiré</h1>
</div>
<c:if test="${not empty alerte}">
    <script>alert("Aucun apprenant de ce nom");
    </script>
</c:if>
<div class="container">
    <a class="btn btn-secondary" href="/authentification/accueil" role="button"><span class="glyphicon glyphicon-menu-left"></span> Retour accueil</a>
    <h2>Information sur : ${monApprenant.surname}</h2>
        <table class="table table-hover">
            <tr>
                <th class="col-md-1">Numero</th>
                <th class="col-md-2">Nom</th>
                <th class="col-md-2">Prénom</th>
                <th class="col-md-4">E-mail</th>
                <th class="col-md-5">Mission</th>
                <th class="col-md-6">Modifier</th>
                <th class="col-md-7">Supprimer</th>

            </tr>

                <tr>
                    <td>${monApprenant.id}</td>
                    <td>${monApprenant.surname}</td>
                    <td>${monApprenant.forname}</td>
                    <td>${monApprenant.email}</td>
                    <td><a class="btn btn-info" href="/mission/consulterMissionApprenant/${item.id}" role="button"><span
                            class="glyphicon glyphicon-briefcase"></span> Missions</a></td>
                        <td><a class="btn btn-info" href="/apprenant/modifierApprenant/${item.id}" role="button"><span
                                class="glyphicon glyphicon-pencil"></span> Modifier</a></td>
                        <td><a class="btn btn-danger" href="/apprenant/supprimerApprenant/${item.id}" role="button"><span
                                class="glyphicon glyphicon-remove-circle"></span> Supprimer</a></td>
                </tr>
        </table>
    </div>
</div>
<%@include file="footer.jsp"%>
</main>

</body>

</html>