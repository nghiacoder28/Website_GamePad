
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <title>GAMEPAD</title>
        <style>
            .container1::before
            {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width:0%;
                height: 100%;
                backdrop-filter: blur(10px);

            }
        </style>

    </head>

    <body>
        <section>
            <div class="bannerVideo" id="slideshow">
                <video src="video/ps5_review.mp4" autoplay muted loop
                       class="active"></video>
                <video src="video/ps4_review.mp4" autoplay muted
                       loop></video>
                <video src="video/xbox_review.mp4" autoplay muted loop></video>
            </div>
            <div class="container1" >
                <header class="navbar" id="navbar">
                    <a href="#" class="logo">GAMEPAD</a>
                    <ul>
                        <li>
                            <a href="Home" class="active">Home</a>
                        </li>
                        <li>
                            <a href="listProduct" class="active">PRODUCT</a>
                        </li>
                        <li><a href="ListCart" class="active"><i class="fa fa-shopping-bag"></i> <span></span></a></li>
                    </ul>
                    <span class="menuIcon" onclick="toggleMenu();"></span>
                </header>

                <ul class="sci">
                    <li>
                        <a href="https://www.facebook.com/nghiiaaa"><img src="image/fa-removebg-preview.png" alt=""></a>
                    </li>
                    <li>
                        <a href="https://www.instagram.com/nghiaaa.a/?hl=en"><img src="image/instagram-logo.png" alt=""></a>
                    </li>
                </ul>
                <ul class="controls">
                    <li onclick="prevSlide();prevSlideText();">
                        <img src="image/angle-left-512.png" alt="">
                    </li>
                    <li onclick="nextSlide();nextSlideText();">
                        <img src="image/right.png" alt="">
                    </li>
                </ul>
            </div>
        </section>
        <!--------start---------------------->
        <div class="container blogger">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 blogger-text">
                    <h1><span style="color: red;font-size: 80px;">WELCOME</span> TO
                        <span style="color: red;">GAMEPAD SHOP</span></h1>
                    <p>Discover the Ultimate Gaming Controllers!<br><br>
                        Are you ready to take your gaming experience to the next level? Introducing our range of top-notch gaming controllers – the perfect companions for every gamer. 
                        Designed with precision, comfort, and style in mind, our controllers cater to all your gaming needs.<br><br>
                        From sleek, ergonomic designs to customizable buttons and ultra-responsive triggers, our controllers provide the ultimate control and accuracy. 
                        Whether you're navigating through epic adventures, engaging in intense battles, or exploring vast open worlds, our gaming controllers ensure a seamless and immersive experience.<br><br>
                        Our controllers are compatible with all major platforms, including PC, consoles, and mobile devices, making them the ideal choice for every gaming setup. 
                        With enhanced vibration feedback and robust wireless connectivity, you'll feel every move, shot, and explosion like never before.<br><br>
                        Join the revolution. Take control. Explore our collection of gaming controllers and unlock your true gaming potential today!</p>
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 blogger-img">
                    <img src="image/banner1234.jpg" alt="">
                </div>
            </div>
        </div>

        <div class="icon container" style="text-align: center">
            <h2>Sản phẩm mới nhất</h2>
            <div class="row">
                <c:forEach items="${listN}" var="p" >
                    <a href="ShowProductToCart?pID=${p.pID}">
                        <div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 icon-img">
                            <img src="image/${p.imge}" alt="">
                            <h5>${p.pName}</h5>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>

        <div class="container travel">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 title">
                    <h2>TRENDING <span>PRODUCT</span></h2>
                </div>
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 title-travel-1">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 title-travel-1-1">
                        <img src="image/${product.imge}" alt="" style="width: 500px;;object-fit: contain;">
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 title-travel-1-2">
                        <div>
                            <h1> TREND <span style="color: red;">PRODUCT</span></h1>
                            <p>${product.pName}</p>
                            <a href="ShowProductToCart?pID=${product.pID}">
                                <h3>READ MORE</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 title-travel-2">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 title-travel-2-2">
                        <div>
                            <h1>FEATURED <span style="color: red;">PRODUCTS</span></h1>
                            <p>${h.pName}</p>
                            <a href="ShowProductToCart?pID=${h.pID}">
                                <h3>READ MORE</h3>
                            </a>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 title-travel-2-1">
                        <img src="image/${h.imge}" alt="" style="width: 500px;;object-fit: contain;">
                    </div>
                </div>
            </div>
        </div>
        <footer class=" text-lg-start bg-light text-muted">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 footer-text">
                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 footer-text-1">
                    <h1>GAMEPAD</h1>
                </div>
                <div class="col-12 col-sm-12 col-md-9 col-lg-9 col-xl-9 footer-text-2">
                    <h3>Has a base in <span> Ha Noi</span>.<br>You can contact them directly for advice and support</h3>
                </div>
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 footer-texts-1">
                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 footer-texts">
                    <h2>ABOUT THE SHOP</h2>
                    <p>Prestige - High quality - Commitment to exchange if faulty</p>
                </div>
                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 footer-texts">
                    <h2>FACEBOOK FEEDBACK</h2>
                    <p>https://www.facebook.com/nghiiaaa/</p>
                </div>
                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 footer-texts-2">
                    <h2>RECENT NEWS</h2>
                    <h5><i class="far fa-calendar-alt"></i> <span>July 11, 2023</span> Manufacture factory in HN</h5>
                    <h5><i class="far fa-calendar-alt"></i> <span>July 11, 2023</span> Manufacture factory in DN</h5>
                    <h5><i class="far fa-calendar-alt"></i> <span>July 11, 2023</span> Manufacture factory in HCM</h5>
                </div>
                <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 footer-texts">
                    <h2>INSTAGRAM FEED</h2>
                    <p>https://www.instagram.com/nghiaaa.a/</p>
                </div>
            </div>
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2023 Copyright:
                <a class="text-white" href="">NGUYEN VU NGHIA</a>
            </div>
        </footer>
        <!--------end---------------------->
        <div class="login">
            <c:if test="${sessionScope.acc != null}">
                <a class="nav-link" href="updateProfile" style="background: #ddd">${sessionScope.acc.username}</a>
                <a class="nav-link" href="Logout" style="background: graytext">Logout</a>
                <a class="nav-link" href="changepass.jsp" style="background: graytext">Change Pass</a>
                <a class="nav-link" href="ViewBill" style="background: graytext">View Bill</a>
            </c:if>
            <c:if test="${sessionScope.acc == null}">
                <a class="nav-link" href="login.jsp" style="background: graytext">Login</a>
            </c:if>
            
        </div>
        <script src="app.js"></script>
    </body>
</html>
