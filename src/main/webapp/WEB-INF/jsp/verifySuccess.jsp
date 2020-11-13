<!DOCTYPE html>
<html>
<head>
    <title>Verify success</title>
    <style><%@include file="/WEB-INF/css/verifySuccess.css"%></style>
    <meta http-equiv="refresh" content="5;url=/login" />
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

<h1>Congratulations! You have successfully verified your email!</h1>
<p>We will take you to <a href="/login">Login</a> soon, please wait...</p>

</main>
</body>
<script type="text/javascript">
    $(function() {
        var wait = $(".second").html();
        timeOut();
        /**
         * countDown
         */
        function timeOut() {
            if(wait != 0) {
                setTimeout(function() {
                    $('.second').text(--wait);
                    timeOut();
                }, 1000);
            }
        }
    });
</script>
</html>