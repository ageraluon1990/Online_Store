<!DOCTYPE html>
<html>
<head>
    <title>BuySell</title>
</head>
<body>
<h1>BUYSELL</h1><hr>
<h4>Подробная информация о товаре</h4>
<#list images as img>
    <img src="/images/${img.id}" height="60px"/><br><br>
</#list>
<b>Название товара</b>${product.title}<br>
<b>Описание товара</b>${product.description}<br>
<b>Цена</b>${product.price}<br>
<b>Город</b>${product.city}<br>
<b>Автор</b>${product.user.name}<br>
<b>Номер телефон</b>${product.user.phoneNumber}<br>
<hr>
<form action="/product/delete/${product.id}" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="submit" value="Удалить"/>
</form>
<form action="/" method="get">
    <input type="submit" value="Вернуться"/>
</form>
</body>
</html>