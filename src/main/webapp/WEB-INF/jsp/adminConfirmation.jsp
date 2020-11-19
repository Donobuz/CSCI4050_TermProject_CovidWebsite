<!DOCTYPE html>
<html>
<head>
    <title>Request Confirmation</title>
    <style><%@include file="/WEB-INF/css/registrationSuccess.css"%></style>
</head>
<body>
<header id="bal">

    <input type="image" src="/images/nav_logo.PNG" name="nav" class="btSubmit" id="nav" />
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
    <div>
        <p>We have received your request</p>
        <p>Your post will be shown once an admin reviews it</p>
        <a href="/welcome/${account.userName}">Click here to go back to the Home Page</a>
    </div>

</main>
</body>

</html>