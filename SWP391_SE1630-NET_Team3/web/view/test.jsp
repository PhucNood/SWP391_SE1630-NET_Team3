<%-- 
    Document   : test
    Created on : Oct 2, 2022, 10:53:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center mb-3">
                                <li class="page-item ${page==1?"disabled":""}">
                                    <a class="page-link" href="listproduct?page=${page-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <c:set var="page" value="${requestScope.page}"/>
                                <c:forEach begin="${1}" end="${requestScope.num}" var="j">
                                    <li class="page-item ${page==j?"active":""}"><a class="page-link" 
                                                                                    href="listproduct?page=${j}">${j}</a></li>
                                    </c:forEach>
                                <li class="page-item ${page==num?"disabled":""}">
                                    <a class="page-link" 
                                       href="listproduct?page=${page+1}&cid=${cid}&bid=${bid}&filterprice=${filterprice}&sid=${sid}"" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>

        <h1>${requestScope.test}</h1>

    </body>
</html>
