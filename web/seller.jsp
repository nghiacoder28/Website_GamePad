<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELLER</title>
        <meta name="viewport"
              content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <link rel="icon" type="image/png" href="image/logoshop.jpg" />

        <!-- Import lib -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
        <link rel="stylesheet" type="text/css" href="fontawesome-free/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <!-- End import lib -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
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
                    <a href="Home" class="logo">GAMEPAD</a>
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
                        <ul id="user-menu" class="dropdown-menu">
                            <c:if test="${sessionScope.acc != null}">
                                

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
                            </c:if>
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
                <div class="col-8 col-m-12 col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h3>

                            </h3>
                            <i class="fas fa-ellipsis-h"></i>
                        </div>
                        <div class="card-content">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Images</th>
                                        <th>Number</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listP}" var="p">

                                        <tr>
                                            <td>${p.pID}</td>
                                            <td>${p.pName}</td>
                                            <td><img src="image/${p.imge}" alt="" style="width: 200px;"></td>
                                            <td>${p.quality}</td>
                                            <td>$${p.price}</td>
                                            <td><button><a href="editProduct?pid=${p.pID}">Edit</a></button>
                                                <button><a href="deletProduct?pid=${p.pID}">Delete</a></button>
                                            </td>
                                        </tr>


                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <ul class="listPage" style="text-align: center">
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="${numPage == i ? "active":""}">
                                    <a href="seller?index=${i}">
                                        ${i}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="product-categories">
                    <h1>PRODUCT CATEGORIES</h1>
                    <ul class="list-group">
                        <c:forEach items="${listC}" var="c">
                            <li class="list-group-item text-white"><a href="listBrandseller?bName=${c.bID}">${c.bName}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!-- end main content -->
        <!-- import script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
        <script src="js/index.js"></script>
        <style>
            ul.listPage {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            ul.listPage li {
                display: inline-block;
                margin-right: 10px;
            }

            ul.listPage li.active a {
                background-color: #4CAF50;
                color: white;
                padding: 6px 12px;
                border-radius: 5px;
            }

            ul.listPage li a {
                display: block;
                text-decoration: none;
                color: #333;
                padding: 6px 12px;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            ul.listPage li a:hover {
                background-color: #f2f2f2;
            }
        </style>
    </body>
</html>
