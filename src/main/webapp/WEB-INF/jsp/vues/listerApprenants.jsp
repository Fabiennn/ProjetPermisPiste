<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<body>
<link rel="stylesheet"  type="text/css" href="<c:url value="/css/listerMissionParApprenant.css"/>">
<link rel="stylesheet"  type="text/css" href="<c:url value="/css/listerApprenant.css"/>">
<%@include file="navigation.jsp"%>

<main>
    <h1>${title}</h1>
    <div class="missions-listing">
        <c:forEach items="${mesApprenants}" var="apprenant">
            <div class="mission-container">
                <div class="mission-grid mission-grid-body">
                    <p>#${apprenant.id}</p>
                    <p class="detail">${apprenant.surname}</p>
                    <p class="detail">${apprenant.forname}</p>
                    <c:if test="${role == 'admin'}">
                    <a href="/apprenant/supprimerApprenant/${apprenant.id}">
                        <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12.5 25C10.8073 25 9.18783 24.6704 7.6416 24.0112C6.09538 23.3521 4.76481 22.465 3.6499 21.3501C2.53499 20.2352 1.64795 18.9046 0.98877 17.3584C0.32959 15.8122 0 14.1927 0 12.5C0 10.8073 0.32959 9.18783 0.98877 7.6416C1.64795 6.09538 2.53499 4.76481 3.6499 3.6499C4.76481 2.53499 6.09538 1.64795 7.6416 0.98877C9.18783 0.32959 10.8073 0 12.5 0C14.1927 0 15.8122 0.32959 17.3584 0.98877C18.9046 1.64795 20.2352 2.53499 21.3501 3.6499C22.465 4.76481 23.3521 6.09538 24.0112 7.6416C24.6704 9.18783 25 10.8073 25 12.5C25 14.1927 24.6704 15.8122 24.0112 17.3584C23.3521 18.9046 22.465 20.2352 21.3501 21.3501C20.2352 22.465 18.9046 23.3521 17.3584 24.0112C15.8122 24.6704 14.1927 25 12.5 25ZM18.2617 9.00879C18.5872 8.69954 18.75 8.31706 18.75 7.86133C18.75 7.4056 18.5913 7.01904 18.2739 6.70166C17.9565 6.38428 17.57 6.22559 17.1143 6.22559C16.6585 6.22559 16.276 6.38835 15.9668 6.71387L12.4756 10.1807L9.00879 6.71387C8.69954 6.38835 8.31706 6.22559 7.86133 6.22559C7.4056 6.22559 7.01904 6.38428 6.70166 6.70166C6.38428 7.01904 6.22559 7.4056 6.22559 7.86133C6.22559 8.31706 6.38835 8.69954 6.71387 9.00879L10.1807 12.5L6.71387 15.9668C6.38835 16.276 6.22559 16.6585 6.22559 17.1143C6.22559 17.57 6.38428 17.9565 6.70166 18.2739C7.01904 18.5913 7.4056 18.75 7.86133 18.75C8.31706 18.75 8.69954 18.5872 9.00879 18.2617L12.4756 14.7949L15.9668 18.2617C16.276 18.5872 16.6585 18.75 17.1143 18.75C17.57 18.75 17.9565 18.5913 18.2739 18.2739C18.5913 17.9565 18.75 17.57 18.75 17.1143C18.75 16.6585 18.5872 16.276 18.2617 15.9668L14.7949 12.5L18.2617 9.00879Z" fill="#FF0000"/>
                        </svg>
                    </a>
                    </c:if>
                </div>
                <div class="action-container-wrapper">
                    <div class="action-container">
                        <div class="action-grid action-grid-header">
                            <p>Email</p>
                            <p class="text-center">Missions</p>
                            <c:if test="${role == 'admin'}">
                            <p class="text-center">Modifier</p>
                            </c:if>
                        </div>
                        <div class="action-grid action-grid-body">
                            <p>${apprenant.email}</p>
                            <a href="/mission/consulterMissionApprenant/${apprenant.id}">
                                <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle cx="12.5" cy="12.5" r="12.5" fill="#00ADEF"/>
                                    <path d="M21.8698 11.962C22.3438 12.582 22.3438 13.419 21.8698 14.038C20.3768 15.987 16.7948 20 12.6128 20C8.4308 20 4.8488 15.987 3.3558 14.038C3.12519 13.7411 3 13.3759 3 13C3 12.6241 3.12519 12.2589 3.3558 11.962C4.8488 10.013 8.4308 6 12.6128 6C16.7948 6 20.3768 10.013 21.8698 11.962Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M12.6128 16C14.2697 16 15.6128 14.6569 15.6128 13C15.6128 11.3431 14.2697 10 12.6128 10C10.956 10 9.6128 11.3431 9.6128 13C9.6128 14.6569 10.956 16 12.6128 16Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </a>
                            <c:if test="${role == 'admin'}">
                            <a href="/apprenant/modifierApprenant/${apprenant.id}">
                                <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.5 25C19.4036 25 25 19.4036 25 12.5C25 5.59644 19.4036 0 12.5 0C5.59644 0 0 5.59644 0 12.5C0 19.4036 5.59644 25 12.5 25ZM20 7.67288C20 6.96399 19.7184 6.28413 19.2171 5.78286C18.7158 5.2816 18.0358 5 17.3269 5C16.6179 5 15.938 5.2816 15.4367 5.78286L6.49525 14.7242C6.28832 14.9311 6.13896 15.1883 6.06193 15.4705L5.01971 19.2924C4.99376 19.3877 4.99343 19.488 5.01875 19.5834C5.04407 19.6788 5.09414 19.7659 5.1639 19.8357C5.23366 19.9055 5.32063 19.9557 5.41601 19.9811C5.51139 20.0065 5.61179 20.0063 5.70705 19.9805L9.52927 18.9383C9.81153 18.8613 10.0688 18.712 10.2756 18.505L19.2171 9.56291C19.7184 9.06164 20 8.38178 20 7.67288ZM7.28719 15.5169L14.712 8.09123L16.9085 10.2875L9.48221 17.7117C9.41382 17.7809 9.32859 17.8311 9.23491 17.8573L6.35853 18.6417L7.143 15.7656C7.1686 15.6716 7.21831 15.5858 7.28719 15.5169ZM15.5039 7.29936L16.2286 6.57473C16.5209 6.28832 16.9144 6.12882 17.3236 6.13089C17.7329 6.13296 18.1247 6.29642 18.4141 6.58577C18.7035 6.87511 18.8669 7.26695 18.869 7.67613C18.8711 8.08532 18.7116 8.47879 18.4251 8.77104L17.7004 9.49568L15.5039 7.29936Z" fill="#FFC737"/>
                                </svg>
                            </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    <c:if test="${apError != null}">
        <p class="text-danger">${apError}</p>
    </c:if>
    <c:if test="${role == 'admin'}">
        <a href="/apprenant/ajouterApprenant" class="btn-primary btn-link">Ajouter un Apprenant</a>
    </c:if>
    </div>
<%@include file="footer.jsp"%>
</main>
<script src="<c:url value="/js/listerMissionParApprenant.js"/>"></script>
</body>

</html>