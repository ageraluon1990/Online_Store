<!DOCTYPE html>
<html>
<head>
    <title>BuySell</title>
</head>
<body>
<h1>BUYSELL</h1><hr>
<h4>Регистрация</h4>
<form action="/registration" method="post">
    name <input type="text" name="name"><br><br>
    email <input type="email" name="email"><br><br>
    password <input type="password" name="password"><br><br>
    phone number <input type="text" name="phoneNumber"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="submit" value="Registration"/>
</form>
<#if errorMassage??>
    <h2 style="color: red">${errorMassage}</h2>
</#if>
</body>
</html>