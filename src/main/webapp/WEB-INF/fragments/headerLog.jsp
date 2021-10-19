<div role="navigation" class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header"><a href="/index" class="navbar-brand">Magic School</a>
            <div class="navbar-buttons">
                <button type="button" data-toggle="collapse" data-target=".navbar-collapse" class="navbar-toggle navbar-btn">Menu<i class="fa fa-align-justify"></i></button>
            </div>
        </div>
        <div id="navigation" class="collapse navbar-collapse navbar-right">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/index">Home</a></li>
                <li><a href="/app/game">Game</a></li>
                <li><a href="/app/university">University</a></li>
                <li><a href="/app/userPanel">User Panel</a></li>
                <li class="active">
                    <c:choose>
                        <c:when test="${user.getLogin()==null}"><a class="nav-link color-header" href="/login">Sign in</a></c:when>
                        <c:otherwise>
                            <a class="nav-link color-header">Welcome ${user.getLogin()}</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="active">
                    <c:choose>
                        <c:when test="${user.getLogin()==null}"><a class="nav-link color-header" href="/register">Register</a></c:when>
                        <c:otherwise>
                            <a class="nav-link color-header" href="/logout">Sing out</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </div>
</div>