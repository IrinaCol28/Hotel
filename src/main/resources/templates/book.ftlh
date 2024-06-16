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
        h2 {text-align: left;
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



       b{
            margin-bottom: 30px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #333333;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="date"] {
            width: 200px;
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #cccccc;
        }


        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .hotel-section {
            margin-left: 10px;
            margin-bottom: 100px;
            text-align: center;
            animation: fadeIn 10s ease-in-out;
        }
        .container {
            left: 50%;
            margin: auto -50px;
            position: absolute;
            top: 50%;
        }
        .swing div {
            border-radius: 50%;
            float: left;
            height: 1em;
            width: 1em;
        }
        .swing div:nth-of-type(1) {
            background: -webkit-linear-gradient(left, #385c78 0%, #325774 100%);
            background: linear-gradient(to right, #385c78 0%, #325774 100%);
        }
        .swing div:nth-of-type(2) {
            background: -webkit-linear-gradient(left, #325774 0%, #47536a 100%);
            background: linear-gradient(to right, #325774 0%, #47536a 100%);
        }
        .swing div:nth-of-type(3) {
            background: -webkit-linear-gradient(left, #4a5369 0%, #6b4d59 100%);
            background: linear-gradient(to right, #4a5369 0%, #6b4d59 100%);
        }
        .swing div:nth-of-type(4) {
            background: -webkit-linear-gradient(left, #744c55 0%, #954646 100%);
            background: linear-gradient(to right, #744c55 0%, #954646 100%);
        }
        .swing div:nth-of-type(5) {
            background: -webkit-linear-gradient(left, #9c4543 0%, #bb4034 100%);
            background: linear-gradient(to right, #9c4543 0%, #bb4034 100%);
        }
        .swing div:nth-of-type(6) {
            background: -webkit-linear-gradient(left, #c33f31 0%, #d83b27 100%);
            background: linear-gradient(to right, #c33f31 0%, #d83b27 100%);
        }
        .swing div:nth-of-type(7) {
            background: -webkit-linear-gradient(left, #da3b26 0%, #db412c 100%);
            background: linear-gradient(to right, #da3b26 0%, #db412c 100%);
        }
        .shadow {
            clear: left;
            padding-top: 1.5em;
        }
        .shadow div {
            -webkit-filter: blur(1px);
            filter: blur(1px);
            float: left;
            width: 1em;
            height: .25em;
            border-radius: 50%;
            background: #e3dbd2;
        }
        .shadow .shadow-l {
            background: #d5d8d6;
        }
        .shadow .shadow-r {
            background: #eed3ca;
        }
        @-webkit-keyframes ball-l {
            0%, 50% {
                -webkit-transform: rotate(0) translateX(0);
                transform: rotate(0) translateX(0);
            }
            100% {
                -webkit-transform: rotate(50deg) translateX(-2.5em);
                transform: rotate(50deg) translateX(-2.5em);
            }
        }
        @keyframes ball-l {
            0%, 50% {
                -webkit-transform: rotate(0) translate(0);
                transform: rotate(0) translateX(0);
            }
            100% {
                -webkit-transform: rotate(50deg) translateX(-2.5em);
                transform: rotate(50deg) translateX(-2.5em);
            }
        }
        @-webkit-keyframes ball-r {
            0% {
                -webkit-transform: rotate(-50deg) translateX(2.5em);
                transform: rotate(-50deg) translateX(2.5em);
            }
            50%,
            100% {
                -webkit-transform: rotate(0) translateX(0);
                transform: rotate(0) translateX(0);
            }
        }
        @keyframes ball-r {
            0% {
                -webkit-transform: rotate(-50deg) translateX(2.5em);
                transform: rotate(-50deg) translateX(2.5em);
            }
            50%,
            100% {
                -webkit-transform: rotate(0) translateX(0);
                transform: rotate(0) translateX(0)
            }
        }
        @-webkit-keyframes shadow-l-n {
            0%, 50% {
                opacity: .5;
                -webkit-transform: translateX(0);
                transform: translateX(0);
            }
            100% {
                opacity: .125;
                -webkit-transform: translateX(-1.57em);
                transform: translateX(-1.75em);
            }
        }
        @keyframes shadow-l-n {
            0%, 50% {
                opacity: .5;
                -webkit-transform: translateX(0);
                transform: translateX(0);
            }
            100% {
                opacity: .125;
                -webkit-transform: translateX(-1.75em);
                transform: translateX(-1.75em);
            }
        }
        @-webkit-keyframes shadow-r-n {
            0% {
                opacity: .125;
                -webkit-transform: translateX(1.75em);
                transform: translateX(1.75em);
            }
            50%,
            100% {
                opacity: .5;
                -webkit-transform: translateX(0);
                transform: translateX(0);
            }
        }
        @keyframes shadow-r-n {
            0% {
                opacity: .125;
                -webkit-transform: translateX(1.75em);
                transform: translateX(1.75em);
            }
            50%,
            100% {
                opacity: .5;
                -webkit-transform: translateX(0);
                transform: translateX(0);
            }
        }
        .swing-l {
            -webkit-animation: ball-l .425s ease-in-out infinite alternate;
            animation: ball-l .425s ease-in-out infinite alternate;
        }
        .swing-r {
            -webkit-animation: ball-r .425s ease-in-out infinite alternate;
            animation: ball-r .425s ease-in-out infinite alternate;
        }
        .shadow-l {
            -webkit-animation: shadow-l-n .425s ease-in-out infinite alternate;
            animation: shadow-l-n .425s ease-in-out infinite alternate;
        }
        .shadow-r {
            -webkit-animation: shadow-r-n .425s ease-in-out infinite alternate;
            animation: shadow-r-n .425s ease-in-out infinite alternate;
        }

        .fa-building {
            font-size: 44px;
        }

        table {
            width: 100%;
            margin-bottom: 50px;
            text-align: center;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            color: #333333;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #ffffff;
        }

        tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        th:first-child,
        td:first-child {
            border-left: none;
        }

        th:last-child,
        td:last-child {
            border-right: none;
        }

        tr:last-child th,
        tr:last-child td {
            border-bottom: none;
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
                <a class="navbar-brand" href="/">  <i class="fas fa-hotel"> HOTEL</i></a>
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
<h3>Забронировать номер</h3>
<form action="/booking/create/${room.id}" method="post" enctype="multipart/form-data">
    Начало: <input type="date" value="${localDate}" min="${localDate}" name="dataStart"/><br><br>
    Конец: <input type="date" value="${localDate2}" min="${localDate2}" name="dataEnd"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Забронировать номер"/>
</form>
<div aria-busy="true" aria-label="Loading" role="progressbar" class="container">
    <div class="swing">
        <div class="swing-l"></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div class="swing-r"></div>
    </div>
    <div class="shadow">
        <div class="shadow-l"></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div class="shadow-r"></div>
    </div>
</div>


<div class="hotel-section">
    <i class="fas fa-building"></i>
</div>
<h4>Занятые дни</h4>
<table>
    <tr>
        <th>Дата</th>
    </tr>
    <#list bookedDays as bookedDay>
        <tr>
            <td>${bookedDay}</td>
        </tr>
    </#list>
</table>
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