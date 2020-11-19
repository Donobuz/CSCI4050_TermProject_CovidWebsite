<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="5;url=/login" />
    <title>Verify success</title>
    <style><%@include file="../css/verifySuccess.css"%></style>
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
    <h1>Verification Success</h1>
    <h2>Thank you for your support, we have successfully verified your email address.</h2>
    <h2>You can now proceed to you login page.
        <br>
        <br>
        <a href="/login" id="login_link">TAKE ME LOGIN >></a>
    </h2>
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