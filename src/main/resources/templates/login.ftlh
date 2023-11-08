<!DOCTYPE html>
<html>
<head>
    <title>BuySell</title>
</head>
<body>
<h1>BUYSELL</h1><hr>
<h4>Авторизация</h4>
<form action="/login" method="post">
    email <input type="email" name="username"><br><br>
    password <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="submit" value="вход"/>
</form>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>