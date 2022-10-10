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

            .table-title {
                padding-bottom: 15px;
                background: #999999;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px 0;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgb(0, 0, 0, / 5%);
            }
            .table>thead>tr>th {
                vertical-align: bottom;
                border-bottom: 2px solid #ddd;
            }
            .rowss {
                display:block !important;
                margin-right: -15px;
                margin-left: -15px;
            }
            .rowss:after {
                display: table;
                content: " ";
            }
            .rowss:after {
                clear: both;
            }
            .rowss:before {
                display: table;
                content: " ";
            }
            @media (min-width: 768px){
                .col-sm-6 {
                    width: 50%;
                    float: left;
                }
            }

            .btn-success {
                color: #fff;
                background-color: gray !important;
            }
            .table-title {
                color: #fff;
            }
            .table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
                padding: 8px;
                line-height: 1.428571429;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            h2 {
                display: block;
                font-size: 1.5em;
                margin-block-start: 0.83em;
                margin-block-end: 0.83em;
                margin-inline-start: 0px;
                margin-inline-end: 0px;
                font-weight: bold;
            }
            h2{
                line-height: 1.1;
                color: #fff;

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
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }

            .material-icons {
                font-family: 'Material Icons';
                font-weight: normal;
                font-style: normal;
                font-size: 24px;
                line-height: 1;
                letter-spacing: normal;
                text-transform: none;
                display: inline-block;
                white-space: nowrap;
                word-wrap: normal;
                direction: ltr;
                -webkit-font-feature-settings: 'liga';
                -webkit-font-smoothing: antialiased;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            th {
                font-size: 14px !important;
                text-align: left !important;
                display: table-cell;
                font-weight: bold;
            }
            table {
                border-collapse: collapse;
                border-spacing: 0;
            }
            .table>thead>tr>th {
                vertical-align: bottom;
                border-bottom: 2px solid #ddd;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            .table {
                width: 100%;
                margin-bottom: 20px;
            }
            .table-striped>tbody>tr:nth-child(odd)>td {
                background-color: #f9f9f9;
            }
            .table>tbody>tr>td{
                padding: 8px;
                line-height: 1.428571429;
                vertical-align: top;
                border-top: 1px solid #ddd;
            }
            a {
                transition: 300ms;
                background: transparent;
                color: #428bca;
                text-decoration: none;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a{
                background-color: #f0f0e9;
                border: 0;
                float: left;
                line-height: 1.42857;
                margin-left: -1px;
                padding: 6px 12px;
                position: relative;
                text-decoration: none;
                margin-right: 5px;
                color: #000;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            pagination {
                display: inline-block;
                padding-left: 0;
                margin: 20px 0;
                border-radius: 4px;
            }
            .pagination {
                display: inline-block;
                margin-bottom: 25px;
                margin-top: 0;
                padding-left: 15px;
            }
            ul {
                display: block;
                list-style-type: disc;
                margin-block-start: 1em;
                margin-block-end: 1em;
                margin-inline-start: 0px;
                margin-inline-end: 0px;
                padding-inline-start: 40px;
            }
            /*            .pagination li.active a, .pagination li.active a.page-link {
                            background: #D19C97;
                        }*/

            .clearfix:before {
                display: table;
                content: " ";
            }
            .clearfix:before, .clearfix:after {
                display: table !important;
                content: " " ;
                clear: both !important;
            }
        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="rowss">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <a href="addProduct"  class="btn btn-success" >
                            <i style="font-size:20px; color: white" class="fa">&#xf055;</i> 
                            <span>Add product</span>
                        </a>
                    </div>
                </div>
                <div class=" w-full p-t-10 p-b-15">
                    <form class="example" action="search" method="get">
                        <input type="text" placeholder="Search by name, brand,.." name="text" value="${requestScope.textSearch}">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Description</th>
                            <th>Quantity</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Sale</th>
                            <th>Edit/Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${productList}" var="o">
                            <tr>
                                <td>${o.name}</td>
                                <td>${o.description}</td>
                                <td>${o.quantity}</td>
                                <c:set var="img" value=""/>
                                <c:forEach begin="0" end="0" var="j" items="${o.list}">
                                    <c:set var="img" value="${j.imgSource}"/>
                                </c:forEach>
                                <td>
                                    <img width="120px" src="view/images/${img}">
                                </td>
                                <td>${o.price}₫</td>
                                <td>${o.sale}%</td>
                                <td>
                                    <a href="editProduct?productID=${o.productID}" >
                                    <i style="font-size:24px; color: black" class="fa">	&#xf044;</i>
                                    &nbsp;&nbsp; 
                                    </a>
                                    <a href="#" onclick="alertUser(${o.productID})" class="delete" data-toggle="modal">
                                        <i style="font-size:24px; color: black" class="fa">&#xf014;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
                <p class="alert-warning">${messAlert}</p>

                <div class="clearfix">
                    

                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mb-3">
                            <li class="pagfootere-item disabled">
                                <a class="page-link" href="${sessionScope.servs}?index=${page!=1?(page-1):(page)}&txt=${txtSearch}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item "><a class=" ${page == i ?"active":""} page-link btn btn-default" href="${sessionScope.servs}?index=${i}&txt=${txtSearch}">${i}</a></li>
                                </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="${sessionScope.servs}?index=${page!=endPage?(page+1):(page)}&txt=${txtSearch}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
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