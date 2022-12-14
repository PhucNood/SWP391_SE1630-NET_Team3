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

        <!--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
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

            .pagination {
                display: flex;
                padding-left: 0;
                list-style: none;
            }
            .pagination-lg .page-l {
                padding: 0.75rem 1.5rem;
                font-size: 1.25rem;
                line-height: 1.5;
            }
            .page-l{
                position: relative;
                display: block;
                padding: 0.5rem 0.75rem;
                margin-left: -1px;
                line-height: 1.25;
                color: #999999;
                background-color: #fff;
                border: 1px solid #e9ecef;
            }


            .pagination-sm .page-l {
                padding: 0.25rem 0.5rem;
                font-size: 0.875rem;
                line-height: 1.5;
            }
            .page-i.active .page-l {
                color: #fff;
                background-color: #808080;
                border-color: #808080;
            }
            .page-i .page-l {
                color: #808080;
                background-color: #fff;
                border-color: #808080;
            }
            .textcolor{
                color: #808080;
            }

        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>

        <div class="container">

            <div class="flex-w flex-sb-m p-b-52" style="justify-content: end">
                <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                    <a href="#" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">
                    </a>
                </div>

                <div class="flex-w flex-c-m m-tb-10">
                    <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
                        <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
                        <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                        Filter
                    </div>

                    <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                        <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                        <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                        Search
                    </div>
                </div>

                <!-- Search product -->
                <div class="dis-none panel-search w-full p-t-10 p-b-15">
                    <form class="example" action="manageAccount?all=1" method="get">
                        <input type="text" placeholder="Search by name, email, phone,.." name="text" value="${text}" id="text" onfocusout="formValidate()">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>

                <!-- Filter -->
                <div class="dis-none panel-filter w-full p-t-10">
                    <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
                        <div class="filter-col1 p-r-15 p-b-27">
                            <div class="mtext-102 cl2 p-b-15">
                                <a href="manageAccount?all=1" style="color: black">
                                    Reset Filter
                                </a>
                            </div>
                        </div>
                        <div class="filter-col2 p-r-15 p-b-27">
                            <div class="mtext-102 cl2 p-b-15">
                                Sort By
                            </div>

                            <ul>

                                <li class="p-b-6">
                                    <a href="manageAccount?sort=1" class="filter-link stext-106 trans-04 ${(sort == "1") ? "filter-link-active" :""}">
                                        Name: A->Z
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="manageAccount?sort=2" class="filter-link stext-106 trans-04 ${(sort == "2") ? "filter-link-active" :""}">
                                        Name: Z->A
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="manageAccount?sort=3" class="filter-link stext-106 trans-04 ${(sort == "3") ? "filter-link-active" :""}">
                                        Mail: A->Z
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="manageAccount?sort=4" class="filter-link stext-106 trans-04 ${(sort == "4") ? "filter-link-active" :""}">
                                        Mail: Z->A
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter-col3 p-r-15 p-b-27">
                            <div class="mtext-102 cl2 p-b-15">
                                Gender
                            </div>

                            <ul>
                                <li class="p-b-6">
                                    <a href="manageAccount?gender=0" class="filter-link stext-106 trans-04 ${(gender == "0") ? "filter-link-active" : ""}">
                                        All
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="manageAccount?gender=1" class="filter-link stext-106 trans-04 ${(gender == "1") ? "filter-link-active" : ""}">
                                        Male
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a href="manageAccount?gender=2" class="filter-link stext-106 trans-04 ${(gender == "2") ? "filter-link-active" : ""}">
                                        Female
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter-col4 p-r-15 p-b-27">
                            <div class="mtext-102 cl2 p-b-15">
                                Role
                            </div>

                            <ul>
                                <li class="p-b-6">
                                    <a href="manageAccount?role=0" class="filter-link stext-106 trans-04 ${(role == 0 ? "filter-link-active" : "")}">
                                        All
                                    </a>
                                </li>
                                <li class="p-b-6">
                                    <a href="manageAccount?role=1" class="filter-link stext-106 trans-04 ${(role == 1 ? "filter-link-active" : "")}">
                                        Employee
                                    </a>
                                </li>
                                <li class="p-b-6">
                                    <a href="manageAccount?role=2" class="filter-link stext-106 trans-04 ${(role == 2 ? "filter-link-active" : "")}">
                                        Customer
                                    </a>
                                </li>
                            </ul>
                        </div>


                    </div>
                </div>
            </div>

            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>account</b></h2>
                            <h2 id="test"></h2>
                        </div>   

                    </div>
                </div>
                <form action="manageAccount" method="post" style="width: 300px !important;">

                </form>
                <table class="table table-striped table-hover textcolor">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Role</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="no" value="0"/>
                        <c:forEach items="${listAccount}" var="o">
                            <c:if test="${o.role !=1}">
                                <c:set var="no" value="${no+1}"/>
                                <tr >
                                    <td>${no}</td>
                                    <td>${o.fullname}</td>
                                    <td>${o.gender==1?"Male":"Female"}</td>
                                    <td id="form-acc" data-email="${o.email}">${o.email}</td>
                                    <td>${o.phone}</td>
                                    <td>${o.address}</td>
                                    <c:if test="${o.role == 2}">
                                        <td>Employee</td>
                                    </c:if>
                                    <c:if test="${o.role == 3}">
                                        <td>Customer</td>
                                    </c:if>
                                    <td>
                                        <a href="editAccountRole?email=${o.email} "><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>

            </div>

        </div>

        <jsp:include page="footer.jsp"/>

        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>
        <script>
                            function formValidate() {
                                var regExp = /^[\w$.]$/;
                                var text = document.getElementById("text").value;
                                if (!regExp.test(text))
                                    alert('Not Null!');                                    
                            }
        </script>
    </body>
</html>