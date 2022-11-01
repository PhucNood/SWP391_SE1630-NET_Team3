<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Billard Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
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
                color: #808080;
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

            .button {
                background-color: #808080; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                width: 80px;
                height: 80px;
            }
/*            .form-group{
                color: #666666 !important
            }*/

        </style>
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>
        <a></a>
        <div class="container" >
            <div id="addEmployeeModal" class="">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <p style="color: #44EC79; text-align: center">${messsucc}</p> 
                        <form action="addProduct" method="post" >
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit product</h4>
                            </div>
                            <div class="modal-body">					

                                <div class="form-group">
                                    <span>Product name</span><span style="margin-left: 10px; color: red">(*)</span>
                                    <input name="name" type="text" class="form-control" required id="text" onfocusout="formValidate()">
                                </div>
                                <div class="form-group">
                                    <span>Category</span>
                                    <select name="category" class="form-select" aria-span="Default select example"">
                                        <c:forEach items="${listCategory}" var="i">
                                            <option value="${i.categoryID}">${i.title}</option>

                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <span>Brand</span>
                                    <select name="brand" class="form-select" aria-span="Default select example">
                                        <c:forEach items="${listBrand}" var="i">
                                            <option value="${i.brandID}" selected>${i.title}</option>

                                        </c:forEach>
                                    </select>
                                </div>     
                                <div class="form-group">
                                    <span>Description</span>
                                    <textarea name="description" type="text" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <span>Price</span><span style="margin-left: 10px; color: red">(*)</span>
                                    <input type="number" name="price" min="0" class="form-control" >
                                </div>
                                <div class="form-group" >
                                    <span>Image</span><span style="margin-left: 10px; color: red">(*)</span>
                                    <input  onchange="previewFile()" type="file" name="imgFile" class="form-control" value="view/images/${img}">
                                    <img class="change-img" src="view/images/${img}" height="200" alt="Image preview...">
                                </div>
                                <div class="form-group" style="clear: both">
                                    <span>Quantity</span><span style="margin-left: 10px; color: red">(*)</span>
                                    <input type="number" name="quantity" class="form-control" min="0" " >
                                </div>
                                <div class="form-group">
                                    <span>Size</span><span style="margin-left: 10px; color: red">(*)</span>
                                    <input name="size" class="form-control" required ">
                                </div>



                                <div class="form-group">
                                    <span>Sale(%)</span><span style="margin-left: 10px; color: red">(*)</span>
                                    <input type="number" name="sale" class="form-control" required >
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a type="button" href="manageProduct" class="btn btn-success" data-dismiss="modal" value="Cancel">Cancel</a>
                                <input type="submit" class="btn btn-success" value="Save">

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>

        <script>
            function previewFile() {
                var preview = document.querySelector('.change-img');
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
        <script>
                            function formValidate() {
                                var regExp = /^[\w$.]+$/;
                                var text = document.getElementById("text").value;
                                if (!regExp.test(text))
                                    alert('Not Null!');                                    
                            }
        </script>
    </body>
</html>