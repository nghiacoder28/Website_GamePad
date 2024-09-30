
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LIST CART USER</title>
        <meta name="viewport"
              content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <link rel="icon" type="image/png" href="image/logoshop.jpg" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- Import lib -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
        <link rel="stylesheet" type="text/css" href="fontawesome-free/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <!-- End import lib -->

        <link rel="stylesheet" type="text/css" href="style/sell.css">
    </head>

    <body class="overlay-scrollbar">
        <!-- navbar -->
        <div class="navbar">
            <!-- nav left -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link">
                        <i class="fas fa-bars" onclick="collapseSidebar()"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="index.jsp" class="logo">GAMEPAD</a>
                </li>
            </ul>
            <ul class="navbar-nav nav-right">
                <li class="nav-item mode">
                    <a class="nav-link" href="#" onclick="switchTheme()">
                        <i class="fas fa-moon dark-icon"></i>
                        <i class="fas fa-sun light-icon"></i>
                    </a>
                </li>
                <li class="nav-item avt-wrapper">
                    <div class="avt dropdown">
                        <img src="image/chamsoc.png" alt="User image" class="dropdown-toggle" data-toggle="user-menu">
                        <ul id="user-menu" class="dropdown-menu"    >
                            <c:if test="${sessionScope.acc != null}">

                            </c:if>
                            <li class="dropdown-menu-item">
                                <a href="updateProfile" class="dropdown-menu-link">
                                    <div>
                                        <i class="fas fa-user-tie"></i>
                                    </div>
                                    <span>Profile Admin</span>
                                </a>
                            </li>
                            <li class="dropdown-menu-item">
                                <a href="Logout" class="dropdown-menu-link">
                                    <div>
                                        <i class="fas fa-sign-out-alt"></i>
                                    </div>
                                    <span>Logout</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
            <!-- end nav right -->
        </div>
        <!-- end navbar -->
        <!-- sidebar -->
        <div class="sidebar">
            <ul class="sidebar-nav">

                <li class="sidebar-nav-item">
                    <a href="seller" class="sidebar-nav-link">
                        <div>
                            <i class="fab fa-accusoft"></i>
                        </div>
                        <span>PRODUCT</span>
                    </a>
                </li>
                <li class="sidebar-nav-item">
                    <a href="addproduct" class="sidebar-nav-link">
                        <div>
                            <i class="fas fa-tasks"></i>
                        </div>
                        <span>ADD PRODUCT</span>
                    </a>
                </li>
                <li class="sidebar-nav-item">
                    <a href="listUser" class="sidebar-nav-link">
                        <div>
                            <i class="fas fa-spinner"></i>
                        </div>

                        <span>MANAGER ADMIN</span>

                    </a>
                </li>
                <li class="sidebar-nav-item">
                    <a href="listCart" class="sidebar-nav-link">
                        <div>
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <span>BILL</span>
                    </a>
                </li>

            </ul>
        </div>
        <!-- end sidebar -->
        <!-- main content -->
        <div class="wrapper">
            <div class="row">
                <div class="col-12 col-m-12 col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h3>

                            </h3>
                            <i class="fas fa-ellipsis-h"></i>
                        </div>
                        <div class="card-content">
                            <form action="listCart" method="post"> 
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>Name Product</th>
                                            <th>Brand</th>
                                            <th>Price</th>
                                            <th>Quality</th>
                                            <th>UserName</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listCart}" var="cart">
                                            <tr>

                                                <td style="width: 100px">
                                                    <img src="image/${cart.imge}" alt="" style="width: 200px"/>
                                                </td>
                                                <td style="width: 100px;">
                                                    <h5 class="product-titles" style="text-align: center;">${cart.pName}</h5>
                                                </td>
                                                <td style="width: 100px;">
                                                    <h5 class="product-titles" style="text-align: center;">${cart.bName}</h5>
                                                </td>
                                                <td style="width: 100px;">
                                                    <h5 class="product-titles" style="text-align: center;">${cart.price}</h5>
                                                </td>
                                                <td style="width: 100px;">
                                                    <h5 class="product-titles" style="text-align: center;">${cart.quality}</h5>
                                                </td>
                                                <td style="width: 100px;">
                                                    <h5 class="product-titles" style="text-align: center;">${cart.fName}</h5>
                                                </td>
                                                <td style="width: 100px;">
                                                    <h5 class="product-titles" style="text-align: center;">${cart.phone}</h5>
                                                </td>
                                                <td style="width: 100px;">
                                                    <h5 class="product-titles" style="text-align: center;">${cart.address}</h5>
                                                </td>
                                                <td style="width: 100px;">
                                                    <c:if test="${cart.status == 1}">
                                                        <input value="${cart.cID}" name="cID" hidden>
                                                        <input value="3" name="status" hidden>
                                                        <button type="submit" style="text-align: center;">
                                                            <span class="btn btn-sm btn-danger">
                                                                Accept
                                                            </span>
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${cart.status == 1}">
                                                        <a href="CanceBillSale?cancel=${cart.cID}">
                                                            <button type="button" style="text-align: center;">
                                                                <span class="btn btn-sm btn-danger">
                                                                    Cancel
                                                                </span>
                                                            </button>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${cart.status == 2}">
                                                        <span class="btn btn-sm btn-danger">
                                                            Canceled
                                                        </span>
                                                    </c:if>
                                                    <c:if test="${cart.status == 3}">
                                                        <input value="${cart.cID}" name="cID" hidden>
                                                        <input value="4" name="status" hidden>
                                                        <button type="submit" style="text-align: center;">
                                                            <span class="btn btn-sm btn-primary">
                                                                Transported
                                                            </span>
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${cart.status == 4}">
                                                        <span class="btn btn-sm btn-success">
                                                            Done
                                                        </span>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- end main content -->
        <!-- import script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
        <script src="js/index.js"></script>
        <!-- end import script -->
    </body>
</html>
