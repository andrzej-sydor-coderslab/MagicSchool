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
                <p class="super-paragraph">Hello, young adept of magic. You just found your place on earth.
                    <c:choose>
                        <c:when test="${user.getLogin()==null}"><a href="/login">Join us today</a>!</p></c:when>
                        <c:otherwise>
                            </p>
                        </c:otherwise>
                    </c:choose>
            </div>
        </div>
    </div>
</div>
<section class="background-gray-lightest negative-margin">
    <div class="container">
        <h1>Develop your knowledge and magic today!</h1>
        <p class="lead">There are four schools of magic in our land - fire, water, air and earth. Young magicians in the university community stand hand in hand to learn, develop, learn new spells and take their school to the top!</p> <br/>
        <p class="lead">See how other wizards are doing! Who knows, maybe you will find yourself among the best.</p>
        <p> <a href="/rankings" class="btn btn-ghost">Show rankings</a></p>
    </div>
</section>
<section class="section--padding-bottom-small">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="post">
                    <div class="image"><img src="../img/deer.jpg" alt="" class="img-responsive"></a></div>
                    <h3>Discover the real world of magic</h3>
                    <p>The world of magic is an extraordinary world. It is the same with knowledge and science - they are also amazing! Grow today!.</p><br/>
                    <p><a href="/aboutGame" class="btn btn-ghost">About game</a></p>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="post">
                    <div class="image"><img src="../img/fireContact.jpg" alt="" class="img-responsive"></a></div>
                    <h3>Behind the scenes of the game</h3>
                    <p>Meet the author, version, and behind the scenes of working on the project. The current version of the project is 1.0.</p><br/>
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