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
<%--    <%@include file="/WEB-INF/fragments/headerLog.jsp" %>--%>
</header>
<div id="carousel-home" data-ride="carousel" class="carousel slide carousel-fullscreen carousel-fade">
    <div role="listbox" class="carousel-inner">
        <div class="item active" style="background-image: url('../img/wizardAdd.jpg');">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
                <p class="super-paragraph">Tell us some information about yourself, a young student of the school of
                    magic.</p>
            </div>
        </div>
    </div>
</div>
<div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="text-center">Player registration</h4>
        </div>
        <div class="modal-body">
            <form:form method="post" modelAttribute="wizard">
            <form:hidden path="id"/>
            <p class="text-center">
                Name:<br/>
                <form:input path="name" type="text" placeholder="Your name"/>
                <form:errors path="name"/> <br/>
            </p>
            <p class="text-center">
                Race:<br/>
                <form:select path="race.id" items="${races}" itemValue="id" itemLabel="name"/>
                <form:errors path="race"/> <br/>
            </p>
            <p class="text-center">
                Age:<br/>
                <form:input path="age" type="number" placeholder="Your age"/>
                <form:errors path="age"/><br/>
            </p>
                <p class="text-center">
                    Gender:<br/>
                    Female: <form:radiobutton path="gender" value="male"/>
                    Male: <form:radiobutton path="gender" value="female"/>
                    <br/>
                </p>
            <p class="text-center">
                Background:<br/>
                <form:select path="background.id" items="${backgrounds}" itemValue="id" itemLabel="name"/>
                <form:errors path="background"/> <br/>
            </p>
            <p class="text-center">
                History:<br/>
                <form:textarea path="history" rows="8" cols="30"/>
                <form:errors path="history"/> <br/>
            </p>
            <p class="text-center">
                University:<br/>
                <form:select path="university.id" items="${universities}" itemValue="id" itemLabel="name"/>
                <form:errors path="university"/> <br/>
            </p>
            <p class="text-center">
                Spells:<br/>
                <form:select path="spellBook" items="${spells}" itemValue="id" itemLabel="name"/> <br/>
                <form:errors path="spellBook"/> <br/>
            </p>
            <p class="text-center">
                <button type="submit">Create</button><br/>
                <a href="/app/userPanel"><i>Back to user panel</i></a>
            </p>
        </div>
        </form:form>
    </div>
</div>
</center>
<footer class="footer">
    <%@include file="/WEB-INF/fragments/footer.jsp" %>
</footer>
<!-- Scripts -->
<%@include file="/WEB-INF/fragments/script.jsp" %>
</body>
</html>
