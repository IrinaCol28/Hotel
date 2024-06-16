<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding-top: 50px;
        }

        h1 {
            color: #333333;
            text-align: center;
        }

        h3 {
            color: #666666;
            margin-bottom: 10px;
            margin-left: 20px;
        }

        form {
            margin-bottom: 20px;
            text-align: center;
        }

        form input[type="submit"] {
            background-color: #333333;
            color: #ffffff;
            padding: 5px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            margin-top: 10px;
            margin-bottom: 10px;
            display: inline-block;
            text-decoration: none;
        }

        .buttonEnter {
            background-color: #333333;
            color: #ffffff;
            padding: 5px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            margin-top: 15px;
            margin-bottom: 10px;
            display: inline-block;
            text-decoration: none;
        }

        a {
            color: #333333;
            text-decoration: none;
            margin-right: 10px;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: none;
            border-top: 1px solid #cccccc;
        }

        h4 {
            color: #666666;
        }



        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 9999;
        }

        .navbar-default {
            background-color:whitesmoke;
            max-height: 50px;
        }


        .footer {
            background-color: #333333;
            color: #ffffff;
            padding: 20px 20px;
            width: 100%;
            text-align: center;
            box-sizing: border-box;
        }

        .footer p {
            margin: 0;
        }
        .footer .social-links {
            margin-top: 10px;
        }

        .footer .social-links a {
            display: inline-block;
            color: #ffffff;
            margin: 0 5px;
            text-decoration: none;
        }

        .footer .social-links a i {
            color: #ffffff; /* Изменение цвета иконки на белый */
        }

        form {
            margin-bottom: 20px;
        }

        input[type="date"] {
            width: 200px;
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #cccccc;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #333333;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #666666;
        }
        input[type="number"]
        {
            margin-bottom: 10px;
        }



    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Логотип и мобильное меню -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/"> <a class="navbar-brand" href="#"> <i class="fas fa-hotel"> HOTEL</i></a>
                </a>

            </div>

            <!-- Содержимое навигационной панели -->
                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li> <a href="/">Главная страница</a> </li>
                        <li><a href="/bookings">Профиль</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <form action="/logout" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="submit" value="Выйти"/>
                            </form> </li>
                    </ul>
                </div>

        </div>
    </nav>
</header>

<hr>
<h3>Поиск</h3>
<hr>

<form action="/search" method="post">
    <h5>Цена</h5>
    От: <input type="number" name="priceFrom" min="1" value="1"/><br><br>
    До: <input type="number" name="priceBefore" min="1" value="195000"/><br><br>
    <hr>
    <h5>Время</h5>
    С: <input type="date" name="dateFrom" value="${localDate}" min="${localDate}"/><br><br>
    По: <input type="date" name="dateBefore" value="${localDate2}" min="${localDate2}"/><br><br>
    <hr>
    Вместимость: <input type="number" name="place" min="1" value="1"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <hr>
    <input type="submit" value="Найти"/>
    <hr>
</form>

<footer class="footer">
    <p>&copy; 2023 HOTEL. All rights reserved.</p>
    <div class="social-links">
        <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
        <a href="https://twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a>
        <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
    </div>
</footer>
<script src="https://kit.fontawesome.com/13bddc1023.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>