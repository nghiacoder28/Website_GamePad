<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UPDATE-USER</title>
        <meta name="viewport"
              content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <link rel="icon" type="image/png" href="image/logoshop.jpg" />

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
                    <a href="Home" class="logo">GAMEPAD</a>
                </li>
            </ul>
            <!-- end nav left -->
            <!-- form -->
            <form class="navbar-search">
                <input type="text" name="Search" class="navbar-search-input" placeholder="What you looking for...">
                <i class="fas fa-search"></i>
            </form>
            <!-- end form -->
            <!-- nav right -->
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
                                    <a class="dropdown-menu-link">
                                        <div>
                                            <i class="fas fa-user-tie"></i>
                                        </div>

                                        <span>Profile ${sessionScope.acc.username}</span>


                                    </a>
                                </li>
                            
                            <li class="dropdown-menu-item">
                                <a href="updateProfile" class="dropdown-menu-link">
                                    <div>
                                        <i class="fas fa-cog"></i>
                                    </div>
                                    <span>Settings</span>
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
                        <form action="editUser" method="post">
                            <div class="card-body container">
                                <div class="row">
                                    <div class="col-10" style="padding-left: 50px;">
                                        <h2 style="color: black;margin-top: 50px;margin-bottom: 30px;">Edit Profile
                                        </h2>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <br>
                                            <input type="text" class="form-control form-control-lg"
                                                   value="${u.username}" readonly>
                                            <input name="aID" type="text" hidden value="${u.accountID}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <br>
                                            <input type="password" name="pass" class="form-control form-control-lg"
                                                   value="${u.pass}" >
                                        </div>
                                        <div class="form-group">
                                            <label>Full Name</label>
                                            <br>
                                            <input type="text" class="form-control form-control-lg"
                                                   value="${u.fName}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleSelectGender">Role</label>
                                            <br>
                                            <select name="role" class="form-control" id="exampleSelectGender">
                                                <option value="0" ${u.role eq 0 ? '' : 'selected'}>Admin</option>
                                                <option value="1" ${u.role eq 1 ? 'selected' : ''}>Customer</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Date Of Birth</label>
                                            <br>
                                            <input type="date" value="${u.dob}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <br>
                                            <input type="text" value="${u.phone}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Address</label>
                                            <br>
                                            <input type="text" value="${u.address}" readonly>
                                        </div>
                                        <div class="col-12" style="margin-top: 50px;margin-bottom: 50px;">
                                            <button type="submit" class="btn btn-dark btn-icon-text">
                                                Submit
                                                <i class="mdi mdi-file-check btn-icon-append"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


            </div>
        </div>
        <!-- end main content -->
        <!-- import script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
        <script src="js/index.js"></script>
    </body>
</html>
