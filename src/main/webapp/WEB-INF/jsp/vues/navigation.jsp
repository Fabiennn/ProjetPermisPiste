<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/authentification/accueil" style="color: chartreuse">Permis Piste</a>
        </div>
        <p class="navbar-text">Gestion de l'exposition 2021</p>
        <ul class="nav navbar-nav">
            <li><a href="/authentification/accueil"> <span class="glyphicon glyphicon-home"></span> Accueil</a></li>
            <c:if test="${sessionScope.id == null }">
            <li class="dropdown">
                <a class="nav navbar-nav navbar-right" href="/authentification/login">
                    <span class="glyphicon glyphicon-user"></span>
                    Se Connecter
                    <span class="caret"></span>
                </a>
                </c:if>
            </li>
            <c:if test="${sessionScope.id > 0  }">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user"></span>
                        Missions
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/mission/ajoutMissionAdmin"> <span class="glyphicon glyphicon-plus"></span> Ajouter une mission</a>
                        </li>
                        <li><a href="/mission/getAllMissionAdmin"><span class="glyphicon glyphicon-th-list"></span> Lister
                            les missions</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user"></span>
                        Apprenants
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/mission/ajoutMissionAdmin"> <span class="glyphicon glyphicon-plus"></span> Ajouter un apprenant</a>
                        </li>
                        <li><a href="/apprenant/getAllApprenantAdmin"><span class="glyphicon glyphicon-th-list"></span> Lister
                            les apprenants</a>
                        </li>
                    </ul>
                </li>


                <li><a href="javascript:window.close();"><span class="glyphicon glyphicon-log-out"></span> Quitter</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.role.equals('apprenant')}">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user"></span>
                        TA MERE
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/adherent/ajout"> <span class="glyphicon glyphicon-plus"></span> TA RACE</a>
                        </li>
                        <li><a href="/adherent/getAdherents"><span class="glyphicon glyphicon-th-list"></span> TES UN APPRENANT</a>
                        </li>
                    </ul>
                </li>
            </c:if>

        </ul>
    </div>
</nav>
