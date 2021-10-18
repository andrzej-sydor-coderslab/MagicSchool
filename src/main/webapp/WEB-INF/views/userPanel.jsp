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
                <p class="super-paragraph"></p>
            </div>
        </div>
    </div>
</div>
<center>
    <div class="modal-content">
        <div class="modal-header">
            <h4 id="Login" class="modal-title">Panel user -  <a class="nav-link color-header">${user.getLogin()}</a></h4>
        </div>
            <form:form method="get" modelAttribute="user">
                <table class="Table">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Login</th>
                            <th>Email</th>
                            <th>Wizard</th>
                            <th>Option</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.login}</td>
                            <td>${user.email}</td>
                            <td><c:choose>
                                <c:when test="${user.getWizard()==null}"><a class="nav-link color-header" href="/app/addWizard">Create Wizard</a></c:when>
                                <c:otherwise>
                                    <a class="nav-link color-header" href="/app/wizardPanel">${user.showWizardName()}</a>
                                </c:otherwise>
                            </c:choose></td>
                            <td class="nav-tabs">
                                <a href="/app/userPanel/remove?idToRemove=${user.id}">
                                    <i>Remove user</i></a><br/>
                                <a href="/app/userPanel/merge?idToMerge=${user.id}">
                                    <i>Edit user</i></a>
                                </a>
                            </td>
                        </tr>
                        </tbody>
                     </table>
            <br/>
            <br/>
            </form:form>
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