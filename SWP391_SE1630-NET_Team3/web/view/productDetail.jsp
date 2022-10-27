<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>

        <!-- Cart -->
        <div class="wrap-header-cart js-panel-cart">
            <div class="s-full js-hide-cart"></div>

            <div class="header-cart flex-col-l p-l-65 p-r-25">
                <div class="header-cart-title flex-w flex-sb-m p-b-8">
                    <span class="mtext-103 cl2">
                        Your Cart
                    </span>

                    <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                        <i class="zmdi zmdi-close"></i>
                    </div>
                </div>

                <div class="header-cart-content flex-w js-pscroll">
                    <ul class="header-cart-wrapitem w-full">
                        <li class="header-cart-item flex-w flex-t m-b-12">
                            <div class="header-cart-item-img">
                                <img src="${pageContext.request.contextPath}/view/images/item-cart-01.jpg" alt="IMG">
                            </div>

                            <div class="header-cart-item-txt p-t-8">
                                <a href="${pageContext.request.contextPath}/view/#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                    White Shirt Pleat
                                </a>

                                <span class="header-cart-item-info">
                                    1 x $19.00
                                </span>
                            </div>
                        </li>

                        <li class="header-cart-item flex-w flex-t m-b-12">
                            <div class="header-cart-item-img">
                                <img src="${pageContext.request.contextPath}/view/images/item-cart-02.jpg" alt="IMG">
                            </div>

                            <div class="header-cart-item-txt p-t-8">
                                <a href="${pageContext.request.contextPath}/view/#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                    Converse All Star
                                </a>

                                <span class="header-cart-item-info">
                                    1 x $39.00
                                </span>
                            </div>
                        </li>

                        <li class="header-cart-item flex-w flex-t m-b-12">
                            <div class="header-cart-item-img">
                                <img src="${pageContext.request.contextPath}/view/images/item-cart-03.jpg" alt="IMG">
                            </div>

                            <div class="header-cart-item-txt p-t-8">
                                <a href="${pageContext.request.contextPath}/view/#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                    Nixon Porter Leather
                                </a>

                                <span class="header-cart-item-info">
                                    1 x $17.00
                                </span>
                            </div>
                        </li>
                    </ul>

                    <div class="w-full">
                        <div class="header-cart-total w-full p-tb-40">
                            Total: $75.00
                        </div>

                        <div class="header-cart-buttons flex-w w-full">
                            <a href="${pageContext.request.contextPath}/view/shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                                View Cart
                            </a>

                            <a href="${pageContext.request.contextPath}/view/shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                                Check Out
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Product Detail -->
        <section class="sec-product-detail bg0 p-t-65 p-b-60">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-7 p-b-30">
                        <div class="p-l-25 p-r-30 p-lr-0-lg">
                            <div class="wrap-slick3 flex-sb flex-w">
                                <div class="wrap-slick3-dots"></div>
                                <div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

                                <div class="slick3 gallery-lb">
                                    <c:forEach items="${listImg}" var="i">
                                        <div class="item-slick3" data-thumb="${pageContext.request.contextPath}/view/images/${i.imgSource}">
                                            <div class="wrap-pic-w pos-relative">
                                                <img src="${pageContext.request.contextPath}/view/images/${i.imgSource}" alt="IMG-PRODUCT">

                                                <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/view/images/${i.imgSource}">
                                                    <i class="fa fa-expand"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-5 p-b-30">
                        <div class="p-r-50 p-t-5 p-lr-0-lg">
                            <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                                ${product.name}
                            </h4>
                            
                            <p class="stext-102 cl3 p-t-23" style="margin-bottom: 30px;">
                                Description: ${product.description}
                            </p>
                            
                            <span class="mtext-106 cl2">
                                <div>
                                    $<fmt:formatNumber pattern="###,###,###.##" value="${product.price*(100-product.sale)*10}"/>
                                    <c:if test="${product.sale !=0}">
                                        &nbsp;&nbsp;(-${product.sale}%)
                                    </c:if>
                                </div>

                                <div>
                                    <c:if test="${product.sale !=0}">
                                        <del class="stext-105 cl3">
                                            $<fmt:formatNumber pattern="###,###,###.##" value="${product.price*1000}"/>
                                        </del>
                                    </c:if>
                                </div>
                            </span>

                            

                            <!--  -->
                            <div class="p-t-33">
                                <div class="flex-w flex-r-m p-b-10" >
                                    <div class="size-204 flex-w flex-m respon6-next" style="position: absolute; left: 20px;margin-top: 50px">
                                        <form action="addCart?id=${product.productID}" method="get">
                                            <div class="wrap-num-product flex-w m-r-20 m-tb-10" >
                                                <div onclick="minus()" class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-minus"></i>
                                                </div>

                                                <input id="numProduct" class="mtext-104 cl3 txt-center num-product" type="number" min="1" name="numProduct" value="1">

                                                <div onclick="plus(${product.quantity})" class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-plus"></i>
                                                </div>
                                            </div>

                                            <button  class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
                                                <input type="submit" value="">Add to cart
                                            </button>
                                        </form>
                                    </div>
                                </div>	
                            </div>


                        </div>
                    </div>
                </div>
            </div>

            <div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
                <span class="stext-107 cl6 p-lr-25">
                    ${product.name}
                </span>

                <span class="stext-107 cl6 p-lr-25">
                    Categories: ${category.title}
                </span>
            </div>
        </section>


        <!-- Related Products -->
        <section class="sec-relate-product bg0 p-t-45 p-b-105">
            <div class="container">
                <div class="p-b-45">
                    <h3 class="ltext-106 cl5 txt-center">
                        Related Products
                    </h3>
                </div>

                <!-- Slide2 -->
                <div class="wrap-slick2">
                    <div class="slick2">
                        <c:forEach items="${listProduct}" var="i">
                            <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
                                <!-- Block2 -->
                                <c:set var="img" value=""/>
                                <c:forEach begin="0" end="0" var="j" items="${i.list}">
                                    <c:set var="img" value="${j.imgSource}"/>
                                </c:forEach>
                                <div class="block2">
                                    <div class="block2-pic hov-img0">
                                        <img src="${pageContext.request.contextPath}/view/images/${img}" alt="IMG-PRODUCT">

                                        <a href="productdetail?productID=${i.productID}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
                                            View Detail
                                        </a>
                                    </div>

                                    <div class="block2-txt flex-w flex-t p-t-14">
                                        <div class="block2-txt-child1 flex-col-l ">
                                            <a href="productdetail?productID=${i.productID}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                                ${i.name}
                                            </a>

                                            <span class="stext-105 cl3">
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

                                        <div class="block2-txt-child2 flex-r p-t-3">
                                            <a href="${pageContext.request.contextPath}/view/#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                                <img class="icon-heart1 dis-block trans-04" src="${pageContext.request.contextPath}/view/images/icons/icon-heart-01.png" alt="ICON">
                                                <img class="icon-heart2 dis-block trans-04 ab-t-l" src="${pageContext.request.contextPath}/view/images/icons/icon-heart-02.png" alt="ICON">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
        </section>


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
            $('.btn-num-product-down').on('click', function () {
                var min_value_product = Number(document.getElementById("num-product").min);
                var numProduct = Number($(this).next().val());
                if (numProduct > min_value_product)
                    $(this).next().val(numProduct - 1);
            });

            $('.btn-num-product-up').on('click', function () {
                var max_value_product = Number(document.getElementById("num-product").max);
                ;
                var numProduct = Number($(this).prev().val());
                if (numProduct < max_value_product)
                    $(this).prev().val(numProduct + 1);
            });
        </script>
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
        <script>
            function minus(){
                var t = document.getElementById("numProduct").value;
                if(parseInt(t)>1){
                    document.getElementById("numProduct").value = parseInt(t)-1;
                }
            }
            
            function plus(quantity){
                var t = document.getElementById("numProduct").value;
                if(parseInt(t)<quantity){
                    document.getElementById("numProduct").value = parseInt(t)+1;
                }
                else{
                    alert("There are "+quantity+" products left in stock")
                }
            }
        </script>
    </body>
</html>