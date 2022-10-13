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
                <div class="flex-w flex-sb-m p-b-52" style="justify-content: end">
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
                                                <fmt:formatNumber pattern="###,###,###.##" value="${i.price*(100-i.sale)*10}"/>₫
                                                <c:if test="${i.sale !=0}">
                                                    &nbsp;&nbsp;(-${i.sale}%)
                                                </c:if>
                                            </span>

                                            <c:if test="${i.sale !=0}">
                                                <del class="stext-105 cl3">
                                                    <fmt:formatNumber pattern="###,###,###.##" value="${i.price*1000}"/>₫
                                                </del>
                                            </c:if>
                                        </div>

                                    </div>

                                    <div class="block2-txt-child2" style="margin-left: 35px; height: 50px">
                                        <a href="${pageContext.request.contextPath}/view/#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
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
                                <a href="${pageContext.request.contextPath}/view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Cues
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="${pageContext.request.contextPath}/view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Ball Sets
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="${pageContext.request.contextPath}/view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Tables
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
                                <a href="${pageContext.request.contextPath}/view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Track Order
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="${pageContext.request.contextPath}/view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Returns 
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="${pageContext.request.contextPath}/view/#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Shipping
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="${pageContext.request.contextPath}/view/#" class="stext-107 cl7 hov-cl1 trans-04">
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
                            Any questions? Let us know at the 9th floor Bilard Shop, Hanoi or call us at 0123456789
                        </p>

                        <div class="p-t-27">
                            <a href="${pageContext.request.contextPath}/view/#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                                <i class="fa fa-facebook"></i>
                            </a>

                            <a href="${pageContext.request.contextPath}/view/#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                                <i class="fa fa-instagram"></i>
                            </a>

                            <a href="${pageContext.request.contextPath}/view/#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
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
                        <a href="${pageContext.request.contextPath}/view/#" class="m-all-1">
                            <img src="${pageContext.request.contextPath}/view/images/icons/icon-pay-01.png" alt="ICON-PAY">
                        </a>

                        <a href="${pageContext.request.contextPath}/view/#" class="m-all-1">
                            <img src="${pageContext.request.contextPath}/view/images/icons/icon-pay-02.png" alt="ICON-PAY">
                        </a>

                        <a href="${pageContext.request.contextPath}/view/#" class="m-all-1">
                            <img src="${pageContext.request.contextPath}/view/images/icons/icon-pay-03.png" alt="ICON-PAY">
                        </a>

                        <a href="${pageContext.request.contextPath}/view/#" class="m-all-1">
                            <img src="${pageContext.request.contextPath}/view/images/icons/icon-pay-04.png" alt="ICON-PAY">
                        </a>

                        <a href="${pageContext.request.contextPath}/view/#" class="m-all-1">
                            <img src="${pageContext.request.contextPath}/view/images/icons/icon-pay-05.png" alt="ICON-PAY">
                        </a>
                    </div>

                    <p class="stext-107 cl6 txt-center">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="${pageContext.request.contextPath}/view/https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="${pageContext.request.contextPath}/view/https://themewagon.com" target="_blank">ThemeWagon</a>
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





        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>

    </body>
</html>