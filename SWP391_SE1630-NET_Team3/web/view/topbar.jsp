<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Billard Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/view/images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/fonts/linearicons-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/MagnificPopup/magnific-popup.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/util.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/main.css">
        <!--===============================================================================================-->
        <style>
            * {
                box-sizing: border-box;
            }
            /* Style the search field */
            form.example input[type=text] {
                padding: 10px;
                font-size: 17px;
                border: 1px solid grey;
                float: left;
                width: 40%;
                background: white;
                margin-left: 55%;
            }

            /* Style the submit button */
            form.example button {
                float: left;
                width: 5%;
                padding: 10px;
                background: #f2f2f2;
                color: #888888;
                font-size: 17px;
                border: 1px solid grey;
                border-left: none; /* Prevent double borders */
                cursor: pointer;
            }

            form.example button:hover {
                background: #717fe0;
                float: left;
                width: 5%;
                padding: 10px;
                color: white;
                font-size: 17px;
                border: 1px solid grey;
                border-left: none; /* Prevent double borders */
                cursor: pointer;
            }

            /* Clear floats */
            form.example::after {
                content: "";
                clear: both;
                display: table;
            }
        </style>
    </head>
    <body class="animsition">
        <!-- Header -->
        <header class="header-v2">
            <!-- Header desktop -->
            <div class="container-menu-desktop trans-03">
                <div class="wrap-menu-desktop">
                    <nav class="limiter-menu-desktop p-l-45">

                        <!-- Logo desktop -->		
                        <a href="home" class="logo">


                            <img src="${pageContext.request.contextPath}/view/images/T3.jpg" alt="IMG-LOGO">


                        </a>

                        <!-- Menu desktop -->
                        <div class="menu-desktop">
                            <ul class="main-menu">
                                <li class="${inPage == "home" ? "active-menu" :""}">
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </li>

                                <li class="${inPage == "shop" ? "active-menu" :""}">
                                    <a href="${pageContext.request.contextPath}/shop">Shop</a>
                                </li>

                                <li class="${inPage == "blogList" ? "active-menu" :""}">
                                    <a href="${pageContext.request.contextPath}/blogList">Blog</a>
                                </li>

                                <li class="${inPage == "about" ? "active-menu" :""}">

                                    <a href="${pageContext.request.contextPath}/about">About</a>
                                </li>

                                <li class="${inPage == "contact" ? "active-menu" :""}">
                                    <a href="${pageContext.request.contextPath}/contact">Contact</a>

                                </li>

                                <%--<c:if test="${account !=null && (account.role == 1 || account.role == 2  )}">--%>
                                    <li class="${inPage == "manage" ? "active-menu" :""}">

                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                                        <b style="font-weight: normal"> Manage Shop</b>
                                    </a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <c:if test="${account.role == 1 }">
                                        <a href="${pageContext.request.contextPath}/manageAccount?all=1" class="dropdown-item">Manage Account</a>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/manageProduct" class="dropdown-item">Manage Product</a>
                                        <a href="${pageContext.request.contextPath}/ManageBlog" class="dropdown-item">Manage Blog</a>

                                    </div>

                                </li>
                                <%--</c:if>--%>
                            </ul>
                        </div>	

                        <!-- Icon header -->
                        <div class="wrap-icon-header flex-w flex-r-m h-full">
                            <ul class="main-menu">
                                <c:if test="${sessionScope.account==null}">
                                    <li class="${inPage == "login" ? "active-menu" :""}">
                                        <a href="${pageContext.request.contextPath}/login">Login</a>
                                    </li>

                                    <li class="${inPage == "signup" ? "active-menu" :""}">
                                        <a href="${pageContext.request.contextPath}/signup">Sign Up</a>
                                    </li>
                                </c:if>

                            </ul>


                            <div class="flex-c-m h-full p-l-18 p-r-25 bor5">
                                <a href="${pageContext.request.contextPath}/showCart"/>
                                <c:if test="${size != null}">
                                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti" data-notify="${size}">
                                        <i class="zmdi zmdi-shopping-cart ${inPage == "cart" ? "active-menu" :""}"></i>
                                    </div>
                                </c:if>
                                <c:if test="${size == null}">
                                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11">
                                        <i class="zmdi zmdi-shopping-cart" ></i>
                                    </div>
                                </c:if>
                            </div>
                            <div class="flex-c-m h-full p-r-24">
                                <c:if test="${sessionScope.account!=null}">
                                    <c:set var="acc" value="${sessionScope.account}"/>
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                                        <b> ${account.user}${acc.role==1 ? "(Admin)" : ""}</b>
                                    </a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="information" class="dropdown-item">Edit profile</a>
                                        <a href="changepass" class="dropdown-item">Change password</a>
                                        <a href="signout" class="dropdown-item">Sign Out</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                </div>	
            </div>

            <!-- Modal Search -->
            <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
                <div class="container-search-header">
                    <form class="wrap-search-header flex-w p-l-15" action="search" method="get">
                        <button type="submit" class="flex-c-m trans-04">
                            <i class="zmdi zmdi-search"></i>
                        </button>
                        <input class="plh3" type="text" name="text" placeholder="Search...">
                    </form>
                </div>
            </div>
        </header>



        <!--===============================================================================================-->	
        <script src="${pageContext.request.contextPath}/view/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/bootstrap/js/popper.js"></script>
        <script src="${pageContext.request.contextPath}/view/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/select2/select2.min.js"></script>
        <script>
            $(".js-select2").each(function () {
                $(this).select2({
                    minimumResultsForSearch: 20,
                    dropdownParent: $(this).next('.dropDownSelect2')
                });
            });
        </script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/daterangepicker/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/view/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/slick/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/view/js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/parallax100/parallax100.js"></script>
        <script>
            $('.parallax100').parallax100();
        </script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
        <script>
            $('.gallery-lb').each(function () { // the containers for all your galleries
                $(this).magnificPopup({
                    delegate: 'a', // the selector for gallery item
                    type: 'image',
                    gallery: {
                        enabled: true
                    },
                    mainClass: 'mfp-fade'
                });
            });
        </script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/isotope/isotope.pkgd.min.js"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/sweetalert/sweetalert.min.js"></script>
        <script>
            $('.js-addwish-b2').on('click', function (e) {
                e.preventDefault();
            });

            $('.js-addwish-b2').each(function () {
                var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
                $(this).on('click', function () {
                    swal(nameProduct, "is added to wishlist !", "success");

                    $(this).addClass('js-addedwish-b2');
                    $(this).off('click');
                });
            });

            $('.js-addwish-detail').each(function () {
                var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

                $(this).on('click', function () {
                    swal(nameProduct, "is added to wishlist !", "success");

                    $(this).addClass('js-addedwish-detail');
                    $(this).off('click');
                });
            });

            /*---------------------------------------------*/

            $('.js-addcart-detail').each(function () {
                var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
                $(this).on('click', function () {
                    swal(nameProduct, "is added to cart !", "success");
                });
            });
        </script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
            $('.js-pscroll').each(function () {
                $(this).css('position', 'relative');
                $(this).css('overflow', 'hidden');
                var ps = new PerfectScrollbar(this, {
                    wheelSpeed: 1,
                    scrollingThreshold: 1000,
                    wheelPropagation: false
                });

                $(window).on('resize', function () {
                    ps.update();
                });
            });
        </script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>

    </body>
</html>