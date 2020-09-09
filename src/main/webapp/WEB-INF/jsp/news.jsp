<%@ page import="java.net.http.HttpResponse" %>
<html>

<head></head>

<%
    HttpResponse<String> response = Unirest.customMethod("","https://")
        .header("x-rapidapi-key", "16fbe730famshb22b87fbc34529bp1309b8jsn74969893d55f")
        .header("content-type", "application/x-www-form-urlencoded")
        .asString();%>

</html>