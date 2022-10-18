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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/util.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/main.css">
        <!--===============================================================================================-->
        <style>
            .Blog_Short_Description{
                display: block;
                width: 600px;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            .blog-img>a>img {
                height: 400px;
                width: auto;
                object-fit:cover;
            }
            .button-archive{
                padding: 10px;
                border-radius: 4px;
            }
        </style>
    </head>
    <body class="animsition">
        <h1>${pageContext.request.contextPath}</h1>
        <jsp:include page="topbar.jsp"/>

        <!-- Content page -->
        <section class="bg0 p-t-62 p-b-60">
            <div class="container">
                <div class="row">
                    <!--blog list-->
                    <div class="col-md-8 col-lg-9 p-b-80">
                        <div class="p-r-45 p-r-0-lg">
                            <c:forEach items="${blogList}" var="blog">
                                <!-- item blog -->
                                <div class="p-b-30">
                                    <div class="txt-center blog-img">
                                        <a href="BlogDetail?id=${blog.id}" class="hov-img0 how-pos5-parent">
                                            <img src="${pageContext.request.contextPath}/view/images/${blog.getFirstImgSrc()}" alt="IMG-BLOG">
                                            <div class="flex-col-c-m size-123 bg9 how-pos5">
                                                <span class="ltext-107 cl2 txt-center">
                                                    ${blog.getDayCreate()}
                                                </span>
                                                <span class="stext-109 cl3 txt-center">
                                                    ${blog.getMonthYearCreate()}
                                                </span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="p-t-32">
                                        <h4 class="p-b-15">
                                            <a href="BlogDetail?id=${blog.id}" class="ltext-108 cl2 hov-cl1 trans-04">
                                                ${blog.title}
                                            </a>
                                        </h4>
                                        <p class="Blog_Short_Description stext-117 cl6">
                                            ${blog.content}
                                        </p>
                                        <div class="flex-w flex-sb-m p-t-18">
                                            <span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
                                                <span>
                                                    <span class="cl4">By</span> ${blog.getAuthorName()}
                                                    <span class="cl12 m-l-4 m-r-6">|</span>
                                                </span>
                                            </span>
                                            <a href="BlogDetail?id=${blog.id}" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
                                                Continue Reading
                                                <i class="fa fa-long-arrow-right m-l-9"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <!-- Pagination -->
                            <div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
                                <c:if test="${totalPage > 1}">
                                    <c:forEach step="1" begin="1" end="${totalPage}" var="index">
                                        <c:if test="${curPage eq index}">
                                            <a href="blogList?page=${index}&searchTitle=${searchTitle}&searchTime=${searchTime}" 
                                               class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
                                                ${index}
                                            </a>
                                        </c:if>
                                        <c:if test="${curPage ne index}">
                                            <a href="blogList?page=${index}&searchTitle=${searchTitle}&searchTime=${searchTime}" 
                                               class="flex-c-m how-pagination1 trans-04 m-all-7 ">
                                                ${index}
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!--side bar-->
                    <div class="col-md-4 col-lg-3 p-b-80">
                        <div class="side-menu">
                            <!--search-->
                            <div class="bor17 of-hidden pos-relative">
                                <form method="get" action="blogList">
                                    <input id="SearchName" class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="searchTitle" placeholder="Search">
                                    <input id="SearchTime" class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="searchTime" placeholder="Search" style="display: none">
                                    <button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" type="submit">
                                        <i class="zmdi zmdi-search"></i>
                                    </button>
                                </form>
                            </div>
                            <!--optional-->
                            <!--                            <div class="p-t-65">
                                                            <h4 class="mtext-112 cl2 p-b-33">
                                                                Featured Products
                                                            </h4>
                            
                                                            <ul>
                                                                <li class="flex-w flex-t p-b-30">
                                                                    <a href="${pageContext.request.contextPath}/view/#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
                                                                        <img src="${pageContext.request.contextPath}/view/images/product-min-01.jpg" alt="PRODUCT">
                                                                    </a>
                            
                                                                    <div class="size-215 flex-col-t p-t-8">
                                                                        <a href="${pageContext.request.contextPath}/view/#" class="stext-116 cl8 hov-cl1 trans-04">
                                                                            White Shirt With Pleat Detail Back
                                                                        </a>
                            
                                                                        <span class="stext-116 cl6 p-t-20">
                                                                            $19.00
                                                                        </span>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>-->

                            <div class="p-t-55">
                                <h4 class="mtext-112 cl2 p-b-20">
                                    Archive
                                </h4>

                                <ul>
                                    <c:forEach items="${archiveList}" var="archive">
                                        <li class="p-b-7">
                                            <p onclick="setTimeSearch('${archive.getSearchValue()}')" id="${archive.getSearchValue()}" class="button-archive flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
                                                <span>
                                                    ${archive.getMonthYear()}
                                                </span>
                                                <span>
                                                    (${archive.getTotalBlog()})
                                                </span>
                                            </p>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>	



        <jsp:include page="footer.jsp"/>

        
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/view/js/blogListJS.js"></script>

    </body>
</html>