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


            .center {
                margin-top: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .btn-success {
                color: #fff;
                background-color: gray !important;
            }
            .btn {
                display: inline-block !important;
                padding: 6px 12px ;
                margin-bottom: 0 !important;
                font-weight: normal !important;
                line-height: 1.428571429 !important;
                text-align: center !important;
                white-space: nowrap !important;
                vertical-align: middle !important;
                cursor: pointer !important;
                background-image: none;
                user-select: none;
            }



        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>
        <a></a>
        <div class="col-xl-8 m-lr-auto" style="border-style: outset;width: 500px;
             height: 500px; margin-bottom: 50px;justify-content: end">
            <img src="${pageContext.request.contextPath}/view/images/success.png" 
                 width="100" height="100" style="margin: auto;margin-top: 50px;display: block">
            <h3 style="font-weight: bold; text-align: center; margin-top: 50px;margin-bottom: 50px;">Order Success!</h3>
            <p style="text-align: center">Estimated delivery time is 3-5 days</p>
            <div style="text-align: center">
                <span>You can see details in </span>
                <span>
                    <a href="#">My Order</a>
                </span>
            </div>

            <form action="${pageContext.request.contextPath}/shop" method="get">
                <div class="center">
                    <button class="btn btn-success">
                        Buy More
                    </button>
                </div>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>
    </body>
</html>
