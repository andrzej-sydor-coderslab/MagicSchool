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
        <div class="item active" style="background-image: url('../img/userPanel.jpg');">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
                <p class="super-paragraph">Wizard Panel</p>
            </div>
        </div>
    </div>
</div>
<center>
    <section>
        <form:form method="get" modelAttribute="wizard">
            <table class="Table">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Level</th>
                    <th>Experience</th>
                    <th>Race</th>
                    <th>Gender</th>
                    <th>Age</th>
                    <th>Background</th>
                    <th>University</th>
                    <th>Number of spells</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${wizard.id}</td>
                    <td>${wizard.name}</td>
                    <td>${wizard.level}</td>
                    <td>${wizard.experience}</td>
                    <td>${wizard.race.toStringRace()}</td>
                    <td>${wizard.gender}</td>
                    <td>${wizard.age}</td>
                    <td>${wizard.background.toStringBackground()}</td>
                    <td>${wizard.university.toStringUniversity()}</td>
                    <td>${wizard.numberOfSpells}</td>
                </tr>
                </tbody>
            </table>
            <br/>
            <br/>
        </form:form>
        <br/>
        <img src="../img/wizardWizardPanel.jpg">
        <br/>
        <br/>
        <br/>
        <br/>
        <form:form method="get" modelAttribute="wizard">
            <table class="Table">
                <thead>
                <tr>
                    <th>History</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${wizard.history}</td>
                </tr>
                </tbody>
            </table>
            <br/>
            <br/>
        </form:form>
        <br/>
        <img src="../img/magicWizardPanel.jpg">
        <br/>
        <br/>
        <br/>
        <br/>
        <h4>Your own spellbook</h4>
        <c:forEach items="${wizard.spellBook}" var="spell">
        <br/>
        -----------------------------------
        <br/>
        <b>${spell.name}<b/><br/>
                ${spell.description}
            </c:forEach>
    </section>
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