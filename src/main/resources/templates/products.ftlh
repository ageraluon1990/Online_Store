<!DOCTYPE html>
<html>
<head>
    <title>BuySell</title>
</head>
<body>
<h1>BUYSELL </h1><hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="выход"/>
    </form>
<#else>
    <a href="/login">Login</a><hr>
</#if>

<h4>Товары со всей России</h4>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>No product</h3>
</#list>
<hr>
<h3>Создать новый товар</h3>
<#if user.email??>
    <form action="/product/create" method="post" enctype="multipart/form-data">
        Название объявления <input type="text" name="title"><br><br>
        Описание объявления <input type="text" name="description"><br><br>
        Цена <input type="number" name="price"><br><br>
        Город <input type="text" name="city"><br><br>
        Первая фотография <input type="file" name="file1"><br><br>
        Вторая фотография <input type="file" name="file2"><br><br>
        Третья фотография <input type="file" name="file3"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Добавить товар"/>
    </form>
</#if>
</body>
</html>