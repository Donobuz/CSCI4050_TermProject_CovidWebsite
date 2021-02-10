
<%@ page import="java.net.URLDecoder" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>

    <!-- Required MetaFiles -->
    <meta name="content-type" content="text-html" charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="keyword1, keyword2, keyword3">
    <meta name="description" content="this is my page">
    <!-- Webjars for Bootstrap and Jquery -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style><%@include file="/WEB-INF/css/login.css"%></style>
    <title>Login</title>

</head>

<body>
<%--@elvariable id="login" type=""--%>
<form:form modelAttribute="login" >
    <div class="form-group container" id="positionOfLogin" style="text-align: center">
        <div>
            <form:input type="email"
                        class="form-control MyInput"
                        id="email"
                        style="display: inline; width: 300px;"
                        placeholder="email@example.com"
                        path="email"/>
        </div>

        <div>
            <form:input type="password"
                        name="password"
                        class="form-control MyInput"
                        id="password"
                        placeholder="password"
                        path="password"/>
        </div>

            <%--        <div>--%>
            <%--            &lt;%&ndash;    verifivation code  &ndash;%&gt;--%>
            <%--        <input type="text" class="form-control MyInput"--%>
            <%--               id="Verification_code"--%>
            <%--               style="display: inline; width: 180px;"--%>
            <%--               autocomplete="off"--%>
            <%--               placeholder="verification code"/>--%>
            <%--        <span><a href="#" id="changeImg"><canvas id="canvas" width="120" height="45"></canvas>--%>
            <%--    </a> </span>--%>
            <%--        </div>--%>

        <div>
            <form:button type="submit" style="text-align: center" class="form-control MyButton">Login</form:button>
        </div>

        <div>

            <a href="/registration"
               type="submit" class="form-control MyButton" >Sign Up</a>
        </div>

    </div>
</form:form>
<%--<script>--%>
<%--    function CheckPassword(inputtxt)--%>
<%--    {--%>
<%--        var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;--%>
<%--        if(inputtxt.value.match(passw))--%>
<%--        {--%>
<%--            alert('Correct, try another...')--%>
<%--            return true;--%>
<%--        }--%>
<%--        else--%>
<%--        {--%>
<%--            alert('Wrong...!')--%>
<%--            return false;--%>
<%--        }--%>
<%--    }--%>

<%--</script>--%>
</body>

<%--<script>--%>
<%--    //make a Random Number--%>
<%--    function randomNum(min,max) {--%>
<%--        return Math.floor(Math.random()*(max-min)+min);--%>
<%--    }--%>

<%--    //make a random color--%>
<%--    function randomColor(min,max) {--%>
<%--        var r = randomNum(min,max);--%>
<%--        var g = randomNum(min,max);--%>
<%--        var b = randomNum(min,max);--%>

<%--        return "rgb("+r+","+g+","+b+")";--%>
<%--    }--%>
<%--    drawPic();--%>
<%--    document.getElementById("changeImg").onclick = function (e) {--%>
<%--        e.preventDefault();--%>
<%--        drawPic();--%>
<%--    }--%>

<%--    //draw a pic of verification code--%>
<%--    function drawPic() {--%>
<%--        var canvas = document.getElementById("canvas");--%>
<%--        var width = canvas.width;--%>
<%--        var height = canvas.height;--%>
<%--        var ctx = canvas.getContext('2d');--%>
<%--        ctx.textBaseline = 'bottom';--%>

<%--        //draw background color--%>
<%--        ctx.fillStyle = randomColor(180,240); //prevent the background color to be dark--%>
<%--        ctx.fillRect(0,0,width,height);--%>

<%--        //draw text--%>
<%--        var str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';--%>
<%--        for (var i = 0; i < 4; i++){--%>
<%--            var txt = str[randomNum(0,str.length)];--%>
<%--            ctx.fillStyle = randomColor(50,160); // random a string color--%>
<%--            ctx.font = randomNum(15,40)+'px SimHei'; //random text size--%>
<%--            var x = 10+i*25;--%>
<%--            var y = randomNum(25,45);--%>
<%--            var deg = randomNum(-45,45);--%>

<%--            //fix the center point and angle--%>
<%--            ctx.translate(x,y);--%>
<%--            ctx.rotate(deg*Math.PI/180);--%>
<%--            ctx.fillText(txt,0,0);--%>

<%--            //reverse the center point and angle--%>
<%--            ctx.rotate(-deg*Math.PI/180);--%>
<%--            ctx.translate(-x,-y);--%>
<%--        }--%>
<%--    }--%>

<%--</script>--%>
</html>