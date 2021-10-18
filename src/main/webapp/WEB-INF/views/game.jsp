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
        <div class="item active" style="background-image: url('../img/game.jpg');">
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
            <h2>Your task is to answer ten questions. You must answer at least five questions to get experience points. <br/>
                You need experience points to raise your level, and are also added to the rankings - wizards and universities.</h2>
        </div>
        <div class="container">
            <div id="loader"></div>
            <div id="game" class="justify-center flex-column hidden">
                <div id="header">
                    <div id="header-item">
                        <p id="progressText" class="header-prefix">Question</p>
                        <div id="progressBar">
                            <div id="progressBarFull"></div>
                        </div>
                    </div>
                    <div id="header-item">
                        <p class="header-prefix">Score</p>
                        <h1 class="header-main-text" id="score">0</h1>
                    </div>
                </div>
                <h2 id="question"></h2>
                <div class="choice-container">
                    <p class="choice-prefix">A</p>
                    <p class="choice-text" data-number="1"></p>
                </div>
                <div class="choice-container">
                    <p class="choice-prefix">B</p>
                    <p class="choice-text" data-number="2"></p>
                </div>
                <div class="choice-container">
                    <p class="choice-prefix">C</p>
                    <p class="choice-text" data-number="3"></p>
                </div>
                <div class="choice-container">
                    <p class="choice-prefix">D</p>
                    <p class="choice-text" data-number="4"></p>
                </div>
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