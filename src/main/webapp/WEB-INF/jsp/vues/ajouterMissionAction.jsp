<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<body>
<%@include file="navigation.jsp"%>
<main>
    <div class="jumbotron text-center">
        <H1> Ajout d'une mission </H1>
    </div>
    <form method="post" action="/action/inscrireMissionAction">
        <div class="form-group">
            <select name="idMission">
                <c:forEach items="${allMissions}" var="mission">
                    <option value="${mission.id}">${mission.wording}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="idAction" value="${action.id}"/>
            <button type="submit" class="btn btn-default btn-primary"><span class="glyphicon glyphicon-ok"></span>
                Ajouter la mission
            </button>
        </div>
    </form>
    <%@include file="footer.jsp"%>
</main>

</body>

</html>