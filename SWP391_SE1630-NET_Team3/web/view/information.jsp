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
            *{
                padding:0px;
                margin:0px;
                box-sizing:border-box;
            }
            .link{
                color: gray;
            }
            p{
                margin:5px 0px;
            }
            .box{
                width:400px;
                height:auto;
                margin:0 auto;
                background-color:white;
            }
            .inner-box{
                padding:20px;
            }
            .box h1,h2,h3,h4,h5,h6{
                text-align:center;
                margin:5px 0px;
            }
            .forgot{
                float:right;
            }
            .input1{
                width:100%;
                padding:10px;
                margin:10px 0px;
                border:2px solid #c0c0c0;
            }
            .input2{
                border:1px solid #333333 !important;
                background-color:#333333 !important;
                color:white;
                font-size:16px;
                font-weight:600;
                cursor:pointer;
            }
            .input3{
                width: 20px;
                padding: 2px 4px;
                margin: 8px 0;
                box-sizing: border-box;
            }
            a {
                color: #999999;
                text-decoration: none;
                background-color: transparent;
            }
            *, *::before, *::after {
                box-sizing: border-box;
            }
            .sao{
                color: red;
            }
            


        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>

        <div class="box">

            <div class="inner-box">

                <form action="information" method="post" >
                    
                    <h2>Information</h2>
                    <div class="sao" >
                    Phone*<input class="input1" type="text" name="phone" placeholder="Phone" value="${requestScope.phone}" required/>
                    </div>
                    Full Name<input class="input1" type="text" name="fullname" placeholder="Your Full Name" value="${requestScope.fullname}" required/>
                    User Name<input class="input1" type="text" name="username" placeholder="Username" required value="${requestScope.username}"/>
                    Address<input class="input1" type="text" name="address" placeholder="Address" required value="${requestScope.address}"/>
                    <p class="text-warning">${mess1}</p> 

                    <c:if test="${requestScope.success !=null}">
                        <p class="text-warning">${success}</p> 
                    </c:if>
                    <c:if test="${requestScope.success ==null}">
                        <input class="input1 input2" type="submit" value="Change" />
                    </c:if>
                </form>

            </div>

        </div>

        <jsp:include page="footer.jsp"/>



    </body>
</html>