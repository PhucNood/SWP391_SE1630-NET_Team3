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
            .div_left{

                width: 50%;

                float: left;

                text-align: center;

            }

            .div_right{
                width: 50%;

                float: left;

                text-align: center;

            }
        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>
        <a></a>
        <div class="col-xl-8 m-lr-auto">
            <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">

                <form action="addOrder" method="post">
                    <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                        <div class="size-208 w-full-ssm">
                            <h4 class="mtext-109 cl2 p-b-30">
                                Shipping:
                            </h4>
                        </div>

                        <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                            <p class="stext-111 cl6 p-t-2">
                                There are no shipping methods available. Please double check your address, or contact us if you need any help.
                            </p>

                            <div class="p-t-15">
                                <span class="stext-112 cl8">
                                    FULL NAME
                                </span>
                                <span style="margin-left: 10px; color: red">(*)</span>

                                <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="name" value="${account.fullname}">
                                </div>

                                <span class="stext-112 cl8">
                                    EMAIL
                                </span>
                                <span style="margin-left: 10px; color: red">(*)</span>

                                <div class="bor8 bg0 m-b-12">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="email" value="${account.email}">
                                </div>

                                <span class="stext-112 cl8">
                                    PHONE NUMBER
                                </span>
                                <span style="margin-left: 10px; color: red">(*)</span>

                                <div class="bor8 bg0 m-b-12">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="phone" value="${account.phone}">
                                </div>

                                <span class="stext-112 cl8">
                                    ADDRESS
                                </span>
                                <span style="margin-left: 10px; color: red">(*)</span>

                                <div class="bor8 bg0 m-b-22">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="address" value="${account.address}">
                                </div>

                                <span class="stext-112 cl8">
                                    NOTE
                                </span>

                                <div class="bor8 bg0 m-b-22">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="note" >
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-t p-t-27 p-b-33">
                        <div class="size-208">
                            <span class="mtext-101 cl2">
                                Total:
                            </span>
                        </div>

                        <div class="size-209 p-t-1">
                            <span class="mtext-110 cl2">
                                <fmt:formatNumber pattern="###,###,###.##" value="${total}"/> VND
                            </span>
                        </div>
                        <div style="margin-top: 50px"></div>
                        <a href ="showCart"
                            class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer col-md-5 div_left" style="width: 80%;">
                            Back to Cart
                        </a>
                        <div class="col-md-2"></div>
                        <button type="submit" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer col-md-5 div_right" style="width: 80%;">
                            Proceed to Checkout
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div style="margin-top: 20px"></div>

        <jsp:include page="footer.jsp"/>
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>
        <script>
            
        </script>
    </body>
</html>
