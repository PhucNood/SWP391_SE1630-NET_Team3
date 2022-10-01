<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Billard Shop</title>
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
            input[type="text"],input[type="password"],input[type="submit"],input[type="email"]{
                width:100%;
                padding:10px;
                margin:10px 0px;
                border:2px solid #c0c0c0;
            }
            input[type="submit"]{
                border:1px solid #333333 !important;
                background-color:#333333 !important;
                color:white;
                font-size:16px;
                font-weight:600;
                cursor:pointer;
            }
            a {
                color: #999999;
                text-decoration: none;
                background-color: transparent;
            }
            *, *::before, *::after {
                box-sizing: border-box;
            }
        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>

        <div class="box">

            <div class="inner-box">

                <form action="login" method="post">

                    <h2>Login Here</h2>

                    <input  name= "email" type="email" value="${sessionScope.email}"placeholder="Email" required />
                    <input name="pass" type="password" value="${sessionScope.pass}" placeholder="Password" required />
                    <p class="text-warning">${messAlert}</p>
                    <p>
                        <input type="checkbox"  name ="remember" ${sessionScope.check!=null ?"checked":""} value="1"/><span> Keep me Signed In</span>

                        <span class="forgot"><a href="view/recovery" style="color: #808080">Forgot Password?</a></span>
                    </p>
                    <input type="submit" value="Login" />

                    <p style="text-align:center;">
                        <span>Not a member ? </span><a class="link" href="view/signup">Sign Up</a>
                    </p>
                    <h6 style="color: red"><i>${sessionScope.fail}</i></h6>
                </form>

            </div>

        </div>

        <jsp:include page="footer.jsp"/>

        

    </body>
</html>