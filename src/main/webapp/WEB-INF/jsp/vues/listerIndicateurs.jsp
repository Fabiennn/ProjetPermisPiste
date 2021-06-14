<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<body>
<link rel="stylesheet"  type="text/css" href="<c:url value="/css/listerMissionParApprenant.css"/>">
<link rel="stylesheet"  type="text/css" href="<c:url value="/css/listerIndicateur.css"/>">
<%@include file="navigation.jsp"%>

<main>
    <h1>Liste des indicateurs</h1>
    <div class="missions-listing">
        <c:forEach items="${mesIndicateurs}" var="indicateur">
            <div class="mission-container">
                <div class="mission-grid mission-grid-body">
                    <p>#${indicateur.id}</p>
                    <p class="detail">${indicateur.wording}</p>
                    <p>Coché : <span class="detail">${indicateur.valueIfCheck}</span></p>
                    <p>Non Coché : <span class="detail">${indicateur.valueIfUnCheck}</span></p>
                    <a href="/action/getAction/${indicateur.id}">
                       <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="12.5" cy="12.5" r="12.5" fill="#00ADEF"/>
                            <path d="M21.8698 11.962C22.3438 12.582 22.3438 13.419 21.8698 14.038C20.3768 15.987 16.7948 20 12.6128 20C8.4308 20 4.8488 15.987 3.3558 14.038C3.12519 13.7411 3 13.3759 3 13C3 12.6241 3.12519 12.2589 3.3558 11.962C4.8488 10.013 8.4308 6 12.6128 6C16.7948 6 20.3768 10.013 21.8698 11.962Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M12.6128 16C14.2697 16 15.6128 14.6569 15.6128 13C15.6128 11.3431 14.2697 10 12.6128 10C10.956 10 9.6128 11.3431 9.6128 13C9.6128 14.6569 10.956 16 12.6128 16Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                       </svg>
                    </a>
                </div>
            </div>
        </c:forEach>

    </div>
</main>
<script src="<c:url value="/js/listerMissionParApprenant.js"/>"></script>
<%@include file="footer.jsp"%>
</body>
</html>