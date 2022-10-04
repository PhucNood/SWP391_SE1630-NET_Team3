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

        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="box">

                <div class="inner-box">

                    <form action="signup" method="post">
                        <h2>Sign Up Today</h2>
                        <input type="email" name= "email" placeholder="Email Address" value="${sessionScope.email}" required/>
                        <input type="text" name= "phone" placeholder="Phone" value="${sessionScope.phone}" required/>
                        <input type="text" name="fullname" placeholder="Your Full Name" value="${sessionScope.fullname}" required/>
                        <input type="text" name="username" placeholder="Username" required ${sessionScope.username}/>
                        <input type="password" name="pass" placeholder="Password" required/>
                        <input type="password" name="repass" placeholder="Conform Password" required/>
                        <p class="text-warning">${mess1}</p> 
                        <input type="submit" value="SignUp" />
                        <p style="text-align:center;" >
                            <span>Already Register ? </span><a class="link" href="${pageContext.request.contextPath}/view/login">Login</a>
                        </p>
                    </form>
                </div>

            </div>
        </div>

        <h1>${requestScope.test}</h1>

    </body>
</html>
