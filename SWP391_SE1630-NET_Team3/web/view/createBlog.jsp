<%-- 
    Document   : createBlog
    Created on : Oct 25, 2022, 4:13:23 PM
    Author     : stick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="topbar.jsp"/>
        <a href="#"></a>
        
            <div class="container">
            <div id="addEmployeeModal" class="">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <p style="color: #44EC79; text-align: center">${messsucc}</p> 
                        <form action="addBlog" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Create Blog</h4>
                            </div>
                            <div class="modal-body">					

                                <div class="form-group">
                                    <label>Title</label>
                                    <input name="blogTitle" type="text" class="form-control" required >
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" type="text" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Author</label>
                                    <select name="author" class="form-select form-control" aria-label="Default select example"">
                                        <c:forEach items="${authorList}" var="au">
                                            <option value="${au.id}">${au.fullname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group" >
                                    <label>Image</label>
                                    <input  onchange="previewFile('uploadImg')" type="file" name="imgFile" class="form-control" value="view/images/${img}">
                                    <img class="change-img" src="view/images/${img}" height="200" alt="Image preview..." id="uploadImg">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a type="button" onclick="alert('button work')" href="#" class="btn btn-success" data-dismiss="modal">Cancel</a>
                                <input type="submit" class="btn btn-success" value="Save"> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="footer.jsp"/>
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/view/js/previewImg.js"></script>
    </body>
</html>
