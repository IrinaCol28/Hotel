<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }

        h4 {
            margin-bottom: 10px;
        }

        img {
            height: 100px;
            margin-bottom: 10px;
        }

        b {
            font-weight: bold;
        }

        h3 {
            margin-bottom: 10px;
        }

        a {
            display: block;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h1>HOTEL</h1>
<hr>
<h4>Подробная информация о номере</h4>
<#list images as img>
    <img src="/images/${img.id}" alt="Room Image"/><br><br>
</#list>

<b>Описание номера: </b>${room.description}<br>
<b>Цена: </b>${room.price}<br>
<b>Вместимость: </b>${room.place}<br>
<b>Номер: </b>${room.number}<br>
<h3>Бронирование номера</h3>
<b>Начало: </b>${booking.dataStart}<br>
<b>Конец: </b>${booking.dataEnd}<br>
<b>Стоимость: </b>${booking.cost}<br>
<a href="/booking/create/${room.id}">Забронировать еще раз</a>
</body>
</html>
