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
                    <td>${wizard.race.toString()}</td>
                    <td>${wizard.gender}</td>
                    <td>${wizard.age}</td>
                    <td>${wizard.background.toString()}</td>
                    <td>${wizard.university.toString()}</td>
                    <td>${wizard.numberOfSpells}</td>
                </tr>
                </tbody>
            </table>
            <br/>
            <br/>
        </form:form>
        <br/>
        <h2 class="text-center">Hint!</h2>
        <p class="text-center"><b>If the number of spells is lower than your level, you can create or learn a new spell.</b></p>
        <p class="text-center"><b>Remember that creating a spell is not the same as learning it. This process continues. You need to be patient before you can fine-tune and master your own spell.</b></p>
        <br/>
        <h2 class="text-center">Spells you are currently creating</h2>
            <table class="Table">
                <thead>
                <tr>
                    <th width="15%">Name</th>
                    <th width="70%">Description</th>
                    <th width="15%">Required level</th>
                </tr>
                </thead>
                <c:forEach items="${spell}" var="spell">
                <tbody>
                <tr>
                    <td>${spell.name}</td>
                    <td>${spell.description}</td>
                    <td>${spell.wizardLevelRequired}</td>
                </tr>
                </tbody>
                </c:forEach>
            </table>
            <br/>
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