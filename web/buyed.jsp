
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
        <title>Đơn hàng</title>
    </head>

    <body>
        <section>
            <div class="bannerVideo" id="slideshow">
                <img src="image/banner1.jpg" alt="">
                <h2>GAMEPAD</h2>
            </div>
            <div class="container1">
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
            </div>
        </section>
        <div class="h1-g">
        </div>

        <div style="margin-left: 120px;font-size: 20px;color: green;">
            <span>Đơn Hàng</span> 
            <hr>
        </div>
        <div class="card-content" style="display: flex;  position: relative;" >


            <table class="table" style="width: 700px;margin-left: 120px;margin-bottom: 100px;">
                <thead>
                    <tr >
                        <th scope="col">Hình ảnh</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">name</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Total</th>
                        <th scope="col">Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="totals" value="0"/>
                    <c:forEach items="${listC}" var="cart">
                        <c:set var="total" value="${(totals + cart.quality) * cart.price}"/>
                        <tr>
                            <td style="width: 200px">
                                <img src="image/${cart.imge}" alt="" style="width: 200px"/>
                            </td>
                            <td style="width: 100px;">
                                <h5 class="product-titles" style="text-align: center;">${cart.quality}</h5>
                            </td>
                            <td style="width: 100px;">
                                <h5 class="product-titles" style="text-align: center;">${cart.pName}</h5>
                            </td>
                            <td style="width: 100px;">
                                <h5 class="product-titles" style="text-align: center;">$${cart.price}</h5>
                            </td>
                            <td style="width: 100px;">
                                <h5 class="product-titles" style="text-align: center;">$${total}</h5>
                            </td>
                            <c:if test="${cart.status == 1}">
                                <td class="shoping__cart__status">
                                    Đợi phê duyệt
                                </td>
                                <td style="width: 100px;">
                                    <a type="submit" href="AcceptCart?cID=${cart.cID}" style="text-align: center;">
                                        <span class="btn btn-sm btn-danger">
                                            Cancel
                                        </span>
                                    </a>
                                </td>
                            </c:if>
                            <c:if test="${cart.status == 2}">
                                <td class="shoping__cart__status" style="color: red">
                                    Canceled
                                </td>
                            </c:if>
                            <c:if test="${cart.status == 3}">
                                <td class="shoping__cart__status" style="color: blue">
                                    Transported
                                </td>
                            </c:if>
                            <c:if test="${cart.status == 4}">
                                <td class="shoping__cart__status" style="color: greenyellow">
                                    Done
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>

                </tbody>

            </table>
                    <a href="Home" style="font-size: 25px;">Back</a>
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
                <a class="nav-link" href="changepass.jsp" style="background: graytext">Change Pass</a>
                <a class="nav-link" href="ViewBill" style="background: graytext">View Bill</a>
            </c:if>
            <c:if test="${sessionScope.acc == null}">
                <a class="nav-link" href="login.jsp" style="background: graytext">Login</a>
            </c:if>
            
        </div>
        <script src="Giohang.js"></script>

    </body>
</html>
