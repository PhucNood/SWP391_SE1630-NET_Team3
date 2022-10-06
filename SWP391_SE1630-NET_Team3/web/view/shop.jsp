<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="view/images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/fonts/linearicons-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="view/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="view/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/vendor/MagnificPopup/magnific-popup.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="view/css/util.css">
        <link rel="stylesheet" type="text/css" href="view/css/main.css">
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
            .cart{
                color: #808080;
            }
            .cart:hover{
                color: #717fe0;
            }

            .pagination {
                display: flex;
                padding-left: 0;
                list-style: none;
            }
            .pagination-lg .page-l {
                padding: 0.75rem 1.5rem;
                font-size: 1.25rem;
                line-height: 1.5;
            }
            .page-l{
                position: relative;
                display: block;
                padding: 0.5rem 0.75rem;
                margin-left: -1px;
                line-height: 1.25;
                color: #999999;
                background-color: #fff;
                border: 1px solid #e9ecef;
            }


            .pagination-sm .page-l {
                padding: 0.25rem 0.5rem;
                font-size: 0.875rem;
                line-height: 1.5;
            }
            .page-i.active .page-l {
                color: #fff;
                background-color: #808080;
                border-color: #808080;
            }
            .page-i .page-l {
                color: #808080;
                background-color: #fff;
                border-color: #808080;
            }

        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>


        <!-- Product -->
        <div class="bg0 m-t-23 p-b-140">
            <div class="container">
                <div class="flex-w flex-sb-m p-b-52">
                    <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                        <a href="shop?categoryID=0" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(categoryID == 0) ? "how-active1" : ""}">
                            All Products
                        </a>

                        <a href="shop?categoryID=1" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(categoryID == 1) ? "how-active1" : ""}"  >
                            Cues
                        </a>

                        <a href="shop?categoryID=2" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(categoryID == 2) ? "how-active1" : ""}" >
                            Balls
                        </a>

                        <a href="shop?categoryID=3" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(categoryID == 3) ? "how-active1" : ""}" >
                            Tables
                        </a>


                    </div>

                    <div class="flex-w flex-c-m m-tb-10">
                        <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
                            <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
                            <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                            Filter
                        </div>

                        <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                            <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                            <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                            Search
                        </div>
                    </div>

                    <!-- Search product -->
                    <div class="dis-none panel-search w-full p-t-10 p-b-15">
                        <form class="example" action="search" method="get">
                            <input type="text" placeholder="Search by name, brand,.." name="text" value="${requestScope.textSearch}">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>

                    <!-- Filter -->
                    <div class="dis-none panel-filter w-full p-t-10">
                        <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
                            <div class="filter-col1 p-r-15 p-b-27">
                                <div class="mtext-102 cl2 p-b-15">
                                    Sort By
                                </div>

                                <ul>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "search" : "shop"}?sortID=1" class="filter-link stext-106 trans-04 ${(sortID == "1") ? "filter-link-active" :""}">
                                            Price: High to Low
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "search" : "shop"}?sortID=2" class="filter-link stext-106 trans-04 ${(sortID == "2") ? "filter-link-active" :""}">
                                            Price: Low to High
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "search" : "shop"}?sortID=3" class="filter-link stext-106 trans-04 ${(sortID == "3") ? "filter-link-active" :""}">
                                            Sale: High to Low
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="filter-col2 p-r-15 p-b-27">
                                <div class="mtext-102 cl2 p-b-15">
                                    Listed Price
                                </div>

                                <ul>
                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "search" : "shop"}?filterID=0" class="filter-link stext-106 trans-04 ${(filterID == "0") ? "filter-link-active" : ""}">
                                            All
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "search" : "shop"}?filterID=1" class="filter-link stext-106 trans-04 ${(filterID == "1") ? "filter-link-active" : ""}">
                                            $0 - $5.000.000
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "search" : "shop"}?filterID=2" class="filter-link stext-106 trans-04 ${(filterID == "2") ? "filter-link-active" : ""}">
                                            $5.000.000 - $10.000.000
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "search" : "shop"}?filterID=3" class="filter-link stext-106 trans-04 ${(filterID == "3") ? "filter-link-active" : ""}">
                                            $10.000.000 - $100.000.000
                                        </a>
                                    </li>
                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "search" : "shop"}?filterID=4" class="filter-link stext-106 trans-04 ${(filterID == "4") ? "filter-link-active" : ""}">
                                            $100.000.000++
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="filter-col3 p-r-15 p-b-27">
                                <div class="mtext-102 cl2 p-b-15">
                                    Brand
                                </div>

                                <ul>
                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "search" : "shop"}?brandID=0" class="filter-link stext-106 trans-04 ${(brandID == 0 ? "filter-link-active" : "")}">
                                            All
                                        </a>
                                    </li>
                                    <c:forEach items="${listB}" var="i">
                                        <li class="p-b-6">
                                            <a href="${doSearch == "1" ? "search" : "shop"}?brandID=${i.brandID}" class="filter-link stext-106 trans-04 ${(brandID == i.brandID ? "filter-link-active" : "")}">
                                                ${i.title}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>


                        </div>
                    </div>
                </div>

                <div class="row isotope-grid">

                    <h2 style="margin: auto;">${emptyP}</h2>

                    <c:forEach items="${sessionScope.listProduct}" var="i">
                        <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
                            <!-- Block2 -->
                            <div class="block2" style="border: 1px solid #def2f7; height: 360px">
                                <div class="block2-pic hov-img0">
                                    <c:set var="img" value=""/>
                                    <c:forEach begin="0" end="0" var="j" items="${i.list}">
                                        <c:set var="img" value="${j.imgSource}"/>
                                    </c:forEach>
                                    <img src="view/images/${img}" width="250" height="250" >

                                    <a href="productdetail?productID=${i.productID}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
                                        View Detail
                                    </a>
                                </div>

                                <div class="block2-txt flex-w flex-t p-t-14" style="position: absolute;top: 250px; margin-left:5px">
                                    <div class="block2-txt-child1 flex-col-l " style="width: 180px">
                                        <a href="productdetail?productID=${i.productID}" style="font-weight: bold; color: black;height: 50px" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                            ${i.name}
                                        </a>

                                        <div>
                                            <span class="stext-105 cl3" style="width: 125px">
                                                $<fmt:formatNumber pattern="###,###,###.##" value="${i.price*(100-i.sale)*10}"/>
                                                <c:if test="${i.sale !=0}">
                                                    &nbsp;&nbsp;(-${i.sale}%)
                                                </c:if>
                                            </span>

                                            <c:if test="${i.sale !=0}">
                                                <del class="stext-105 cl3">
                                                    $<fmt:formatNumber pattern="###,###,###.##" value="${i.price*1000}"/>
                                                </del>
                                            </c:if>
                                        </div>

                                    </div>

                                    <div class="block2-txt-child2" style="margin-left: 35px; height: 50px">
                                        <a href="view/#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                            <i class="cart zmdi zmdi-shopping-cart" style="font-size:28px"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>


                <div class="col-12 pb-1">
                    <nav aria-label="Page navigation">
                        <c:if test="${sessionScope.listProduct != null}">
                            <ul class="pagination justify-content-center mb-3">
                                <li class="page-i ${page==1?"disabled":""}">
                                    <a class="page-l" href="${doSearch == "1" ? "search" : "shop"}?page=${page-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <c:set var="page" value="${requestScope.page}"/>
                                <c:forEach begin="${1}" end="${requestScope.num}" var="j">
                                    <li class="page-i ${page==j?"active":""}" >
                                        <a class="page-l" href="${doSearch == "1" ? "search" : "shop"}?page=${j}">${j}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-i ${page==num?"disabled":""}">
                                    <a class="page-l" 
                                       href="${doSearch == "1" ? "search" : "shop"}?page=${page+1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </c:if>
                    </nav>
                </div>



            </div>
        </div>


        <!-- Footer -->
        <footer class="bg3 p-t-75 p-b-32">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-lg-3 p-b-50">
                        <h4 class="stext-301 cl0 p-b-30">
                            Categories
                        </h4>

                        <ul>
                            <li class="p-b-10">
                                <a href="view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Women
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Men
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Shoes
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Watches
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-sm-6 col-lg-3 p-b-50">
                        <h4 class="stext-301 cl0 p-b-30">
                            Help
                        </h4>

                        <ul>
                            <li class="p-b-10">
                                <a href="view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Track Order
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Returns 
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Shipping
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    FAQs
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-sm-6 col-lg-3 p-b-50">
                        <h4 class="stext-301 cl0 p-b-30">
                            GET IN TOUCH
                        </h4>

                        <p class="stext-107 cl7 size-201">
                            Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on (+1) 96 716 6879
                        </p>

                        <div class="p-t-27">
                            <a href="view/#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                                <i class="fa fa-facebook"></i>
                            </a>

                            <a href="view/#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                                <i class="fa fa-instagram"></i>
                            </a>

                            <a href="view/#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                                <i class="fa fa-pinterest-p"></i>
                            </a>
                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-3 p-b-50">
                        <h4 class="stext-301 cl0 p-b-30">
                            Newsletter
                        </h4>

                        <form>
                            <div class="wrap-input1 w-full p-b-4">
                                <input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com">
                                <div class="focus-input1 trans-04"></div>
                            </div>

                            <div class="p-t-18">
                                <button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
                                    Subscribe
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="p-t-40">
                    <div class="flex-c-m flex-w p-b-18">
                        <a href="view/#" class="m-all-1">
                            <img src="view/images/icons/icon-pay-01.png" alt="ICON-PAY">
                        </a>

                        <a href="view/#" class="m-all-1">
                            <img src="view/images/icons/icon-pay-02.png" alt="ICON-PAY">
                        </a>

                        <a href="view/#" class="m-all-1">
                            <img src="view/images/icons/icon-pay-03.png" alt="ICON-PAY">
                        </a>

                        <a href="view/#" class="m-all-1">
                            <img src="view/images/icons/icon-pay-04.png" alt="ICON-PAY">
                        </a>

                        <a href="view/#" class="m-all-1">
                            <img src="view/images/icons/icon-pay-05.png" alt="ICON-PAY">
                        </a>
                    </div>

                    <p class="stext-107 cl6 txt-center">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved |Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="view/https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="view/https://themewagon.com" target="_blank">ThemeWagon</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

                    </p>
                </div>
            </div>
        </footer>


        <!-- Back to top -->
        <div class="btn-back-to-top" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="zmdi zmdi-chevron-up"></i>
            </span>
        </div>

        <!-- Modal1 -->
        <div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
            <div class="overlay-modal1 js-hide-modal1"></div>

            <div class="container">
                <div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
                    <button class="how-pos3 hov3 trans-04 js-hide-modal1">
                        <img src="view/images/icons/icon-close.png" alt="CLOSE">
                    </button>

                    <div class="row">
                        <div class="col-md-6 col-lg-7 p-b-30">
                            <div class="p-l-25 p-r-30 p-lr-0-lg">
                                <div class="wrap-slick3 flex-sb flex-w">
                                    <div class="wrap-slick3-dots"></div>
                                    <div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

                                    <div class="slick3 gallery-lb">
                                        <div class="item-slick3" data-thumb="images/product-detail-01.jpg">
                                            <div class="wrap-pic-w pos-relative">
                                                <img src="view/images/product-detail-01.jpg" alt="IMG-PRODUCT">

                                                <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="view/images/product-detail-01.jpg">
                                                    <i class="fa fa-expand"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="item-slick3" data-thumb="images/product-detail-02.jpg">
                                            <div class="wrap-pic-w pos-relative">
                                                <img src="view/images/product-detail-02.jpg" alt="IMG-PRODUCT">

                                                <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="view/images/product-detail-02.jpg">
                                                    <i class="fa fa-expand"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="item-slick3" data-thumb="images/product-detail-03.jpg">
                                            <div class="wrap-pic-w pos-relative">
                                                <img src="view/images/product-detail-03.jpg" alt="IMG-PRODUCT">

                                                <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="view/images/product-detail-03.jpg">
                                                    <i class="fa fa-expand"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-5 p-b-30">
                            <div class="p-r-50 p-t-5 p-lr-0-lg">
                                <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                                    Lightweight Jacket
                                </h4>

                                <span class="mtext-106 cl2">
                                    $58.79
                                </span>

                                <p class="stext-102 cl3 p-t-23">
                                    Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.
                                </p>

                                <!--  -->
                                <div class="p-t-33">
                                    <div class="flex-w flex-r-m p-b-10">
                                        <div class="size-203 flex-c-m respon6">
                                            Size
                                        </div>

                                        <div class="size-204 respon6-next">
                                            <div class="rs1-select2 bor8 bg0">
                                                <select class="js-select2" name="time">
                                                    <option>Choose an option</option>
                                                    <option>Size S</option>
                                                    <option>Size M</option>
                                                    <option>Size L</option>
                                                    <option>Size XL</option>
                                                </select>
                                                <div class="dropDownSelect2"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="flex-w flex-r-m p-b-10">
                                        <div class="size-203 flex-c-m respon6">
                                            Color
                                        </div>

                                        <div class="size-204 respon6-next">
                                            <div class="rs1-select2 bor8 bg0">
                                                <select class="js-select2" name="time">
                                                    <option>Choose an option</option>
                                                    <option>Red</option>
                                                    <option>Blue</option>
                                                    <option>White</option>
                                                    <option>Grey</option>
                                                </select>
                                                <div class="dropDownSelect2"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="flex-w flex-r-m p-b-10">
                                        <div class="size-204 flex-w flex-m respon6-next">
                                            <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                                                <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-minus"></i>
                                                </div>

                                                <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

                                                <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-plus"></i>
                                                </div>
                                            </div>

                                            <button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>	
                                </div>

                                <!--  -->
                                <div class="flex-w flex-m p-l-100 p-t-40 respon7">
                                    <div class="flex-m bor9 p-r-10 m-r-11">
                                        <a href="view/#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
                                            <i class="zmdi zmdi-favorite"></i>
                                        </a>
                                    </div>

                                    <a href="view/#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
                                        <i class="fa fa-facebook"></i>
                                    </a>

                                    <a href="view/#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
                                        <i class="fa fa-twitter"></i>
                                    </a>

                                    <a href="view/#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--===============================================================================================-->	
        <script src="view/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="view/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="view/vendor/bootstrap/js/popper.js"></script>
        <script src="view/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="view/vendor/select2/select2.min.js"></script>
        <script>
                            $(".js-select2").each(function () {
                                $(this).select2({
                                    minimumResultsForSearch: 20,
                                    dropdownParent: $(this).next('.dropDownSelect2')
                                });
                            })
        </script>
        <!--===============================================================================================-->
        <script src="view/vendor/daterangepicker/moment.min.js"></script>
        <script src="view/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="view/vendor/slick/slick.min.js"></script>
        <script src="view/js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script src="view/vendor/parallax100/parallax100.js"></script>
        <script>
                            $('.parallax100').parallax100();
        </script>
        <!--===============================================================================================-->
        <script src="view/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
        <script src="view/vendor/isotope/isotope.pkgd.min.js"></script>
        <!--===============================================================================================-->
        <script src="view/vendor/sweetalert/sweetalert.min.js"></script>
        <script>
                            $('.js-addwish-b2, .js-addwish-detail').on('click', function (e) {
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
        <script src="view/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
                            $('.js-pscroll').each(function () {
                                $(this).css('position', 'relative');
                                $(this).css('overflow', 'hidden');
                                var ps = new PerfectScrollbar(this, {
                                    wheelSpeed: 1,
                                    scrollingThreshold: 1000,
                                    wheelPropagation: false,
                                });

                                $(window).on('resize', function () {
                                    ps.update();
                                })
                            });
        </script>
        <!--===============================================================================================-->
        <script src="view/js/main.js"></script>

    </body>
</html>