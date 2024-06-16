<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h3 {
            color: black;
            text-align: center;
            margin-top: 20px;
        }

        form {
            margin-top: 20px;
            text-align: left;
        }

        input[type="text"],
        input[type="number"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 10px;
            margin-left: 60px;
            border: 1px solid #cccccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #333333;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
        <hr>
        <h3>Изменить номер</h3>
        <form action="/room/redaction/${id}" method="post" enctype="multipart/form-data">
            Описание объявления: <br><br> <input type="text" name="description"/><br><br>
            Цена: <br><br> <input type="number" name="price"/><br><br>
            Вместимость: <br><br> <input type="number" name="place"/><br><br>
            Номер: <br><br> <input type="text" name="number"/><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Изменить номер"/>
        </form>
</body>
</html>