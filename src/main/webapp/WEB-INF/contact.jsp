<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/fragments/head.jsp" %>
</head>

<body class="home">
<header class="header">
    <%@include file="/WEB-INF/fragments/headerNoLog.jsp" %>
</header>

<div id="carousel-home" data-ride="carousel" class="carousel slide carousel-fullscreen carousel-fade">
    <div role="listbox" class="carousel-inner">
        <div class="item active" style="background-image: url('../img/fireContact.jpg');">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
            </div>
        </div>
    </div>
</div>
<section class="background-gray-lightest negative-margin">
    <div class="container">
        <h1>This project is the end of my education at the IT school - Coders Lab.</h1>
        <p class="lead">It aims to show my mentor that the time spent at school was not idle time and I learned about all the technologies that we covered in the course: <br/>
        - Java <br/>
        - SQL <br/>
        - Java Script <br/>
        - Spring, Spring Boot <br/>
        - Hibernate <br/>
        - CSS <br/>
        - HTML <br/>
        - Agile methodology, Scrum <br/>
        <br/>
        In order to create this project as it is, I used free materials: <br/>
        - <a href="https://bootstrapious.com">Bootstrapious</a><br/>
        - <a href="https://opentdb.com">Open Tribia Database</a><br/>
        - <a href="https://pl.freepik.com/upklyak">Freepik user - Upklyak</a><br/>
        - <a href="https://pl.freepik.com/ddraw">Freepik user - Ddraw</a><br/>
        - <a href="https://pl.freepik.com/liuzishan">Freepik user - Liuzishan</a><br/>
        </p>
    </div>
</section>

<footer class="footer">
    <%@include file="/WEB-INF/fragments/footer.jsp" %>
</footer>
<%@include file="/WEB-INF/fragments/script.jsp" %>
</body>
</html>