<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/fragments/head.jsp" %>
</head>

<body class="home">
<header class="header">
    <c:choose>
        <c:when test="${user.getLogin()==null}"><%@include file="/WEB-INF/fragments/headerNoLog.jsp" %></c:when>
        <c:otherwise>
            <%@include file="/WEB-INF/fragments/headerLog.jsp" %>
        </c:otherwise>
    </c:choose>
</header>
<div id="carousel-home" data-ride="carousel" class="carousel slide carousel-fullscreen carousel-fade">
    <div role="listbox" class="carousel-inner">
        <div class="item active" style="background-image: url('../img/rankings.jpg');">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
                <p class="super-paragraph">Meet those who have already joined us!<br/>
                    See how they are doing and how their schools are doing!</p>
            </div>
        </div>
    </div>
</div>
<section class="section--padding-bottom-small">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="post">
                    <h2>Wizard ranking - top 10</h2>
                    <c:forEach items="${wizards}" var="wizard">
                    <div style="text-align: center;">
                        <h3>${wizard.name} (${wizard.university}) ---------- ${wizard.experience} points <br/></h3>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="post">
                    <h2>Universities ranking</h2> <br/>
                    <c:forEach items="${universities}" var="university">
                        <div style="text-align: center;">
                            <h3>${university.toString()} ---------- ${university.pointsInRaking} points <br/></h3>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<footer class="footer">
    <%@include file="/WEB-INF/fragments/footer.jsp" %>
</footer>
    <%@include file="/WEB-INF/fragments/script.jsp" %>
</body>
</html>