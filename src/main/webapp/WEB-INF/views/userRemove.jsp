<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/fragments/headLog.jsp" %>
</head>

<body class="home">
<header class="header">
    <%@include file="/WEB-INF/fragments/headerLog.jsp" %>
</header>
<div id="carousel-home" data-ride="carousel" class="carousel slide carousel-fullscreen carousel-fade">
    <div role="listbox" class="carousel-inner">
        <div class="item active" style="background-image: url('../../img/dontLeave.jpg')">
            <div class="overlay"></div>
            <div class="carousel-caption">
                <h1 class="super-heading">Magic School</h1>
                <p class="super-paragraph">Don't be a Muggle!</p>
            </div>
        </div>
    </div>
</div>
<center>
<div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title">Player remove</h4>
    </div>
    <div class="modal-body">
            <form method="post">
                <h3>Are you sure you want to delete the user - ${user.login}?</h3>
                <form method="post">
                    <input type="hidden" name="idToRemove" value="${user.id}">
                    <button type="submit" value="yes" name="confirmed">YES</button>
                    <button type="submit" value="no" name="confirmed">NO</button>
                </form>
            </form>
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
