<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style><%@include file="/WEB-INF/css/registration.css"%></style>
    <title>Request Form</title>
</head>
<body>
<%--@elvariable id="requestForm" type=""--%>
<form:form method="POST" modelAttribute="requestForm">
        <div class="MyForm form-group">
            <h1>New Request</h1>
            <span></span>
            <form:input type="text" class="MyInput" id="amount" placeholder="Enter amount" path="amount"/>

            <span></span>
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

        <div>
            <img src="/images/reg1.png" alt="picture">
        </div>

</form:form>

</body>

</html>