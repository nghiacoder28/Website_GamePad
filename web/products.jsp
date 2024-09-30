
<js
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>PRODUCT</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
                  integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
                  crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="style/products.css">
            <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        </head>

        <body>
            <section>
                <div class="bannerVideo" id="slideshow">
                    <img src="image/banner.jpg" alt="">
                    <h2>PRODUCTS</h2>
                </div>
                <div class="container1">
                    <header class="navbar" id="navbar">
                        <a href="#" class="logo">GAMEPAD</a>
                        <ul>
                            <li>
                                <a href="Home">Home</a>
                            </li>
                            <li>
                                <a href="listProduct" class="active">RPODUCT</a>
                            </li>
                            <li><a href="ListCart"><i class="fa fa-shopping-bag"></i> <span></span></a></li>
                        </ul>
                        <span class="menuIcon" onclick="toggleMenu();"></span>
                    </header>
                </div>
            </section>
            <form action="CartProduct" method="POST">
                <div class="product container">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                            <img src="image/${s.imge}" alt="">
                            <input name="pid" value="${s.pID}" hidden>
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 product-text">
                            <h1>${s.pName}</h1>
                            <h5>${s.price}$</h5>
                            <h5>Quality: ${s.quality}</h5>
                            
                            <div class="start">
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <div class="size">
                                <h2>Select</h2>
                                <input name="quality" type="number" value="1" min="1" max="${s.quality}">
                                <div class="cart">
                                    <button type="submit" style="padding: 10px 40px;border: none;margin: 30px 0px;">Add To Cart</button>

                                </div>	                      
                            </div>
                            <h5>Category: Gamepad</h5>
                        </div>

                    </div>
                </div>
            </form>
            <div class="tabs container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#home">DESCRIPTION</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu1">ADDITIONAL INFORMATION</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu2">REVIEWS (1)</a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane container active" id="home">
                        <p style="padding-top: 30px;padding-bottom: 30px;">
                            <p>* Apply for: IOS, WINDOW, LINUX</p>
                            <p>* Smooth operation </p>
                            <p>* Superior operational technology</p>
                        </p>
                    </div>
                    <div class="tab-pane container fade" id="menu1">
                        <h5 style="padding-top: 30px;">* Weight: 0.3kg</h5>
                        <h5 style="padding-bottom: 30px;">* Product warranty up to 3 years</h5>
                    </div>
                    <div class="tab-pane container fade" id="menu2">This is the best-selling product in recent years, it is very popular to buy because it has many conveniences</div>
                </div>
            </div>
            <!-- end -->
            <!-- start -->
            <div class="product-list container">
                <h1>Recommend related products</h1>
                <div class="row">
                    <form action="ShowProductToCart" method="post">
                        <c:forEach items="${listN}" var="p">
                            <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 product-left-1">
                                <img src="image/${p.imge}" alt="">
                                <div class="product-left-text">
                                    <h5>${p.price}$</h5>
                                    <div>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    <h4>${p.pName}</h4>
                                </div>
                                <button><a href="ShowProductToCart?pID=${p.pID}">ADD TO CART</a></button>

                            </div>
                        </c:forEach>
                    </form>
                </div>
            </div>
            <!-- end -->
            <!-- start -->
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
            <!-- end -->
            <div class="login">
                
                    
                    <c:if test="${sessionScope.acc != null}">
                        <a class="nav-link" href="updateProfile" style="background: #ddd">${sessionScope.acc.username}</a>
                        <a class="nav-link" href="Logout" style="background: graytext">Logout</a>
                        <a class="nav-link" href="changepass.jsp" style="background: graytext">ChangePass</a>
                    </c:if>
                    <c:if test="${sessionScope.acc == null}">
                        <a class="nav-link" href="login.jsp" style="background: graytext" style="background: graytext">Login</a>
                    </c:if>
               
                <a href="ViewBill" class="bxcart">
                    <i class='bx bx-cart'></i>
                </a>
            </div>

            <script>
                window.addEventListener("scroll", function () {
                    var header = this.document.querySelector('header');
                    header.classList.toggle('sticky', window.scrollY > 0);
                });
                function toggleMenu() {
                    const menuIcon = document.querySelector('.menuIcon');
                    const navbar = document.getElementById('navbar');
                    menuIcon.classList.toggle('active');
                    navbar.classList.toggle('active');
                }
            </script>
        </body>
    </html>
