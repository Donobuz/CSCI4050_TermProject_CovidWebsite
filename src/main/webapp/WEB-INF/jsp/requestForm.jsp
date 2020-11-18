<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style><%@include file="/WEB-INF/css/requestForm.css"%></style>
    <title>Request Form</title>
</head>
<%--<a href="/welcome">--%>
<%--    <img src="/images/nav_logo.PNG" alt="picture">--%>
<%--</a>--%>
<body>

<%--<canvas id="canvas"></canvas>--%>
<%--<script>--%>

<%--var canvas = document.getElementById('canvas'),--%>
<%--ctx = canvas.getContext('2d'),--%>
<%--w = canvas.width = window.innerWidth,--%>
<%--h = canvas.height = window.innerHeight,--%>

<%--hue = 217,--%>
<%--stars = [],--%>
<%--count = 0,--%>
<%--maxStars = 1300;                //Number of stars, default 1300--%>
<%--var canvas2 = document.createElement('canvas'),--%>
<%--ctx2 = canvas2.getContext('2d');--%>
<%--canvas2.width = 100;--%>
<%--canvas2.height = 100;--%>
<%--var half = canvas2.width / 2,--%>
<%--gradient2 = ctx2.createRadialGradient(half, half, 0, half, half, half);--%>
<%--gradient2.addColorStop(0.025, '#CCC');--%>
<%--gradient2.addColorStop(0.1, 'hsl(' + hue + ', 61%, 33%)');--%>
<%--gradient2.addColorStop(0.25, 'hsl(' + hue + ', 64%, 6%)');--%>
<%--gradient2.addColorStop(1, 'transparent');--%>

<%--ctx2.fillStyle = gradient2;--%>
<%--ctx2.beginPath();--%>
<%--ctx2.arc(half, half, half, 0, Math.PI * 2);--%>
<%--ctx2.fill();--%>

<%--// End cache--%>
<%--function random(min, max) {--%>
<%--if (arguments.length < 2) {--%>
<%--max = min;--%>
<%--min = 0;--%>
<%--}--%>

<%--if (min > max) {--%>
<%--var hold = max;--%>
<%--max = min;--%>
<%--min = hold;--%>
<%--}--%>

<%--return Math.floor(Math.random() * (max - min + 1)) + min;--%>
<%--}--%>

<%--function maxOrbit(x, y) {--%>
<%--var max = Math.max(x, y),--%>
<%--diameter = Math.round(Math.sqrt(max * max + max * max));--%>
<%--return diameter / 1;--%>
<%--//The moving range of the stars, the larger the value, the smaller the range--%>
<%--}--%>

<%--var Star = function() {--%>

<%--this.orbitRadius = random(maxOrbit(w, h));--%>
<%--this.radius = random(60, this.orbitRadius) / 10;       //Star size, the larger the value, the smaller the star, the default is 8--%>

<%--this.orbitX = w / 2;--%>
<%--this.orbitY = h / 2;--%>
<%--this.timePassed = random(0, maxStars);--%>
<%--this.speed = random(this.orbitRadius) / 5000000;        //Star movement speed, the larger the value, the slower, the default is 5W--%>

<%--this.alpha = random(2, 10) / 10;--%>

<%--count++;--%>
<%--stars[count] = this;--%>
<%--}--%>

<%--Star.prototype.draw = function() {--%>
<%--var x = Math.sin(this.timePassed) * this.orbitRadius + this.orbitX,--%>
<%--y = Math.cos(this.timePassed) * this.orbitRadius + this.orbitY,--%>
<%--twinkle = random(10);--%>

<%--if (twinkle === 1 && this.alpha > 0) {--%>
<%--this.alpha -= 0.05;--%>
<%--} else if (twinkle === 2 && this.alpha < 1) {--%>
<%--this.alpha += 0.05;--%>
<%--}--%>

<%--ctx.globalAlpha = this.alpha;--%>
<%--ctx.drawImage(canvas2, x - this.radius / 2, y - this.radius / 2, this.radius, this.radius);--%>
<%--this.timePassed += this.speed;--%>
<%--}--%>

<%--for (var i = 0; i < maxStars; i++) {--%>
<%--new Star();--%>
<%--}--%>

<%--function animation() {--%>
<%--ctx.globalCompositeOperation = 'source-over';--%>
<%--ctx.globalAlpha = 0.5;                                 //tail--%>
<%--ctx.fillStyle = 'hsla(' + hue + ', 64%, 6%, 2)';--%>
<%--ctx.fillRect(0, 0, w, h)--%>

<%--ctx.globalCompositeOperation = 'lighter';--%>
<%--for (var i = 1,--%>
<%--l = stars.length; i < l; i++) {--%>
<%--stars[i].draw();--%>
<%--};--%>

<%--window.requestAnimationFrame(animation);--%>
<%--}--%>

<%--animation();--%>
<%--</script>--%>

<%--@elvariable id="requestForm" type=""--%>
<form:form method="POST" modelAttribute="requestForm">
        <div class="MyForm form-group">
            <h1>What can we do for you?</h1>

            <form:input type="text" class="MyInput" id="amount" placeholder="Enter amount" path="amount"/>

            <form:input type="text-area" class="MyInput" id="reason" placeholder="Explain your situation" path ="reason"/>

            <form:button type="submit" class="from-control">Submit</form:button>
<%--            <span>${lNameFail}</span>
            <form:input type="text" class="MyInput" id="lastName" path="lastName" placeholder="Enter last name"/>

            <span>${usernameExist}</span>
            <span>${usernameFail}</span>
            <form:input type="text" class="MyInput" id="userName" placeholder="Enter a Username" path="userName"/>

            <span>${ageFail}</span>
            <form:input type="number" class="MyInput" id="inputAge" placeholder="Enter age" path="age"/>

            <span>${emailFail}</span>
            <span>${emailExist}</span>
            <form:input type="email" class="MyInput" id="email" path="email" placeholder="Enter email address" />

            <span>${passwordFail}</span>
            <form:password class="MyInput" id="password" placeholder="Enter password" autocomplete="false" path="password"/>--%>
<%--            <form:button type="submit" class="from-control">Submit</form:button>--%>


        </div>

<%--        <div>--%>
<%--            <img src="/images/reg1.png" alt="picture">--%>
<%--        </div>--%>

</form:form>

</body>

</html>