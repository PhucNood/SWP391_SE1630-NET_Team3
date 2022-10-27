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
                content: '*';
                display:inline;
            }
        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>
        <a></a>
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="box">

                <div class="inner-box">

                    <form action="signup" method="post">
                        <h2>Sign Up Today</h2>
                        <div class="sao" >                          
                        Email Address*<input class="input1" type="email" name= "email" placeholder="Email Address"  required/>
                        <p class="text-warning">${messMail}</p> 
                        Phone*<input class="input1" type="text" name= "phone" placeholder="Phone"  required/>
                        <p class="text-warning">${messPhone}</p> 
                        FullName*<input class="input1" type="text" name="fullname" placeholder="Your Full Name"  required/>
                        UserName*<input class="input1" type="text" name="username" placeholder="Username" required/> 
                        Password*<input class="input1" type="password" name="pass" placeholder="Password" required/>
                        <p class="text-warning">${messPass}</p> 
                        Repass*<input class="input1" type="password" name="repass" placeholder="Conform Password" required/>
                        <p class="text-warning">${messRePass}</p> 
                        <input class="input1 input2" type="submit" value="SignUp" />
                        <p class="text-warning">${messSuc}</p> 
                        </div>
                        <p style="text-align:center;" >
                            <span>Already Register ? </span><a class="link" href="${pageContext.request.contextPath}/login">Login</a>
                        </p>
                        
                    </form>
                </div>

            </div>
        </div>

        <jsp:include page="footer.jsp"/>

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
            })
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
        <script src="${pageContext.request.contextPath}/view/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>

    </body>
</html>