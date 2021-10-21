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
        <h1>Magic School is a simple, fun game and a great opportunity to expand your knowledge.</h1>
        <p class="lead">1. By creating an account you have the option of creating your own wizard who will be your avatar in the game.</p>
        <p class="lead">2. Your wizard can be personalized by you by choosing, among others race, gender, origin, university, and spells you already know.</p>
        <p class="lead">3. By joining a university you get the opportunity to participate in mini-games to increase your school's reputation and also to increase your magic level.</p>
        <p class="lead">4. By increasing your level you gain the opportunity to learn more spells, you will also climb the ranking of the best wizards in the land!
                        For every fifty experience points you will level up. From the fourth level, you learn a new random spell, and you can also create new spells.</p>
        <p class="lead">5. At universities, you and your friends can form brotherhoods and communicate with each other.</p>
        <p> <a href="/login" class="btn btn-ghost">Log in and join us today!</a></p>
    </div>
</section>
<section class="section--padding-bottom-small">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="post">
                    <div class="image"><img src="../img/fightAboutGame.jpg" alt="" class="img-responsive"></a></div>
                    <h3>See how the players are doing today!</h3>
                    <p class="read-more"><a href="/rankings" class="btn btn-ghost">Wizard ranking</a></p>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="post">
                    <div class="image"><img src="../img/fireContact.jpg" alt="" class="img-responsive"></a></div>
                    <h3>Behind the scenes of the game</h3>
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