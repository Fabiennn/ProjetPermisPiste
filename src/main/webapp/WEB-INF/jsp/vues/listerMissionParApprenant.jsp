<%@ page import="com.epul.oeuvre.domains.InscriptionActionEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="com.epul.oeuvre.domains.InscriptionEntity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<c:if test="${role == 'admin'}">
    <c:set var="title" value="Liste Missions de ${apprenant.forname}" scope="request"/>
</c:if>
<c:if test="${role == 'apprenant'}">
    <c:set var="title" value="Mes Missions" scope="request"/>
</c:if>
<jsp:include page="header.jsp" >
    <jsp:param name="title" value="${title}"/>
</jsp:include>
<body>
<link rel="stylesheet"  type="text/css" href="<c:url value="/css/listerMissionParApprenant.css"/>">
<%@include file="navigation.jsp"%>
<main>
    <h1>
        <c:if test="${role == 'admin'}">Liste des missions de ${apprenant.forname}</c:if>
        <c:if test="${role == 'apprenant'}">Liste de mes missions</c:if>
    </h1>
    <div class="missions-listing">
        <div class="previous-missions">
            <h2>Missions Effectuées</h2>
            <c:forEach items="${mesInscriptions}" var="inscription">
                ${mission = inscription.missionByFkMission ; ''}
                ${actions = inscription.inscriptionActionsById ; ''}
            <div class="mission-container">
                <div class="mission-grid mission-grid-body">
                    <p>#${mission.id}</p>
                    <p class="mission-wording">${mission.wording}</p>
                    <p class="mission-date">${actions[0].inscriptionByFkInscription.date}</p>
                    <p class="mission-state"><%
                        List<InscriptionActionEntity> inscriptionActionEntities = (List)pageContext.getAttribute("actions");
                        String value = "<span class=\"text-success\">Succès</span>";
                        for(InscriptionActionEntity inscriptionActionEntity : inscriptionActionEntities){
                            if(inscriptionActionEntity.getSort() != 1){
                                value = "<span class=\"text-danger\">Échec</span>";
                            }
                        };
                        out.println(value);
                    %></p>
                    <p class="mission-action">${fn:length(actions)}</p>
                </div>
                <div class="action-container-wrapper">
                    <div class="action-container">
                        <div class="action-grid action-grid-header">
                            <p></p>
                            <p>Actions</p>
                            <p class="text-center">Points</p>
                            <p>Résultat</p>
                        </div>
                   <c:forEach items="${actions}" var="actionInscription">
                        <div class="action-grid action-grid-body">
                            <p class="action-descritpion">#${actionInscription.id}</p>
                            <p class="action-descritpion">${actionInscription.actionByFkAction.wording}</p>
                            <p class="text-center">${actionInscription.score}</p>
                            <p><c:choose>
                                <c:when test="${actionInscription.sort == 1}"><span class="text-success">Valide</span></c:when>
                                <c:otherwise><span class="text-danger">Non Valide</span></c:otherwise>
                            </c:choose></p>
                        </div>
                   </c:forEach>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
        <c:if test="${fn:length(mesMissionNonEffectues) > 0 }">
        <div class="next-missions">
            <div class="next-missions-list">
                <h2>Missions Non Effectuées</h2>
                <c:if test="${role == 'admin'}">
                <form method="post">
                </c:if>
                <c:forEach items="${mesMissionNonEffectues}" var="inscription">
                    ${mission = inscription.missionByFkMission ; ''}
                    <div class="mission-container mission-grid next-mission-grid">
                        <p>#${mission.id}</p>
                        <p class="mission-wording">${mission.wording}</p>
                        <c:if test="${role == 'admin'}">
                            <button type="submit" name="deleteId" value="${inscription.id}" class="btn-svg delete-icon">
                                <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12.5 25C10.8073 25 9.18783 24.6704 7.6416 24.0112C6.09538 23.3521 4.76481 22.465 3.6499 21.3501C2.53499 20.2352 1.64795 18.9046 0.98877 17.3584C0.32959 15.8122 0 14.1927 0 12.5C0 10.8073 0.32959 9.18783 0.98877 7.6416C1.64795 6.09538 2.53499 4.76481 3.6499 3.6499C4.76481 2.53499 6.09538 1.64795 7.6416 0.98877C9.18783 0.32959 10.8073 0 12.5 0C14.1927 0 15.8122 0.32959 17.3584 0.98877C18.9046 1.64795 20.2352 2.53499 21.3501 3.6499C22.465 4.76481 23.3521 6.09538 24.0112 7.6416C24.6704 9.18783 25 10.8073 25 12.5C25 14.1927 24.6704 15.8122 24.0112 17.3584C23.3521 18.9046 22.465 20.2352 21.3501 21.3501C20.2352 22.465 18.9046 23.3521 17.3584 24.0112C15.8122 24.6704 14.1927 25 12.5 25ZM18.2617 9.00879C18.5872 8.69954 18.75 8.31706 18.75 7.86133C18.75 7.4056 18.5913 7.01904 18.2739 6.70166C17.9565 6.38428 17.57 6.22559 17.1143 6.22559C16.6585 6.22559 16.276 6.38835 15.9668 6.71387L12.4756 10.1807L9.00879 6.71387C8.69954 6.38835 8.31706 6.22559 7.86133 6.22559C7.4056 6.22559 7.01904 6.38428 6.70166 6.70166C6.38428 7.01904 6.22559 7.4056 6.22559 7.86133C6.22559 8.31706 6.38835 8.69954 6.71387 9.00879L10.1807 12.5L6.71387 15.9668C6.38835 16.276 6.22559 16.6585 6.22559 17.1143C6.22559 17.57 6.38428 17.9565 6.70166 18.2739C7.01904 18.5913 7.4056 18.75 7.86133 18.75C8.31706 18.75 8.69954 18.5872 9.00879 18.2617L12.4756 14.7949L15.9668 18.2617C16.276 18.5872 16.6585 18.75 17.1143 18.75C17.57 18.75 17.9565 18.5913 18.2739 18.2739C18.5913 17.9565 18.75 17.57 18.75 17.1143C18.75 16.6585 18.5872 16.276 18.2617 15.9668L14.7949 12.5L18.2617 9.00879Z" fill="#FF0000"/>
                                </svg>
                            </button>
                        </c:if>
                        <c:if test="${role == 'apprenant'}">
                            <a href="/mission/mesMissions/${inscription.id}/commencer" class="start-icon">
                                <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.5 25C19.4036 25 25 19.4036 25 12.5C25 5.59644 19.4036 0 12.5 0C5.59644 0 0 5.59644 0 12.5C0 19.4036 5.59644 25 12.5 25ZM19.0411 14.2423C20.372 13.468 20.3654 11.5432 19.0292 10.778L10.761 6.04276C9.425 5.27766 7.76177 6.2456 7.76702 7.78512L7.79953 17.312C7.80478 18.8515 9.47458 19.8081 10.8053 19.0339L19.0411 14.2423Z" fill="#00ADEF"/>
                                </svg>
                            </a>
                        </c:if>
                    </div>
                </c:forEach>
                <c:if test="${role == 'admin'}">
                    </form>
                </c:if>
            </div>
        </div>
        </c:if>
        <c:if test="${role == 'admin'}">
        <div class="">
            <form method="post" action="/mission/inscrireMissionApprenant" class="form-group">
                <h2>Ajouter une mission :</h2>
                <div class="mission-container mission-grid next-mission-grid add-mission-grid">
                    <p data-select="mission-id">#${allMissions[0].id}</p>
                    <div class="mission-select-wrapper">
                        <select name="idMission" class="mission-select" id="mission-select">
                            <c:forEach items="${allMissions}" var="mission">
                                <option value="${mission.id}">${mission.wording}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn-svg btn-add-mission"><svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12.5 25C10.8073 25 9.18783 24.6704 7.6416 24.0112C6.09538 23.3521 4.76481 22.465 3.6499 21.3501C2.53499 20.2352 1.64795 18.9046 0.98877 17.3584C0.32959 15.8122 0 14.1927 0 12.5C0 10.8073 0.32959 9.18783 0.98877 7.6416C1.64795 6.09538 2.53499 4.76481 3.6499 3.6499C4.76481 2.53499 6.09538 1.64795 7.6416 0.98877C9.18783 0.32959 10.8073 0 12.5 0C14.1927 0 15.8122 0.32959 17.3584 0.98877C18.9046 1.64795 20.2352 2.53499 21.3501 3.6499C22.465 4.76481 23.3521 6.09538 24.0112 7.6416C24.6704 9.18783 25 10.8073 25 12.5C25 14.1927 24.6704 15.8122 24.0112 17.3584C23.3521 18.9046 22.465 20.2352 21.3501 21.3501C20.2352 22.465 18.9046 23.3521 17.3584 24.0112C15.8122 24.6704 14.1927 25 12.5 25ZM18.2617 9.00879C18.5872 8.69954 18.75 8.31706 18.75 7.86133C18.75 7.4056 18.5913 7.01904 18.2739 6.70166C17.9565 6.38428 17.57 6.22559 17.1143 6.22559C16.6585 6.22559 16.276 6.38835 15.9668 6.71387L12.4756 10.1807L9.00879 6.71387C8.69954 6.38835 8.31706 6.22559 7.86133 6.22559C7.4056 6.22559 7.01904 6.38428 6.70166 6.70166C6.38428 7.01904 6.22559 7.4056 6.22559 7.86133C6.22559 8.31706 6.38835 8.69954 6.71387 9.00879L10.1807 12.5L6.71387 15.9668C6.38835 16.276 6.22559 16.6585 6.22559 17.1143C6.22559 17.57 6.38428 17.9565 6.70166 18.2739C7.01904 18.5913 7.4056 18.75 7.86133 18.75C8.31706 18.75 8.69954 18.5872 9.00879 18.2617L12.4756 14.7949L15.9668 18.2617C16.276 18.5872 16.6585 18.75 17.1143 18.75C17.57 18.75 17.9565 18.5913 18.2739 18.2739C18.5913 17.9565 18.75 17.57 18.75 17.1143C18.75 16.6585 18.5872 16.276 18.2617 15.9668L14.7949 12.5L18.2617 9.00879Z" fill="#00ADEF"/>
                    </svg>
                    </button>
                </div>
                <input type="hidden" name="idLearner" value="${apprenant.id}"/>
            </form>
        </div>
        </c:if>
    </div>

</main>

<%@include file="footer.jsp"%>
<script src="<c:url value="/js/listerMissionParApprenant.js"/>"></script>

</body>

</html>