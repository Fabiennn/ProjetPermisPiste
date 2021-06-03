<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp" %>
<main>
<div class="jumbotron text-center">
    <h1>Modification</h1>
</div>

<div class="container">
    <c:if test="${not empty alerte}">
        <script>alert("Nom de mission déjà prit !");
        </script></c:if>
    <a class="btn btn-secondary" href="/authentification/accueil" role="button"><span
            class="glyphicon glyphicon-menu-left"></span> Retour accueil</a>
    <div class="container">
        <form method="post" action="modifier">
            <div class="col-md-12 well well-md">
                <center><h1>Modifier une mission</h1></center>
                <input type="hidden" name="id" class="form-control" value="${maMission.id}"/>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Nom : </label>
                        <div class="col-md-6  col-md-3">
                            <input type="text" name="wording" class="form-control" value="${maMission.wording}"
                                   required autofocus/>
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
            </div>
        </form>
    </div>
</div>
<%@include file="footer.jsp" %>
</main>
</body>

</html>