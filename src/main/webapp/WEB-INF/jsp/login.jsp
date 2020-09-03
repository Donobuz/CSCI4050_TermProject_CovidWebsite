<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>

    <!-- Required MetaFiles -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Webjars for Bootstrap and Jquery -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style><%@include file="/WEB-INF/css/login.css"%></style>
    <title>Login</title>
</head>

<body>
<div class="form-group container text-center">
    <h1>Login</h1>
    <div class="login">
        <input type="text"
               class="form-control MyInput"
               id="user"
               style="display: inline; width: 300px;"
               autocomplete="off"
               placeholder="email@example.com"/>
    </div>
    <div class="login">
        <input type="text"
               class="form-control MyInput"
               id="password"
               style="display: inline; width: 300px;"
               autocomplete="off"
               placeholder="password"/>
    </div>

    <div class="MyButton text-center">
        <a href="/index"
           type="submit"
           class="btn btn-primary form-control"
           style="background-color: #817ffe;
           border-radius: 50px;
           border: 0px solid transparent;
           width: 150px">Login</a>

        <a href="/registration"
           type="submit"
           class="btn btn-primary form-control"
           style="background-color: #817ffe;
           border-radius:50px;
           border: 0px solid transparent;
           width: 150px">Sign up</a>
    </div>
</div>
</body>
</html>