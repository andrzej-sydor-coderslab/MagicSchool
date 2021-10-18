<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        <div class="item active" style="background-image: url('../../endGame.jpg');">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
                <p class="super-paragraph">Time to start the game!</p>
            </div>
        </div>
    </div>
</div>
<center>
    <div class="modal-content">
        <div class="modal-header">
            <h2 id="Login" class="modal-title">Wizard - ${wizard.getName()}</h2>
            <h2>Your task is to answer ten questions. You will receive one experience point for each correct answer. <br/>
                You need experience points to raise your level, and are also added to the rankings - wizards and universities.</h2>
        </div>
        <div class="container">
            <div id="end" class="flex-center flex-column">
                <h1 id="finalScore"></h1>
                <form:form method="post" modelAttribute="wizard">
                    <h3>Congratulations! You did it!</h3>
                <button type="submit" class="btn" href="/app/wizardPanel">Save Points</button>
                </form:form>
                <a class="btn" href="/app/game">Play Again</a>
                <a class="btn" href="/index">Go Home</a>
            </div>
        </div>
    </div>
</center>
<br/>
<br/>
<br/>
<footer class="footer">
    <%@include file="/WEB-INF/fragments/footer.jsp" %>
</footer>
    <%@include file="/WEB-INF/fragments/script.jsp" %>
</body>
</html>