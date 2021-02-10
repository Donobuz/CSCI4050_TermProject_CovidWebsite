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
<%--@elvariable id="requestForm" type=""--%>
<form:form method="POST" modelAttribute="requestForm">
        <div class="MyForm form-group">
            <h1>What can we do for you?</h1>

            <form:input type="text" class="MyInput" id="amount" placeholder="Enter amount" path="amount"/>

            <form:input type="text-area" class="MyInput" id="reason" placeholder="Explain your situation" path ="reason"/>

            <form:button type="submit" class="from-control">Submit</form:button>

        </div>
</form:form>

</body>

</html>