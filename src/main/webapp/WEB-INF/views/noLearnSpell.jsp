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
        <div class="item active" style="background-image: url('../../img/impossibleCreateSpell.jpg');">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
                <p class="super-paragraph">${university.name}</p>
            </div>
        </div>
    </div>
</div>
<section class="background-gray-lightest negative-margin">
    <div class="container">
        <h2>Your level does not allow you to learn a new spell. Gain experience by participating in the game.</h2>
        <br/>
        <br/>
        <button class="btn btn-ghost"><a href="/app/university">Back to university</a></button>
        <br/>
        <br/>
        <br/>
        <button class="btn btn-ghost"><a href="/app/game">Get into the game</a></button>
    </div>
</section>
<footer class="footer">
    <%@include file="/WEB-INF/fragments/footer.jsp" %>
</footer>
    <%@include file="/WEB-INF/fragments/script.jsp" %>
</body>
</html>