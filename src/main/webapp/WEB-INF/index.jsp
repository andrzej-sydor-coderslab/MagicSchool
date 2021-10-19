<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="item active" style="background-image: url('../img/portal1.jpg');">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
                <p class="super-paragraph">Hello, young adept of magic. You just found your place on earth. <a href="/login">Join us today</a>!</p>
            </div>
        </div>
    </div>
</div>
<section class="background-gray-lightest negative-margin">
    <div class="container">
        <h1>Develop your knowledge and magic today. Join one of four universities!</h1>
        <p class="lead">There are four schools of magic in our land - fire, water, air and earth. Young magicians in the university community stand hand in hand to learn, develop, learn new spells and take their school to the top!</p>
        <p> <a href="/rankings" class="btn btn-ghost">Explore the universities</a></p>
    </div>
</section>
<section class="section--padding-bottom-small">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="post">
                    <div class="image"><a href="text.html"><img src="../img/deer.jpg" alt="" class="img-responsive"></a></div>
                    <h3><a href="text.html">Discover the real world of magic</a></h3>
                    <p class="post__intro">The world of magic is an extraordinary world. It is the same with knowledge and science - they are also amazing! Grow today!.</p>
                    <p class="read-more"><a href="/aboutGame" class="btn btn-ghost">About game</a></p>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="post">
                    <div class="image"><a href="text.html"><img src="../img/fireContact.jpg" alt="" class="img-responsive"></a></div>
                    <h3><a href="text.html">Behind the scenes of the game</a></h3>
                    <p class="post__intro">Meet the author, versions and the backstage of working on the project.</p>
                    <p class="read-more"><a href="/contact" class="btn btn-ghost">Contact</a></p>
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