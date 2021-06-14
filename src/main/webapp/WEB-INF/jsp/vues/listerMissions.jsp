<%@ page import="com.epul.oeuvre.domains.ActionEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<body>
<link rel="stylesheet"  type="text/css" href="<c:url value="/css/listerMissionParApprenant.css"/>">
<link rel="stylesheet"  type="text/css" href="<c:url value="/css/listerMissions.css"/>">
<%@include file="navigation.jsp"%>
<main>
<h1>Liste des missions</h1>
<div class="missions-listing">
    <div class="previous-missions">
        <h2>Tableau des Missions</h2>
        <c:forEach items="${missions}" var="mission">
            ${actions = mission.actionMissionsById; ""}
            <div class="mission-container">
                <form method="post" >
                    <div class="mission-grid mission-grid-body">
                        <p>#${mission.id}</p>
                        <p class="mission-wording" id="wording-${mission.id}">${mission.wording}</p>
                        <input type="hidden" name="wording" value="${mission.wording}" class="mission-input" data-update="${mission.id}">
                        <input type="hidden" name="updateId" value="${mission.id}" />
                        <button type="button" name="updateId" value="${mission.id}" class="btn-svg update-icon" id="update-btn">
                            <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M12.5 25C19.4036 25 25 19.4036 25 12.5C25 5.59644 19.4036 0 12.5 0C5.59644 0 0 5.59644 0 12.5C0 19.4036 5.59644 25 12.5 25ZM20 7.67288C20 6.96399 19.7184 6.28413 19.2171 5.78286C18.7158 5.2816 18.0358 5 17.3269 5C16.6179 5 15.938 5.2816 15.4367 5.78286L6.49525 14.7242C6.28832 14.9311 6.13896 15.1883 6.06193 15.4705L5.01971 19.2924C4.99376 19.3877 4.99343 19.488 5.01875 19.5834C5.04407 19.6788 5.09414 19.7659 5.1639 19.8357C5.23366 19.9055 5.32063 19.9557 5.41601 19.9811C5.51139 20.0065 5.61179 20.0063 5.70705 19.9805L9.52927 18.9383C9.81153 18.8613 10.0688 18.712 10.2756 18.505L19.2171 9.56291C19.7184 9.06164 20 8.38178 20 7.67288ZM7.28719 15.5169L14.712 8.09123L16.9085 10.2875L9.48221 17.7117C9.41382 17.7809 9.32859 17.8311 9.23491 17.8573L6.35853 18.6417L7.143 15.7656C7.1686 15.6716 7.21831 15.5858 7.28719 15.5169ZM15.5039 7.29936L16.2286 6.57473C16.5209 6.28832 16.9144 6.12882 17.3236 6.13089C17.7329 6.13296 18.1247 6.29642 18.4141 6.58577C18.7035 6.87511 18.8669 7.26695 18.869 7.67613C18.8711 8.08532 18.7116 8.47879 18.4251 8.77104L17.7004 9.49568L15.5039 7.29936Z" fill="#FFC737"/>
                            </svg>
                        </button>
                        <a href="supprimerMission/${mission.id}" class="btn-svg delete-icon" onclick="event.stopPropagation()">
                            <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M12.5 25C10.8073 25 9.18783 24.6704 7.6416 24.0112C6.09538 23.3521 4.76481 22.465 3.6499 21.3501C2.53499 20.2352 1.64795 18.9046 0.98877 17.3584C0.32959 15.8122 0 14.1927 0 12.5C0 10.8073 0.32959 9.18783 0.98877 7.6416C1.64795 6.09538 2.53499 4.76481 3.6499 3.6499C4.76481 2.53499 6.09538 1.64795 7.6416 0.98877C9.18783 0.32959 10.8073 0 12.5 0C14.1927 0 15.8122 0.32959 17.3584 0.98877C18.9046 1.64795 20.2352 2.53499 21.3501 3.6499C22.465 4.76481 23.3521 6.09538 24.0112 7.6416C24.6704 9.18783 25 10.8073 25 12.5C25 14.1927 24.6704 15.8122 24.0112 17.3584C23.3521 18.9046 22.465 20.2352 21.3501 21.3501C20.2352 22.465 18.9046 23.3521 17.3584 24.0112C15.8122 24.6704 14.1927 25 12.5 25ZM18.2617 9.00879C18.5872 8.69954 18.75 8.31706 18.75 7.86133C18.75 7.4056 18.5913 7.01904 18.2739 6.70166C17.9565 6.38428 17.57 6.22559 17.1143 6.22559C16.6585 6.22559 16.276 6.38835 15.9668 6.71387L12.4756 10.1807L9.00879 6.71387C8.69954 6.38835 8.31706 6.22559 7.86133 6.22559C7.4056 6.22559 7.01904 6.38428 6.70166 6.70166C6.38428 7.01904 6.22559 7.4056 6.22559 7.86133C6.22559 8.31706 6.38835 8.69954 6.71387 9.00879L10.1807 12.5L6.71387 15.9668C6.38835 16.276 6.22559 16.6585 6.22559 17.1143C6.22559 17.57 6.38428 17.9565 6.70166 18.2739C7.01904 18.5913 7.4056 18.75 7.86133 18.75C8.31706 18.75 8.69954 18.5872 9.00879 18.2617L12.4756 14.7949L15.9668 18.2617C16.276 18.5872 16.6585 18.75 17.1143 18.75C17.57 18.75 17.9565 18.5913 18.2739 18.2739C18.5913 17.9565 18.75 17.57 18.75 17.1143C18.75 16.6585 18.5872 16.276 18.2617 15.9668L14.7949 12.5L18.2617 9.00879Z" fill="#FF0000"/>
                            </svg>
                        </a>
                    </div>
                </form>
                <div class="action-container-wrapper">
                    <div class="action-container">
                        <div class="action-grid action-grid-header">
                            <p></p>
                            <p>Action</p>
                            <p class="text-center">Score Min</p>
                            <p class="text-center">Action Pré.</p>
                        </div>
                        <c:forEach items="${actions}" var="actionMission">
                            ${action = actionMission.actionByFkAction ; ""}
                            <div class="action-grid action-grid-body">
                                <p class="action-descritpion">#${action.id}</p>
                                <p class="action-descritpion">${action.wording}</p>
                                <p class="text-center">${action.scoreMinimum}</p>
                                <p class="text-center">${action.fkAction != null ? action.fkAction : ''}</p>
                                <button type="submit" name="removeAction" value="" class="btn-svg delete-icon">
                                    <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M12.5 25C10.8073 25 9.18783 24.6704 7.6416 24.0112C6.09538 23.3521 4.76481 22.465 3.6499 21.3501C2.53499 20.2352 1.64795 18.9046 0.98877 17.3584C0.32959 15.8122 0 14.1927 0 12.5C0 10.8073 0.32959 9.18783 0.98877 7.6416C1.64795 6.09538 2.53499 4.76481 3.6499 3.6499C4.76481 2.53499 6.09538 1.64795 7.6416 0.98877C9.18783 0.32959 10.8073 0 12.5 0C14.1927 0 15.8122 0.32959 17.3584 0.98877C18.9046 1.64795 20.2352 2.53499 21.3501 3.6499C22.465 4.76481 23.3521 6.09538 24.0112 7.6416C24.6704 9.18783 25 10.8073 25 12.5C25 14.1927 24.6704 15.8122 24.0112 17.3584C23.3521 18.9046 22.465 20.2352 21.3501 21.3501C20.2352 22.465 18.9046 23.3521 17.3584 24.0112C15.8122 24.6704 14.1927 25 12.5 25ZM18.2617 9.00879C18.5872 8.69954 18.75 8.31706 18.75 7.86133C18.75 7.4056 18.5913 7.01904 18.2739 6.70166C17.9565 6.38428 17.57 6.22559 17.1143 6.22559C16.6585 6.22559 16.276 6.38835 15.9668 6.71387L12.4756 10.1807L9.00879 6.71387C8.69954 6.38835 8.31706 6.22559 7.86133 6.22559C7.4056 6.22559 7.01904 6.38428 6.70166 6.70166C6.38428 7.01904 6.22559 7.4056 6.22559 7.86133C6.22559 8.31706 6.38835 8.69954 6.71387 9.00879L10.1807 12.5L6.71387 15.9668C6.38835 16.276 6.22559 16.6585 6.22559 17.1143C6.22559 17.57 6.38428 17.9565 6.70166 18.2739C7.01904 18.5913 7.4056 18.75 7.86133 18.75C8.31706 18.75 8.69954 18.5872 9.00879 18.2617L12.4756 14.7949L15.9668 18.2617C16.276 18.5872 16.6585 18.75 17.1143 18.75C17.57 18.75 17.9565 18.5913 18.2739 18.2739C18.5913 17.9565 18.75 17.57 18.75 17.1143C18.75 16.6585 18.5872 16.276 18.2617 15.9668L14.7949 12.5L18.2617 9.00879Z" fill="#FF0000"/>
                                    </svg>
                                </button>
                            </div>
                        </c:forEach>
                        <form method="post">
                            <div class="add-action">
                                <%
                                    List<ActionEntity> allActions = (List)request.getAttribute("allActions");
                                    List<ActionEntity> currentActions = (List)pageContext.getAttribute("actions");
                                    ArrayList<ActionEntity> availableActions = new ArrayList<>(allActions);
                                    ArrayList<Long> currentActionsIds = new ArrayList<>();
     /*                               for(ActionEntity action: currentActions) currentActionsIds.add(action.getId());
                                    for(ActionEntity action: availableActions){
                                        if(currentActionsIds.contains(action.getId())) availableActions.remove(action);
                                    }*/
                                    pageContext.setAttribute("availableActions", availableActions);
                                %>
                                <h3>Ajouter une action :</h3>
                                <div class="action-add-grid">
                                    <p data-select="${mission.id}">#${allActions[0].id}</p>
                                    <div class="mission-select-wrapper">
                                        <select name="idAction" class="mission-select" id="mission-select-${mission.id}" data-mission="${mission.id}">
                                            <c:forEach items="${availableActions}" var="action">
                                                <option value="${action.id}">${action.wording}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <p></p>
                                    <button type="submit" name="addAction" value="${mission.id}" class="btn-svg btn-add-mission">
                                        <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M12.5 25C10.8073 25 9.18783 24.6704 7.6416 24.0112C6.09538 23.3521 4.76481 22.465 3.6499 21.3501C2.53499 20.2352 1.64795 18.9046 0.98877 17.3584C0.32959 15.8122 0 14.1927 0 12.5C0 10.8073 0.32959 9.18783 0.98877 7.6416C1.64795 6.09538 2.53499 4.76481 3.6499 3.6499C4.76481 2.53499 6.09538 1.64795 7.6416 0.98877C9.18783 0.32959 10.8073 0 12.5 0C14.1927 0 15.8122 0.32959 17.3584 0.98877C18.9046 1.64795 20.2352 2.53499 21.3501 3.6499C22.465 4.76481 23.3521 6.09538 24.0112 7.6416C24.6704 9.18783 25 10.8073 25 12.5C25 14.1927 24.6704 15.8122 24.0112 17.3584C23.3521 18.9046 22.465 20.2352 21.3501 21.3501C20.2352 22.465 18.9046 23.3521 17.3584 24.0112C15.8122 24.6704 14.1927 25 12.5 25ZM18.2617 9.00879C18.5872 8.69954 18.75 8.31706 18.75 7.86133C18.75 7.4056 18.5913 7.01904 18.2739 6.70166C17.9565 6.38428 17.57 6.22559 17.1143 6.22559C16.6585 6.22559 16.276 6.38835 15.9668 6.71387L12.4756 10.1807L9.00879 6.71387C8.69954 6.38835 8.31706 6.22559 7.86133 6.22559C7.4056 6.22559 7.01904 6.38428 6.70166 6.70166C6.38428 7.01904 6.22559 7.4056 6.22559 7.86133C6.22559 8.31706 6.38835 8.69954 6.71387 9.00879L10.1807 12.5L6.71387 15.9668C6.38835 16.276 6.22559 16.6585 6.22559 17.1143C6.22559 17.57 6.38428 17.9565 6.70166 18.2739C7.01904 18.5913 7.4056 18.75 7.86133 18.75C8.31706 18.75 8.69954 18.5872 9.00879 18.2617L12.4756 14.7949L15.9668 18.2617C16.276 18.5872 16.6585 18.75 17.1143 18.75C17.57 18.75 17.9565 18.5913 18.2739 18.2739C18.5913 17.9565 18.75 17.57 18.75 17.1143C18.75 16.6585 18.5872 16.276 18.2617 15.9668L14.7949 12.5L18.2617 9.00879Z" fill="#00ADEF"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${updateError != null}">
            <p class="text-danger">${updateError}</p>
        </c:if>
    </div>
    <div class="new-mission">
        <h2>Ajouter une mission</h2>
        <div class="mission-container new-mission-container">
            <form method="post" action="/mission/ajouterUneMission">
                <div class="mission-grid mission-grid-body">
                    <p>#</p>
                    <div class="input-field">
                        <label for="new-mission"><span class="animated-label">Nom</span>&nbsp</label>
                        <input type="text" name="wording" class="mission-add-input" id="new-mission"/>
                    </div>
                    <p></p>
                    <button type="submit" class="btn-svg btn-add-mission">
                        <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12.5 25C10.8073 25 9.18783 24.6704 7.6416 24.0112C6.09538 23.3521 4.76481 22.465 3.6499 21.3501C2.53499 20.2352 1.64795 18.9046 0.98877 17.3584C0.32959 15.8122 0 14.1927 0 12.5C0 10.8073 0.32959 9.18783 0.98877 7.6416C1.64795 6.09538 2.53499 4.76481 3.6499 3.6499C4.76481 2.53499 6.09538 1.64795 7.6416 0.98877C9.18783 0.32959 10.8073 0 12.5 0C14.1927 0 15.8122 0.32959 17.3584 0.98877C18.9046 1.64795 20.2352 2.53499 21.3501 3.6499C22.465 4.76481 23.3521 6.09538 24.0112 7.6416C24.6704 9.18783 25 10.8073 25 12.5C25 14.1927 24.6704 15.8122 24.0112 17.3584C23.3521 18.9046 22.465 20.2352 21.3501 21.3501C20.2352 22.465 18.9046 23.3521 17.3584 24.0112C15.8122 24.6704 14.1927 25 12.5 25ZM18.2617 9.00879C18.5872 8.69954 18.75 8.31706 18.75 7.86133C18.75 7.4056 18.5913 7.01904 18.2739 6.70166C17.9565 6.38428 17.57 6.22559 17.1143 6.22559C16.6585 6.22559 16.276 6.38835 15.9668 6.71387L12.4756 10.1807L9.00879 6.71387C8.69954 6.38835 8.31706 6.22559 7.86133 6.22559C7.4056 6.22559 7.01904 6.38428 6.70166 6.70166C6.38428 7.01904 6.22559 7.4056 6.22559 7.86133C6.22559 8.31706 6.38835 8.69954 6.71387 9.00879L10.1807 12.5L6.71387 15.9668C6.38835 16.276 6.22559 16.6585 6.22559 17.1143C6.22559 17.57 6.38428 17.9565 6.70166 18.2739C7.01904 18.5913 7.4056 18.75 7.86133 18.75C8.31706 18.75 8.69954 18.5872 9.00879 18.2617L12.4756 14.7949L15.9668 18.2617C16.276 18.5872 16.6585 18.75 17.1143 18.75C17.57 18.75 17.9565 18.5913 18.2739 18.2739C18.5913 17.9565 18.75 17.57 18.75 17.1143C18.75 16.6585 18.5872 16.276 18.2617 15.9668L14.7949 12.5L18.2617 9.00879Z" fill="#00ADEF"/>
                        </svg>
                    </button>
                </div>
            </form>
        </div>
        <c:if test="${addError != null}">
            <p class="text-danger">${addError}</p>
        </c:if>
    </div>
</div>
<%@include file="footer.jsp"%>
<script src="<c:url value="/js/listerMissions.js"/>"></script>
</main>

</body>

</html>