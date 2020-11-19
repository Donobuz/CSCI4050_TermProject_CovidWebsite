<!DOCTYPE html>
<html>
<head>
    <title>Verify success</title>
    <style><%@include file="../css/registrationFail.css"%></style>
    <style><%@include file="../css/navBar.css"%></style>
<%--    <meta http-equiv="refresh" content="5;url=/login" />--%>
</head>
<body>
<header>
<%--    <a href="/welcome" id="nav_link">--%>
<%--        <img src="/images/nav_logo.PNG" alt="picture">--%>
<%--    </a>--%>
    <nav>
        <ul>
            <li><a href="#"> Testing Center </a> </li>
            <li><a href="/donation"> Donation Center </a></li>
            <li><a href="#"> Shop </a></li>
            <li><a href = "/edit/${account.email}"> ${account.userName} </a></li>
        </ul>
    </nav>

</header>

<main>

    <h1>Sorry! You have failed to register!</h1>
    <p>Click <a href="/registration">here</a> to try again.

</main>
</body>

</html>