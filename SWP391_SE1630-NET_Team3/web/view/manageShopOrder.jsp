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
                        <a href="manageShopOrder?status=0" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(status == 0) ? "how-active1" : ""}">
                            Confirm
                        </a>

                        <a href="showCart?status=1" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(status == 1) ? "how-active1" : ""}"  >
                            Delivering
                        </a>

                        <a href="showCart?status=2" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(status == 2) ? "how-active1" : ""}" >
                            Delivered
                        </a>

                        <a href="showCart?status=3" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(status == 3) ? "how-active1" : ""}" >
                            Received
                        </a>
                        <a href="showCart?status=4" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 ${(status == 4) ? "how-active1" : ""}" >
                            Cancle
                        </a>    

                    </div>

                    <div class="flex-w flex-c-m m-tb-10">
                        
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

                    
                </div>
                <section id="cart_items">
                    <div class="container">
                        <div class="table-responsive cart_info table-scroll" id="table-scroll">
                            <table class="table table-condensed main-table" id="main-table">
                                <thead>
                                    <tr class="cart_menu">
                                        <th class="image">No</th>
                                        <th class="name">Email</th> 
                                        <th class="description">Customer Name</th>
                                        <th class="price">Address</th>
                                        <th class="price">Phone</th>
                                        <th class="image">Note</th>
                                        <th class="quantity">Status</th>
                                        <th class="total">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="showOut">
                                    <c:if test="${listOrder != null}">
                                        <c:set var="tt" value="0"/>
                                        <c:forEach items="${listOrder}" var="o">
                                            <c:set var="tt" value="${tt+1}"/>
                                            <tr class="info">
                                                <td class="cart_product">${tt}</td>
                                                <td class="cart_product">${o.email}</td>
                                                <td class="cart_product">${o.name}</td>
                                                <td class="cart_product">${o.address}</td>
                                                <td class="cart_product">${o.phone}</td>
                                                <td class="cart_product">${o.note}</td>
                                                <td class="cart_product">${o.status}</td>
                                                <td class ="cart_total" style="text-align: center">
                                                    <form action="updown" method="post" id="frmSub">
                                                        <input type="hidden" name="id" value="${o.product.productID}"/>
                                                        <button style="font-size:24px; color: black" class="fa" onclick="alertUser()" value="Delete" >&#xf014;</button>
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
            function alertUser() {
                var option = confirm('Are you sure to delete?');
                if (option === true) {
                    document.getElementById("frmSub").submit();
                }
            }
        </script>
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>
    </body>
</html>
