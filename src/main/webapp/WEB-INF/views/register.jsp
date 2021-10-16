<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/fragments/head.jsp" %>
</head>

<body class="home">
<!-- navbar-->
<header class="header">
    <%@include file="/WEB-INF/fragments/headerNoLog.jsp" %>
</header>
<div id="carousel-home" data-ride="carousel" class="carousel slide carousel-fullscreen carousel-fade">
    <div role="listbox" class="carousel-inner">
        <div class="item active" style="background-image: url('../img/portal2Login.jpg');">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
                <p class="super-paragraph"></p>
            </div>
        </div>
    </div>
</div>
<div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
            <h4 id="Login" class="modal-title">Player registration</h4>
        </div>
        <div class="modal-body">
            <form:form method="post" modelAttribute="user">
                <div class="form-group">
                    <form:hidden path="id"/>
                    <p class="text-center">
                        Login:<br/>
                        <form:input path="login" type="text" placeholder="Your login"/>
                    </p>
                </div>
                <div class="form-group">
                    <p class="text-center">
                        Email:<br/>
                        <form:input path="email" type="email" placeholder="Your email"/>
                    </p>
                </div>
                <div class="form-group">
                    <p class="text-center">
                        Password:<br/>
                        <form:input path="password" type="password" placeholder="Your password"/>
                    </p>
                </div>
                <p class="text-center">
                    <button type="submit">Register</button>
                </p>
            </form:form>
        </div>
    </div>
</div>
<footer class="footer">
    <%@include file="/WEB-INF/fragments/footer.jsp" %>
</footer>
<!-- Scripts -->
<%@include file="/WEB-INF/fragments/script.jsp" %>
</body>
</html>