<!DOCTYPE html>
<html >
<head>
    <title>HOTEL</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://kit.fontawesome.com/13bddc1023.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    }

    form {
    margin-bottom: 20px;
    }

    form input[type="submit"] {
    background-color: #333333;
    color: #ffffff;
    padding: 5px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
    }

    .buttonEnter {
    background-color: #333333;
    color: white;
    padding: 5px 5px;
    min-width: 100px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;

    display: flex;
    align-items: center;
    justify-content: center;
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

    .carousel {
    width: 100%;
    height: 100vh;
    overflow: hidden;
    }

    .carousel-container {
    background-color: #ffffff;
    padding: 20px;
    margin: 50px auto;
    max-width: 1200px;
    border-radius: 5px;
    }
    .carousel-inner {
    width: 100%;
    height: 100%;
    }

    .carousel-item {
    width: 100%;
    height: 100%;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    }

    .carousel-control {
    color: #333333;
    font-size: 24px;
    background-color: rgba(255, 255, 255, 0.5);
    width: auto;
    }

    .carousel-control:hover,
    .carousel-control:focus {
    color: #333333;
    background-color: rgba(255, 255, 255, 0.9);
    text-decoration: none;
    outline: none;
    }


    .carousel-indicators li {
    margin-top: 10px;
    background-color: #000000;
    }

    .carousel-indicators .active {
    background-color: #000000;
    }
    .carousel-inner img {
    display: block;
    margin: 0 auto;
    height: 600px;
    object-fit: contain;
    }





    .room-info {
    margin-bottom: 20px;
    border: 1px solid #cccccc;
    padding: 20px;
    border-radius: 5px;
    }

    .room-info b {
    color: #333333;
    }

    .room-actions {
    margin-top: 10px;
    }

    .room-actions a {
    margin-right: 10px;
    }

    .no-rooms {
    color: #666666;
    text-align: center;
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


    .carousel-inner {
    display: flex;
    align-items: center;
    justify-content: center;
    }

    .room-actions {
    margin-top: 10px;
    text-align: center;
    }

    .button-view {
    background-color: #333333;
    color: #ffffff;
    padding: 5px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    margin-bottom: 10px;
    display: inline-block;
    text-decoration: none;
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
            <#if user.email??>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li> <a href="/search">Поиск</a> </li>
                    <li><a href="/bookings">Профиль</a></li>
                    <#if user.isAdmin()>
                        <li><a href="/admin">Пользователи</a></li>
                        <li><a href="/room/create/">Номера</a></li>
                        <li><a href="/bookingRooms">Забронированные номера</a></li>
                        <li><a href="/freeRooms">Свободные номера</a></li>
                    </#if>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li> <form action="/logout" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="submit" value="Выйти"/>
                        </form> </li>
                </ul>
            </div>
            <#else>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li> <a href="/search">Поиск</a> </li>
                    <li><a href="/bookings">Профиль</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li> <form action="/logout" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </form> </li>
                    <li><a href="/login" class=buttonEnter> Вход </a></li>
                </ul>
            </div>
            </#if>
        </div>
    </nav>
</header>
<hr>
<div class="container">
    <div class="row">
        <div class="col-lg-4">
            <i class="fas fa-wifi fa-3x"></i>
            <h2 class="fw-normal">Интернет</h2>
            <p>Высокоскоростной WI-FI на всей территории отеля</p>
        </div>
        <div class="col-lg-4">
            <i class="fas fa-utensils fa-3x" ></i>
            <h2 class="fw-normal">Ресторан</h2>
            <p>Нет необходимости далеко ходить, всё есть внутри</p>
        </div>
        <div class="col-lg-4">
            <i class='fa-solid fa-map-location-dot fa-3x'></i>
            <h2 class="fw-normal">Удобное расположение</h2>
            <p>Центр города, центральнее уже нельзя</p>
        </div>
    </div>
</div>
<hr>
<#if rooms?size gt 0>
<div class="carousel-container">
    <div id="roomCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <#list rooms as room>
                <li data-target="#roomCarousel" data-slide-to="${room_index}" <#if room_index == 0>class="active"</#if>></li>
            </#list>
        </ol>
        <!-- Slides -->
        <div class="carousel-inner">
            <#list rooms as room>
                <div class="item <#if room_index == 0>active</#if>">
                    <div class="room-info">
                        <img src="/images/${room.getPreviewImageId()}" alt="Room Preview" /><br><br>
                        <div class="room-actions">
                            <a href="/room/${room.id}" class="button-view">Посмотреть номер</a>
                            <#if user.isAdmin()>
                                <a href="/room/delete/${room.id}" class="button-view">Удалить номер</a>
                                <a href="/room/cancel/delete/${room.id}" class="button-view">Отменить бронирования</a>
                                <a href="/room/redaction/${room.id}" class="button-view">Изменить описание номера</a>
                            </#if>
                        </div>
                    </div>
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
</div>
<#else>
    <h3 class="no-rooms">Номеров нет</h3>
</#if>

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
<script>
    $(document).ready(function() {
        // Smooth scrolling when clicking on anchor links
        $('a[href^="#"]').on('click', function(event) {
            var target = $(this.getAttribute('href'));
            if (target.length) {
                event.preventDefault();
                $('html, body').animate({
                    scrollTop: target.offset().top
                }, 1000);
            }
        });
    });
</script>
</body>
</html>

