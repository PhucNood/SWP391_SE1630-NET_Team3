<%-- 
    Document   : cart
    Created on : Oct 24, 2022, 9:12:04 PM
    Author     : admin
--%>

<<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Billard Shop</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>

            #cart_items .cart_info .image {
                padding-left: 30px;
            }
            .table>thead:first-child>tr:first-child>td {
                border-top: 0;
            }
            .cart_info table tr td {
                border-top: 0 none;
                vertical-align: inherit;
            }
            .table-condensed>thead>tr>td {
                padding: 5px;
            }
            #cart_items .cart_info .cart_menu {
                background: #999999;
                color: #fff;
                font-size: 20px;
                font-family: 'Roboto', sans-serif;
                font-weight: normal;
            }
            .row-s:after {
                clear: both;
            }
            .row-s:after {
                display: table;
                content: " ";
            }
            .row-s {
                display: block !important;
                margin-right: -15px;
                margin-left: -15px;
            }
            @media (min-width: 768px){
                .col-sm-6 {
                    width: 50% !important;
                }
            }
            .heading h3 {
                color: #363432;
                font-size: 20px;
                font-family: 'Roboto', sans-serif;
            }
            #do_action .total_area, #do_action .chose_area {
                border: 1px solid #E6E4DF;
                color: #696763;
                padding: 30px 25px 30px 0;
                margin-bottom: 80px;
            }
            .total_area ul li {
                background: #E6E4DF;
                color: #696763;
                margin-top: 10px;
                padding: 7px 20px;
            }
            ul li {
                list-style: none !important;
            }

            .update, .check_out {
                background: #999999 !important;
                border-radius: 0 !important;
                color: #FFFFFF !important;
                margin-top: 18px !important;
                border: none !important;
                padding: 5px 15px !important;
            }
            .update {
                margin-left: 40px;
            }
            .check_out {
                margin-left: 20px;
            }


            .info{
                color: black;
            }
            .button {
                background-color: #808080; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                width: 80px;
                height: 80px;
            }
            .btn{
                background-color: white; /* Green */
                border: 2px solid #555555 !important;
                color: black;
                padding: 16px 32px;
                text-align: center;
                display: inline-block !important;
                font-size: 16px;
                margin: 8px 0px !important;
                transition-duration: 0.4s;
                /*cursor: pointer;*/
            }
            .btn1:hover {
                background-color: #555555;
                color: white;
            }
            .btn:disabled{
                border: 1px solid gainsboro;
                background-color: #E6E4DF;
            }
            .sticky{
                margin-left: 0px;
                font-size: 20px;
                width: 10%;
                height: 20%;
                position: sticky;
                bottom: 0px;
                background: #f0f0f0;
                border-top-right-radius: 80px;
            }

            html {
                box-sizing: border-box;
            }
            *,
            *:before,
            *:after {
                box-sizing: inherit;
            }

            .table-scroll {
                position: relative;
                width:100%;
                z-index: 1;
                margin: auto;
                overflow: auto;
                height: 500px;
            }
            .table-scroll table {
                width: 100%;
                min-width: 1000px;
                margin: auto;
                border-collapse: separate;
                border-spacing: 0;
            }
            .table-wrap {
                position: relative;
            }
            .table-scroll th,
            .table-scroll td {
                padding: 5px 10px;
                border: 1px solid #f8f8f8;
                background: #fff;
                vertical-align: top;
            }
            .table-scroll thead th {
                background: #808080;
                color: #fff;
                position: -webkit-sticky;
                position: sticky;
                top: 0;
            }
            .relative{
                position: relative;
            }
            .absolute1{
                position: absolute;
                left: 0;
            }
            .absolute2{
                position: absolute;
                right: 0;
            }
            .absolute3{
                position: absolute;
                left: 155px;
            }


        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>

        <div class="container">
            <div class="table-wrapper">
                <a href=""  class="" ></a>

                <div class="flex-w flex-sb-m p-b-52 " style="justify-content: end">
                    <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                        <a href="showCart?categoryID=0" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(categoryID == 0) ? "how-active1" : ""}">
                            All Products
                        </a>

                        <a href="showCart?categoryID=1" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(categoryID == 1) ? "how-active1" : ""}"  >
                            Cues
                        </a>

                        <a href="showCart?categoryID=2" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(categoryID == 2) ? "how-active1" : ""}" >
                            Balls
                        </a>

                        <a href="showCart?categoryID=3" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(categoryID == 3) ? "how-active1" : ""}" >
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
                        <form class="example" action="searchInManage" method="get">
                            <input type="text" placeholder="Search by name, brand,.." name="text" value="${requestScope.textSearch}" id="text" onfocusout="formValidate()">
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
                                        <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?sortID=1" class="filter-link stext-106 trans-04 ${(sortID == "1") ? "filter-link-active" :""}">
                                            Price: High to Low
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?sortID=2" class="filter-link stext-106 trans-04 ${(sortID == "2") ? "filter-link-active" :""}">
                                            Price: Low to High
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?sortID=3" class="filter-link stext-106 trans-04 ${(sortID == "3") ? "filter-link-active" :""}">
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
                                        <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?filterID=0" class="filter-link stext-106 trans-04 ${(filterID == "0") ? "filter-link-active" : ""}">
                                            All
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?filterID=1" class="filter-link stext-106 trans-04 ${(filterID == "1") ? "filter-link-active" : ""}">
                                            $0 - $5.000.000
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?filterID=2" class="filter-link stext-106 trans-04 ${(filterID == "2") ? "filter-link-active" : ""}">
                                            $5.000.000 - $10.000.000
                                        </a>
                                    </li>

                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?filterID=3" class="filter-link stext-106 trans-04 ${(filterID == "3") ? "filter-link-active" : ""}">
                                            $10.000.000 - $100.000.000
                                        </a>
                                    </li>
                                    <li class="p-b-6">
                                        <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?filterID=4" class="filter-link stext-106 trans-04 ${(filterID == "4") ? "filter-link-active" : ""}">
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
                                        <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?brandID=0" class="filter-link stext-106 trans-04 ${(brandID == 0 ? "filter-link-active" : "")}">
                                            All
                                        </a>
                                    </li>
                                    <c:forEach items="${listB}" var="i">
                                        <li class="p-b-6">
                                            <a href="${doSearch == "1" ? "searchInManage" : "showCart"}?brandID=${i.brandID}" class="filter-link stext-106 trans-04 ${(brandID == i.brandID ? "filter-link-active" : "")}">
                                                ${i.title}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>


                        </div>
                    </div>
                </div>
                <section id="cart_items">
                    <div class="container">
                        <div class="table-responsive cart_info table-scroll" id="table-scroll">
                            <table class="table table-condensed main-table" id="main-table">
                                <thead>
                                    <tr class="cart_menu">
                                        <th class="image">No</th>
                                        <th class="image">Product</th>
                                        <th class="name">Image</th> 
                                        <th class="description">Quantity</th>
                                        <th class="price">Price</th>
                                        <th class="price">Sale</th>
                                        <th class="quantity">Total Money</th>
                                        <th class="total">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="showOut">
                                    <c:if test="${cart != null}">
                                        <c:set var="i" value="${requestScope.cart}"/>
                                        <c:set var="tt" value="0"/>
                                        <c:forEach items="${i.items}" var="o">
                                            <c:set var="tt" value="${tt+1}"/>
                                            <tr class="info">
                                                <td class="cart_product">${tt}</td>
                                                <td class="cart_product">${o.product.name}</td>
                                                <c:set var="img" value=""/>
                                                <c:forEach begin="0" end="0" var="j" items="${o.product.list}">
                                                    <c:set var="img" value="${j.imgSource}"/>
                                                </c:forEach>
                                                <td class="cart_img">
                                                    <img src="view/images/${img}" width="120px" alt="">
                                                </td>
                                                <td class="cart_quantity" style="clear: both;">
                                                    <c:if test="${o.quantity > 1}">
                                                        <button >
                                                            <a href="updown?num=-1&id=${o.product.productID}"  class="btn btn1">-</a>
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${o.quantity == 1}">
                                                        <div class="btn" style="background-color: #E6E4DF;">
                                                            -
                                                        </div>
                                                    </c:if>
                                                    <input id="inputnumber${o.product.productID}" onchange="reloadnumber(${o.product.productID})" style="text-align: center" 
                                                           class="btn" type="text" name="quantity" value="${o.quantity}" size="2"/>
                                                    <button>
                                                        <a href="updown?num=1&id=${o.product.productID}" class="btn btn1">+</a>
                                                    </button>
                                                    <c:if test="${maximum != null && o.product.productID == OutId}">
                                                        <p style="color: red">${maximum}</p>
                                                    </c:if>

                                                </td>
                                                <td class ="cart_total">
                                                    <p><fmt:formatNumber pattern="###,###,###.##" value="${o.product.price*1000}"/></p>
                                                </td>
                                                <td class ="cart_total">
                                                    <c:if test="${o.product.sale >0}">
                                                        <p>${o.product.sale}%</p>
                                                    </c:if>
                                                    <c:if test="${o.product.sale ==0}">
                                                        <p></p>
                                                    </c:if>    
                                                </td>
                                                <td class ="cart_total">
                                                    <p><fmt:formatNumber pattern="###,###,###.##" value="${(o.product.price*(100-o.product.sale)*10)*o.quantity}"/></p>
                                                </td>
                                                <td class ="cart_total" style="text-align: center">
                                                    <form action="updown" method="post">
                                                        <input type="hidden" name="id" value="${o.product.productID}"/>
                                                        <button style="font-size:24px; color: black" class="fa" type="submit" value="Delete">&#xf014;</button>
                                                    </form>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </c:if>

                                </tbody>
                            </table>
                        </div>
                        <hr  width="100%" align="center"/>
                        <div class=" relative" style="margin-top: 30px">
                            <h3 class="absolute1" style="color: #999999;clear: both; margin-left: 0px; display: block">Total money:</h3>
                            <h3 class="absolute3"><fmt:formatNumber pattern="###,###,###.##" value="${i.totalMoney}"/> VNÐ</h3>
                            <a type="button" href="checkout?total=${i.totalMoney}" class="btn btn-success absolute2" data-dismiss="modal">Click To Buy</a>
                        </div>
                    </div>
            </div>

        </div>
                        <div style="height: 100px"></div>                          
        <jsp:include page="footer.jsp"/>

        <script type="text/javascript">
            function reloadnumber(id) {
                var x = document.getElementById("inputnumber" + id).value;
                window.location.href = "inputQuantityInCart?num=" + x + "&id=" + id;
            }
        </script>
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>
    </body>
</html>
