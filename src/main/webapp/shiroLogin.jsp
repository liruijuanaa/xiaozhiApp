<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>login</title>
</head>
<body>
<div align="center">
    <div style="border: 3px #ccaadd solid;width: 300px;height: 200px; ">
        <form action="${path}/shiroLogin/login" method="post"><br><br>
            用户名:<input name="username" type="text"><br><br>
            密&emsp;码:<input name="password" type="password"><br><br>
            <input type="submit" value="点我登陆">
        </form>
    </div>
</div>
</body>
</html>