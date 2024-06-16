<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


    <style>

        .carousel-inner img {
            display: block;
            margin: 0 auto;
            max-height: 400px;
            margin-top: 20px;
        }


        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding-top: 50px;
            text-align: center;
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
            color: #ffffff;
        }



        form {
            display: inline-block;
            margin: 0;
        }

        form input[type="submit"] {
            background-color: #333333;
            color: #ffffff;
            padding: 6px 12px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .cabinet a {
            background-color: #333333;
            color: #ffffff;
            padding: 6px 12px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 10px;
            margin-bottom: 10px;
        }



        img {
            display: block;
            margin: 0 auto;
            max-height: 400px;
            margin-top: 20px;
        }

        b {
            background-color: lightslategray;
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
                <a class="navbar-brand" href="/"> <i class="fas fa-hotel"> HOTEL</i></a>
                </a>

            </div>

            <!-- Содержимое навигационной панели -->

            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li> <a href="/search">Поиск</a> </li>
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
<div id="roomCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <#list images as img>
            <li data-target="#roomCarousel" data-slide-to="${img_index}"<#if img_index == 0> class="active"</#if>></li>
        </#list>
    </ol>

    <!-- Slides -->
    <div class="carousel-inner">
        <#list images as img>
            <div class="item<#if img_index == 0> active</#if>">
                <img src="/images/${img.id}" height="400px"/>
            </div>
        </#list>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#roomCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#roomCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
<b>Описание номера: ${room.description}</b> <br>
<b>Цена: ${room.price}</b>
<b>Вместимость: ${room.place}</b>
<b>Номер: ${room.number}</b>  <br>
<div class="cabinet">
    <a href="/booking/create/${room.id}">Забронировать</a>
</div>
<hr>

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
<script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://getbootstrap.com/docs/5.3/examples/carousel/carousel.js"></script>
</body>
</html>