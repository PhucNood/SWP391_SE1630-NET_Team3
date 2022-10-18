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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/./vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/util.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/main.css">
        <!--===============================================================================================-->
        <style>
            
            .blog-img>img {
                height: 300px;
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
        <jsp:include page="topbar.jsp"/>

        <!-- breadcrumb -->
        <div class="container">
            <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
                <a href="home" class="stext-109 cl8 hov-cl1 trans-04">
                    Home
                    <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
                </a>

                <a href="blogList" class="stext-109 cl8 hov-cl1 trans-04">
                    Blog
                    <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
                </a>

                <span class="stext-109 cl4">
                    ${blog.title}
                </span>
            </div>
        </div>


        <!-- Content page -->
        <section class="bg0 p-t-52 p-b-20">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-9 p-b-80">
                        <div class="p-r-45 p-r-0-lg">
                            <!-- blog header -->
                            <div class="wrap-pic-w how-pos5-parent">
                                <img src="${pageContext.request.contextPath}/view/images/${blog.getFirstImgSrc()}" alt="${blog.title}">

                                <div class="flex-col-c-m size-123 bg9 how-pos5">
                                    <span class="ltext-107 cl2 txt-center">
                                        ${blog.getDayCreate()}
                                    </span>
                                    <span class="stext-109 cl3 txt-center">
                                        ${blog.getMonthYearCreate()}
                                    </span>
                                </div>
                            </div>
                            <!-- blog body -->
                            <div class="p-t-32">
                                <span class="flex-w flex-m stext-111 cl2 p-b-19">
                                    <span>
                                        <span class="cl4">By:</span> ${blog.authorName}
                                        <span class="cl12 m-l-4 m-r-6">|</span>
                                    </span>

                                    <span>
                                        ${blog.getMonthYearCreate()}-${blog.getDayCreate()}
                                        <span class="cl12 m-l-4 m-r-6">|</span>
                                    </span>
                                </span>

                                <h4 class="ltext-109 cl2 p-b-28">
                                    ${blog.title}
                                </h4>

                                <p class="stext-117 cl6 p-b-26">
                                    ${blog.content}
                                </p>
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