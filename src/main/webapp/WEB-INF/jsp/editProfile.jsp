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
    <style><%@include file="../css/navBar.css"%></style>
    <style><%@include file="../css/profile1.css" %></style>
    <title>Profile Editor</title>
</head>

<header>
    <a href="/welcome/${accountInstance.userName}" id="nav_link">
        <img src="/images/nav_logo.PNG" alt="picture">
    </a>
    <nav>
        <ul>

            <li><a href = "/edit/${accountInstance.email}"> ${accountInstance.userName} </a></li>
            <li><a href = "/request/${accountInstance.userName}" > Request </a></li>
            <li><a href = "/donation/${accountInstance.userName}"> Donation Center </a></li>

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





<form:form method="POST" modelAttribute="editProfile">
    <aside class=" form-group">
        <label for="firstName">First Name:</label><br>
        <p class="error">${firstNameEmpty}</p>
        <form:input type="text" class="MyInput" id="firstName" path="firstName"
                    placeholder='${accountInstance.firstName}'/><br>
        <label for="lastName">Last Name:</label><br>
        <p class="error">${lastNameEmpty}</p>
        <form:input type="text" class="MyInput" id="lastName" path="lastName"
                    placeholder='${accountInstance.lastName}'/><br>
        <label for="age">Age:</label><br>
        <p class="error">${ageEmpty}</p>
        <form:input type="text" class="MyInput" id="firstName" path="age" placeholder='${accountInstance.age}'/><br>
        <label for="userName">Username:</label><br>
        <p class="error">${userNameEmpty} ${usernameExists}</p>
        <form:input type="text" class="MyInput" id="userName" path="userName"
                    placeholder='@${accountInstance.userName}'/><br>
        <label for="email">Email:</label><br>
        <p class="error">${emailExists} ${emailEmpty}</p>
        <form:input type="email" class="MyInput" id="email" path="email" placeholder='${accountInstance.email}'/><br>


        <form:button type="submit" class="from-control">Submit</form:button>


    </aside>


    <div class="grid5  form-group">
        <label for="currentPassword">Current Password:</label><br>
        <p class="error">${currentPasswordNoMatch}</p>
        <p class="error">${currentPasswordEmpty}</p>
        <form:password class="MyInput" id="currentPassword" path="currentPassword"/><br>

        <label for="password">New Password:</label><br>
        <p class="error">${passwordEmpty}</p>
        <p class="error">${confirmPasswordNoMatch}</p>
        <form:password class="MyInput" id="password" path="password"/><br>

        <label for="confirmPassword">Confirm Password:</label><br>
        <p class="error">${confirmPasswordEmpty}</p>
        <form:password class="MyInput" id="confirmPassword" path="confirmPassword"/><br>

    </div>

</form:form>
</body>
</html>



