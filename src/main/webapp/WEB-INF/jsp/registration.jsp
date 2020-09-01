<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Webjars for Bootstrap and Jquery -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<head><title>Registration</title></head>
<body>
<h1>Registration</h1>
<%--@elvariable id="accountForm" type=""--%>
<form:form method="POST" modelAttribute="accountForm">
    <div class="form-group">
        <form:label for="firstName" path="firstName">First Name</form:label>
        <form:input type="text" class="form-control" id="firstName" placeholder="Enter first name" path="firstName"/>
    </div>
    <div class="form-group">
        <form:label for="lastName" path="lastName">Last Name</form:label>
        <form:input type="text" class="form-control" id="lastName" path="lastName" placeholder="Enter last name"/>
    </div>
    <div class="form-group">
        <form:label for="userName" path="userName">Username</form:label>
        <form:input type="text" class="form-control" id="userName" placeholder="Enter a Username" path="userName"/>
    </div>
    <div class="form-group">
        <form:label for="age" path="age">Age</form:label>
        <form:input type="text" class="form-control" id="inputAge" placeholder="Enter age" path="age"/>
    </div>
    <div class="form-check">
        <label for="inputGender1">Gender</label>
        <br>
        <input class="form-check-input" type="radio" name="gender" id="inputGender1" value="male">
        <label class="form-check-label" for="inputGender1">
            Male
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="gender" id="inputGender2" value="female">
        <label class="form-check-label" for="inputGender2">
            Female
        </label>
    </div>
    <div class="form-group">
        <form:label for="email" path="email">Email address</form:label>
        <form:input type="email" class="form-control" id="email" path="email" placeholder="Enter email address" />
    </div>
    <div class="form-group">
        <form:label for="password" path="password">Password</form:label>
        <form:input type="password" class="form-control" id="password" placeholder="Enter password" path="password"/>
    </div>

    <form:button type="submit" class="btn btn-primary">Submit</form:button>
</form:form>
</body>
</html>

