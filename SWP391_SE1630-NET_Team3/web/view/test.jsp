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

if (path.length > 2 && !uri.endsWith("home")) {
                String link = "";
                for (int i = 0; i < path.length - 2; i++) {
                    link += "../";
                }
                req.getRequestDispatcher(link + "home").forward(request, response);
            } else {
                if (account == null) {
                    urlList = FilterDAO.urlListForGuest();
                } else {
                    urlList = FilterDAO.urlListWithRole(String.valueOf(account.getRole()));
                }
                if (!checkInURLList(uri, urlList)) {
                    req.getRequestDispatcher("home").forward(request, response);
                } else {
                    req.getRequestDispatcher(uri).forward(request, response);
                }
            }
