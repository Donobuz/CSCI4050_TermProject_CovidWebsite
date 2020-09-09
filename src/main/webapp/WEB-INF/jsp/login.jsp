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
<!--login page-->

<div class="container text-center">
    <h1 style="color: #817ffe" class="text-center">Login</h1>
</div>

<%--@elvariable id="accountForm" type=""--%>
<form:form name="accountForm" method="POST" modelAttribute="accountForm">
    <div class="form-group container text-center">
        <form:input type="text"
               class="form-control"
               id="userName"
               style="display: inline; width: 200px;" autocomplete="off" placeholder="Username" path="userName"/>
    </div>
    <div class="form-group container text-center">
        <form:input type="password"
               class="form-control" id="password"
               style="display: inline; width: 200px;" autocomplete="off" placeholder="Password" path="password"/>
    </div>

    <div class="form-group container text-center">
        <form:button type="submit" class="from-control btn btn-primary">Submit</form:button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="/registration" class="btn btn-primary">sign up</a>
    </div>

</form:form>
</body>

</html>