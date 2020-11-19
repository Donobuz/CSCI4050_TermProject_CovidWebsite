<!DOCTYPE html>
<html>
<head>
    <title>Verify success</title>
    <style><%@include file="../css/registrationSuccess.css"%></style>
    <style><%@include file="../css/navBar.css"%></style>
</head>
<body>
<header>

<%--    <a href="/welcome" id="nav_link">--%>
<%--        <img src="/images/nav_logo.PNG" alt="picture">--%>
<%--    </a>--%>
    <nav>
        <ul>
            <li><a href = > Testing Center </a> </li>
            <li><a href = "/donation"> Donation Center </a></li>
            <li><a href = "/request/${account.userName}" > Request </a></li>
            <li><a href = "/edit/${account.email}"> ${account.userName} </a></li>
        </ul>
    </nav>
</header>

<main>
    <div>
    <p>Thank you for registering!</p>
    <p>Please check your E-mail to verify your email.</p>
    </div>

</main>
</body>

</html>