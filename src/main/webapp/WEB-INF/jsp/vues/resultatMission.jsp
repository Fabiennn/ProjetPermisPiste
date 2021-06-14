<%--
  Created by IntelliJ IDEA.
  User: loko6
  Date: 05/06/2021
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" >
    <jsp:param name="title" value="${title}"/>
</jsp:include>
<body>
<%@include file="navigation.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/resultatMission.css" />">
<main>
    <h1>Résultats</h1>
    <div class="main-container">
        <div class="container-announcement-wrapper">
            <div class="container-announcement">
                <div class="container-primary chart-container"><div id="chart"></div></div>
                ${isSuccess = nbActionSuccess == fn:length(actions); ''}
                <p class="announcement ${isSuccess ? "text-primary" : "text-danger"}">${isSuccess ? "Succès" : "Échec"}</p>
            </div>
        </div>
        <div class="details">
            <h2>Détails</h2>
            <p>Mission : <span class="mission-title">${inscription.missionByFkMission.wording}</span></p>
            <p>Date : <span class="mission-date">${inscription.date}</span></p>
                <c:forEach items="${actions}" var="inscriptionAction">
                    ${action = inscriptionAction.actionByFkAction; ''}
                    ${isActionSucceed = inscriptionAction.sort == 1; ''}
                <div class="container-${isActionSucceed ? "primary" : "danger"} action-box">
                    <div class="action-headline">
                        <p class="action-wording">${action.wording}</p>
                        <p class="action-result ${isActionSucceed ? "text-primary": "text-danger"}">${isActionSucceed ? "Réussie" : "Manquée"}</p>
                    </div>
                    <div class="action-detail-wrapper">
                        <div class="action-detail">
                            <p>Score : <span class="action-detail-score">${inscriptionAction.score}</span></p>
                            <p>Score  Minimum: <span class="action-detail-scoremin">${action.scoreMinimum}</span></p>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="<c:url value="/js/resultatMission.js"/>"></script>
<script>
    var options = {
        series: [${nbActionSuccess}, ${fn:length(actions)-nbActionSuccess}],
        colors: ["var(--primary)", "#ff0000"],
        labels: ["Réussites", "Manquées"],
        chart: {
            type: 'donut',
            width: "100%",
        },
        title: {
            text: "Réussite des actions",
            align: 'center',
            margin: 10,
            offsetX: 0,
            offsetY: -5,
            floating: false,
            style: {
                fontSize:  '20px',
                fontWeight:  'bold',
                fontFamily:  "Roboto",
                color:  'var(--primary)'
            },
        },
        dataLabels: {
            enabled: false
        },
        legend: {
            show: false
        },
        plotOptions: {
            pie: {
                donut: {
                    labels: {
                        show: true,
                        name: {
                            show: true,
                            offsetY: "15px"
                        },
                        total: {
                            showAlways: true,
                            show: true,
                            fontSize: "35px",
                            fontWeight: 700,
                            fontFamily: "Roboto",
                            label: "${nbActionSuccess}/${fn:length(actions)}",
                        },
                        value:{
                            show: false,
                        }
                    }
                }
            }
        },
    };

    var chart = new ApexCharts(document.querySelector("#chart"), options);

    chart.render();

    gsap.fromTo("#SvgjsText1017", {opacity:0, y:-10}, {opacity: 1, y:0, duration: 0.5, delay:1});

</script>
</body>
</html>
