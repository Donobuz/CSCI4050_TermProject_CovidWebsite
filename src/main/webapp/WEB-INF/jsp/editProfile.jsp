<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Webjars for Bootstrap and Jquery -->

<head>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <style>
        <%@include file="/WEB-INF/css/profile1.css" %>
    </style>
    <title>Profile Editor</title>
</head>

<header id=bal>
    <input type="image" src="/images/nav_logo.PNG" name="nav" class="btSubmit" id="nav"/>
    <%--    <img src="<c:url value="/images/nav_logo.PNG"/>"/>--%>
    <nav>
        <ul id=nav__links>
            <li><a style='text-decoration: none' href=> Testing Center </a></li>
            <li><a style='text-decoration: none' href=> Donation Center </a></li>
            <li><a style='text-decoration: none' href='https://www.youtube.com/'> Shop </a></li>
            <li><a style='text-decoration: none' href="/edit/${accountInstance.email}"> ${accountInstance.userName} </a></li>
        </ul>
    </nav>

</header>
<body>


<%--@elvariable id="editProfile" type=""--%>
<div class=grid>

    <img id=huru src="/images/pro.png">
    <div id=turu>
        <p> @${accountInstance.userName}<br> ${accountInstance.firstName} ${accountInstance.lastName} </p>

    </div>

    <ul id=bara>
        <li><span> <img class=icon src="/images/user.png"> </span> Profile</li>
        <li><span> <img class=icon src="/images/privacy.png">  </span> Privacy</li>
        <li><span> <img class=icon src="/images/set.png"> </span> Settings</li>
        <li><span> <img class=icon src="/images/pwd.png"> </span> Password</li>
    </ul>

</div>

<p>${emailUsernameExists}</p>
<p>${passwordEmpty}</p>
<form:form method="POST" modelAttribute="editProfile">
    <aside class=" form-group">
        <label for="firstName">First Name:</label><br>
        <form:input type="text" class="MyInput" id="firstName" path="firstName"
                    placeholder='${accountInstance.firstName}'/><br>
        <label for="lastName">Last Name:</label><br>
        <form:input type="text" class="MyInput" id="lastName" path="lastName"
                    placeholder='${accountInstance.lastName}'/><br>
        <label for="age">Age:</label><br>
        <form:input type="text" class="MyInput" id="firstName" path="age" placeholder='${accountInstance.age}'/><br>
        <label for="userName">User Name:</label><br>
        <form:input type="text" class="MyInput" id="userName" path="userName"
                    placeholder='@${accountInstance.userName}'/><br>
        <label for="email">Email:</label><br>
        <form:input type="email" class="MyInput" id="email" path="email" placeholder='${accountInstance.email}'/><br>


        <form:button type="submit" class="from-control">Submit</form:button>


    </aside>


    <div class="grid5  form-group">
        <label for="pwdC">Current Password:</label><br>
        <input type="password" class="MyInput" id="pwdC"/><br>

        <label for="pwd">New Password:</label><br>
        <form:password class="MyInput" id="pwd" path="password"/><br>

        <label for="pwdCP">Confirm Password:</label><br>
        <input type="password" class="MyInput" id="pwdCP"/><br>

    </div>

</form:form>
</body>
</html>



