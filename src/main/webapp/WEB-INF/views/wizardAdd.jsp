<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/fragments/head.jsp" %>
</head>
    <%@include file="/WEB-INF/fragments/headerLog.jsp" %>
<body class="home">
<header class="header">
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
<section class="section--padding-bottom-small">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="post">
                    <div class="image"><img src="../img/backgroundAdd.jpg" alt="" class="img-responsive"></div>
                    <h3>Backgrounds</h3>
                    <p>
                        <c:forEach items="${backgrounds}" var="background">
                            <br/>
                            -----------------------------------
                            <br/>
                            <b>${background.name}<b/><br/>
                            ${background.description}
                        </c:forEach>
                    </p>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="post">
                    <div class="image"><img src="../img/universityAdd.jpg" alt="" class="img-responsive"></div>
                    <h3>Universities</h3>
                    <p>
                        <c:forEach items="${universities}" var="university">
                            <br/>
                            -----------------------------------
                            <br/>
                            <b>${university.name}<b/><br/>
                            ${university.description}
                        </c:forEach>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="section--padding-bottom-small">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="post">
                    <div class="image"><img src="../img/spellAdd.jpg" alt="" class="img-responsive"></div>
                    <h3>Spells</h3>
                    <h4>In the first level, you can choose up to three spells!</h4><br/>
                    <p>
                        <c:forEach items="${spells}" var="spell">
                        <br/>
                        -----------------------------------
                        <br/>
                        <b>${spell.name}<b/><br/>
                                ${spell.description}
                            </c:forEach>
                    </p>
                </div>
            </div>
            <div class="col-sm-6">
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
                                <form:select path="race" items="${races}" itemValue="id" itemLabel="name"/>
                                <form:errors path="race"/> <br/>
                            </p>
                            <p class="text-center">
                                Age:<br/>
                                <form:input path="age" type="number" placeholder="Your age"/>
                                <form:errors path="age"/><br/>
                            </p>
                            <p class="text-center">
                                Gender:<br/>
                                Female: <form:radiobutton path="gender" value="female"/>
                                Male: <form:radiobutton path="gender" value="male"/>
                                <br/>
                            </p>
                            <p class="text-center">
                                Background:<br/>
                                <form:select path="background" items="${backgrounds}" itemValue="id"
                                             itemLabel="name"/>
                                <form:errors path="background"/> <br/>
                            </p>
                            <p class="text-center">
                                History:<br/>
                                <form:textarea path="history" rows="8" cols="26"/>
                                <form:errors path="history"/> <br/>
                            </p>
                            <p class="text-center">
                                University:<br/>
                                <form:select path="university" items="${universities}" itemValue="id"
                                             itemLabel="name"/>
                                <form:errors path="university"/> <br/>
                            </p>
                            <p class="text-center">
                                Spells:<br/>
                                <form:select path="spellBook" items="${spells}" itemValue="id" itemLabel="name"/>
                                <br/>
                                <form:errors path="spellBook"/> <br/>
                            </p>
                            <p class="text-center">
                                <button type="submit">Create</button>
                                <br/>
                                <a href="/app/userPanel"><i>Back to user panel</i></a>
                            </p>
                        </div>
                        </form:form>
                    </div>
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
