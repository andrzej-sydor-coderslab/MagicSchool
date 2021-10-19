<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/fragments/head.jsp" %>
</head>

<body class="home" onload="connect()">

<header class="header">
    <%@include file="/WEB-INF/fragments/headerLog.jsp" %>
</header>

<div id="carousel-home" data-ride="carousel" class="carousel slide carousel-fullscreen carousel-fade">
    <div role="listbox" class="carousel-inner">
        <div class="item active" style="background-image: url('../../university.jpg');">
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
        <div class="hero-unit">
            <div class="row-fluid">
                <div class="offset4 span4">
                    <legend>University chat</legend>
                    <div class="control-group">
                        <div class="controls">
                            <label>User:</label> <br/>
                            <input class="form-control" id="user" type="text" value="${wizard.name}"/><br>
                        </div>
                    </div>
                    <div class="control-group">
                        <label>You message:</label>
                        <input class="form-control" id="messageToSend" type="text"/><br>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button class="btn btn-ghost" onclick="sendMessage()">Send</button>
                            <br/>
                            <br/>
                            <br/>
                            <button class="btn btn-ghost"><a href="/app/university">Back to university</a></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div id="reponse"></div>
    </div>
</section>
<footer class="footer">
    <%@include file="/WEB-INF/fragments/footer.jsp" %>
</footer>
    <%@include file="/WEB-INF/fragments/script.jsp" %>
    <script type="text/javascript" src="../../chat.js"></script>
    <script type="text/javascript" src="../../stomp.js"></script>
</body>
</html>