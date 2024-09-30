
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--        <link rel="stylesheet" href="style.css">-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style/Giohang.css">
        <link rel="stylesheet" href="style/product.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <title>PROFILE</title>
    </head>

    <body>
        <section>
            <div class="bannerVideo" id="slideshow">
                <img src="image/banner.jpg" alt="">
                <h2>GAMEPAD</h2>
            </div>
            <div class="container1">
                <header class="navbar" id="navbar">

                    <ul>
                        <li>
                            <a href="Home" class="active">Home</a>
                        </li>
                        <li>
                            <a href="listProduct">PRODUCT</a>
                        </li>
                        <li><a href="ListCart"><i class="fa fa-shopping-bag"></i> <span></span></a></li>
                    </ul>
                    <span class="menuIcon" onclick="toggleMenu();"></span>
                </header>
            </div>
        </section>
        <div class="h1-g">
        </div>
        <div class="container-fluid page-body-wrapper">
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body container">
                                    <form action="updateProfile" method="post">
                                        <div class="row">
                                            <div class="col-10" style="padding-left: 50px; font-size: 30px">
                                                <h2 style="color: black;margin-top: 50px;margin-bottom: 30px;">Profile
                                                </h2>
                                                <div class="form-group">
                                                    <label>Full Name</label>
                                                    <input name="fname" type="text" class="form-control form-control-lg"
                                                           placeholder="Username" aria-label="Username" value="${user.fName}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Phone</label>
                                                    <input name="phone" type="number" class="form-control form-control-lg"
                                                           placeholder="Username" aria-label="Phone" value="${user.phone}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Brithday</label>
                                                    <input name="date" type="date" class="form-control form-control-lg"
                                                           placeholder="Username" aria-label="Username" value="${user.dob}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input name="address" type="text" class="form-control form-control-lg"
                                                           placeholder="Username" aria-label="Username" value="${user.address}">
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-12" style="margin-top: 50px;margin-bottom: 50px;">
                                                        <button type="submit" class="btn btn-dark btn-icon-text">
                                                            SUBMIT
                                                            <i class="mdi mdi-file-check btn-icon-append"></i>
                                                        </button>
                                                        <br>
                                                        <a href="Home" style="font-size: 25px;">Back</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


        <!-- The Modal -->
        <div class="modal fade" id="modal-delete" style="padding-top: 200px;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Xóa</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        Bạn có chắc chắn xóa không?
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-secondary" id="button-delete" data-dismiss="modal">Xóa</button>
                    </div>

                </div>
            </div>
        </div>

        <div class="modal fade" id="modal-delete-all" style="padding-top: 200px;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Xóa tất cả</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        Bạn có chắc chắn xóa tất cả sản phẩm không?
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="DeleteAll()">Xóa</button>
                    </div>

                </div>
            </div>
        </div>
        <!-- The Modal -->
        <div class="modal fade" id="modal-delete" style="padding-top: 200px;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Xóa</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        Bạn có chắc chắn xóa không?
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-secondary" id="button-delete" data-dismiss="modal">Xóa</button>
                    </div>

                </div>
            </div>
        </div>

        <div class="modal fade" id="modal-delete-all" style="padding-top: 200px;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Xóa tất cả</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        Bạn có chắc chắn xóa tất cả sản phẩm không?
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="DeleteAll()">Xóa</button>
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
        <div class="login">
                <c:if test="${sessionScope.acc != null}">
                    <a class="nav-link" href="updateProfile" style="background: #ddd">${sessionScope.acc.username}</a>
                    <a class="nav-link" href="Logout" style="background: graytext">Logout</a>
                    <a class="nav-link" href="changepass.jsp" style="background: graytext">ChangePass</a>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <a class="nav-link" href="login.jsp" style="background: graytext">Login</a>
                </c:if>
        </div>
        <script src="Giohang.js"></script>

    </body>
</html>
