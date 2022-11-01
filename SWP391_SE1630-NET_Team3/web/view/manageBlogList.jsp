<%-- 
    Document   : manageBlog
    Created on : Oct 15, 2022, 2:38:35 PM
    Author     : stick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
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
            table{
                width: 100%;
                border: 1px;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            }
            th{
                padding: 5px;
            }
            td{
                border-bottom: 1px solid lightgray;
                padding: 5px;
            }
            tr:nth-child(odd) td{
                background-color: #f0f0f0;
            }
            .noClick {
                pointer-events: none;
            }
            .yesClick {
                pointer-events: auto;
            }
            .manage-add{
                display: flex;
                justify-content: space-between;
            }
            .addBlog{
                color: #fff;
                background-color: gray !important;
            }
            .addBlog:hover{
                text-decoration: none;
                color: white;
            }
            /*--------------------------*/
            .manage-search{
                display: flex;
                justify-content: center;
                background-color: rgba(153, 153, 153,0.3);
                padding: 5px;
                border-radius: 5px;
                margin-top: 5px;
            }
            .Blog_Short_Description{
                display: block;
                width: 600px;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            td img {
                min-height: 100px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="topbar.jsp"/>

        <div class="container">
            <div class="table-wrapper">

                <div class="table-title">
                    <div class="rowss noClick manage-add">
                        <div class="col">
                            <h2>Manage Blog</h2>
                        </div>
                        <a href="addBlog"  class="btn addBlog yesClick m-l-2">
                            <i style="font-size:20px; color: white" class="fa">&#xf055;</i> 
                            <span>Add blog</span>
                        </a>
                    </div>
                </div>
                <form action="">
                    <div class="rowss manage-search">
                        <input type="text" class="stext-103 cl2 mx-1 plh4 size-101 p-l-28 p-r-55" name="searchTitle" placeholder="Input search title" value="${searchTitle}">
                        <select class="stext-103 cl2 mx-1 plh4 size-50 p-l-28 p-r-55" name="searchAuthor">
                            <option value="-1">Author</option>
                            <c:forEach items="${authorList}" var="author">
                                <option value="${author.id}"
                                        <c:if test="${author.id == searchAuthorId}">selected</c:if>
                                        >${author.fullname}</option>
                            </c:forEach>
                        </select>
                        <select class="stext-103 cl2 mx-1 plh4 size-50 p-l-28 p-r-55" name="searchTime">
                            <option value="-1">Archive</option>
                            <c:forEach items="${archiveList}" var="archive">
                                <option value="${archive.searchValue}"
                                        <c:if test="${archive.searchValue == searchTime}">selected</c:if>
                                        >${archive.monthYear}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" class="px-2 rounded" value="Search">
                    </div>
                </form>

                <table class="m-t-10">
                    <thead>
                        <tr>
                            <th style="min-width: 40px;">Id</th>
                            <th>Image</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Created by</th>
                            <th>Created At</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${blogList}" var="blog">
                            <tr>
                                <td>${blog.id}</td>
                                <td>
                                    <img width="120px" height="120px"src="${pageContext.request.contextPath}/view/images/${blog.getFirstImgSrc()}">
                                </td>
                                <td>Title 1 the best title ever</td>
                                <td>
                                    <p class="Blog_Short_Description">
                                        ${blog.content}
                                    </p>
                                </td>
                                <td>${blog.authorName}</td>
                                <td>${blog.createAt}</td>
                                <td>
                                    <a href="#?blogID=${blog.id}" >
                                        <i style="font-size:24px; color: black" class="fa">	&#xf044;</i>
                                    </a>
                                </td>
                                <td>
                                    <a href="#" onclick="alertUser()" class="delete" data-toggle="modal">
                                        <i style="font-size:24px; color: black" class="fa">&#xf014;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div class="flex-c-m flex-w w-full p-t-10 m-lr--7 mb-5">
                    <c:if test="${totalPage > 1}">
                        <c:forEach step="1" begin="1" end="${totalPage}" var="index">
                            <c:if test="${curPage eq index}">
                                <a href="ManageBlog?page=${index}&searchAuthorId=${searchAuthorId}&searchTitle=${searchTitle}&searchTime=${searchTime}" 
                                   class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
                                    ${index}
                                </a>
                            </c:if>
                            <c:if test="${curPage ne index}">
                                <a href="ManageBlog?page=${index}&searchAuthorId=${searchAuthorId}&searchTitle=${searchTitle}&searchTime=${searchTime}" 
                                   class="flex-c-m how-pagination1 trans-04 m-all-7 ">
                                    ${index}
                                </a>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

        </div>

        <jsp:include page="footer.jsp"/>

        <script>
            function alertUser(productID) {
                var option = confirm('Are you sure to delete?');
                if (option === true) {
                    window.location.href = "deleteProduct?productID=" + productID;
                }
            }
            function previewFile() {
                var preview = document.querySelector('img');
                var file = document.querySelector('input[type=file]').files[0];
                var reader = new FileReader();
                reader.onloadend = function () {
                    preview.src = reader.result;
                };
                if (file) {
                    reader.readAsDataURL(file);
                } else {
                    preview.src = "";
                }
            }
        </script>
    </body>
</html>
