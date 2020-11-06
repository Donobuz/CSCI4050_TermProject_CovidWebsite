<!DOCTYPE html>
<html>
<head>
    <title>Verify fail</title>
    <style><%@include file="/WEB-INF/css/verifyFail.css"%></style>
</head>
<body>
<header id="bal">

    <a href="/welcome">
        <img src="/images/nav_logo.PNG" alt="picture">
    </a>
    <nav>
        <ul id = nav__links>
            <li><a style = 'text-decoration: none' href = > Testing Center </a> </li>
            <li><a style = 'text-decoration: none' href = > Donation Center </a></li>
            <li><a style = 'text-decoration: none' href = 'https://www.youtube.com/' > Shop </a></li>
            <li><a style = 'text-decoration: none' href = "/userData"> My Profile </a></li>
        </ul>
    </nav>

</header>

<main>

    <h1>Sorry! Your verification is fail!</h1>
    <p id="take_to_home_or_register">You may go to
        <a href="/welcome" id="home">home page</a>
        or click
        <a href="/registration" id="here">here</a>
        to register again.</p>

</main>
</body>
</html>