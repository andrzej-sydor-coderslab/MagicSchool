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
    <%@include file="/WEB-INF/fragments/headerLog.jsp" %>
</header>

<div id="carousel-home" data-ride="carousel" class="carousel slide carousel-fullscreen carousel-fade">
    <div role="listbox" class="carousel-inner">
        <div class="item active" style="background-image: url('../img/university.jpg');">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
                <p class="super-paragraph">${university.name}</p>
            </div>
        </div>
    </div>
</div>
<section class="section--padding-bottom-small">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="post">
                    <c:choose>
                        <c:when  test="${university.id==1}">
                            <h2>Welcome to ${university.toStringUniversity()}.</h2> <br/>
                            <br/>
                            <h4>${university.description}</h4> <br/>
                            <br/>
                            <h4>We currently ${university.pointsInRaking} have points in the ranking.</h4>
                        </c:when>
                        <c:when test="${university.id==2}">
                            <h2>Welcome to ${university.toStringUniversity()}.</h2> <br/>
                            <br/>
                            <h4>${university.description}</h4> <br/>
                            <br/>
                            <h4>We currently ${university.pointsInRaking} have points in the ranking.</h4>
                        </c:when>
                        <c:when test="${university.id==3}">
                            <h2>Welcome to ${university.toStringUniversity()}.</h2> <br/>
                            <br/>
                            <h4>${university.description}</h4> <br/>
                            <br/>
                            <h4>We currently ${university.pointsInRaking} have points in the ranking.</h4>
                        </c:when>
                        <c:otherwise>
                            <h2>Welcome to ${university.toStringUniversity()}.</h2> <br/>
                            <br/>
                            <h4>${university.description}</h4> <br/>
                            <br/>
                            <h4>We currently ${university.pointsInRaking} have points in the ranking.</h4>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="post">
                    <h2>University chat</h2> <br/>
                    <p> <a href="/app/university/chat" class="btn btn-ghost">Join the university chat</a></p>
                    <br/>
                    <br/>
                    <h2>Creating a spell</h2> <br/>
                    <p> <a href="/app/spell/create" class="btn btn-ghost">Create spell</a></p>
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