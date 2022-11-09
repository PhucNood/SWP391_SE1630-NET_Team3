<%-- 
    Document   : test
    Created on : Oct 11, 2022, 12:44:16 AM
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
        <h1>${test}</h1>
    </body>
</html>

<c:if test="${o.status == 'Confirm' && (account.role == 1 || account.role == 2)}">
                                                <td class ="cart_total" style="text-align: center; ">
                                                    <button class="btn btn1">
                                                        <a href="updateStatus?id=${o.orderID}">Confirm</a>
                                                    </button>
                                                </td>
                                            </c:if>
                                            <c:if test="${o.status == 'Delivering' && account.role == 3}">
                                                <td class ="cart_total" style="text-align: center; ">
                                                    <button class="btn btn1">
                                                        <a href="updateStatus?id=${o.orderID}">Received</a>
                                                    </button>
                                                    <button class="btn btn1">
                                                        <a href="updateStatus?id=${o.orderID}">Cancle</a>
                                                    </button>
                                                </td>
                                            </c:if>