<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>About</title>
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
    </head>
    <body class="animsition">

        <jsp:include page="topbar.jsp"/>
        <!-- Content page -->
        <section class="bg0 p-t-75 p-b-120">
            <div class="container">
                <div class="row p-b-148">
                    <div class="col-md-7 col-lg-8">
                        <div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
                            <h3 class="mtext-111 cl2 p-b-16">
                                Historical Story
                            </h3>

                            <p class="stext-113 cl6 p-b-26">
                                According to recorded history, billiards (snooker) was formerly an outdoor game, the pool table was then just the ground and used balls and sticks to hit from around the 14th century. Some evidence suggests that the table billiards dates back to 1470 and it was King Louis XI of France who owned a table of such shape.
                            </p>

                            <p class="stext-113 cl6 p-b-26">
                                Billiards gradually became popular among the royal family in 1586 and five years later gradually became popular in public places and in inns. Records on billiards. in England and France show that at that time people played billiards by using a wooden tool to push the ball, with the head of the cone leaning against the table. The net bag at that time was just a small arc on the billiard table, it was not until the 18th century that the net bag for billiards was born.
                            </p>
                            
                            <p class="stext-113 cl6 p-b-26">
                                The 19th century is said to have made great strides to bring billiards to a new level, when a series of technical advances appeared such as: leather muscle head, using chalk to increase friction between the head. muscle and ball. Use a stone slab for the table top and the tape is used with a rubber material.
                            </p>

                            <p class="stext-113 cl6 p-b-26">
                                Any questions? Let us know in store at 3th floor, 1630 Delta, Hòa Lạc, Hà Nội or call us on (+84) 96 716 6879
                            </p>
                        </div>
                    </div>

                    <div class="col-11 col-md-5 col-lg-4 m-lr-auto">
                        <div class="how-bor1 ">
                            <div class="hov-img0">
                                <img src="${pageContext.request.contextPath}/view/images/lichsubia.png" alt="IMG">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="order-md-2 col-md-7 col-lg-8 p-b-30">
                        <div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
                            <h3 class="mtext-111 cl2 p-b-16">
                                Development Story
                            </h3>

                            <p class="stext-113 cl6 p-b-26">
                                Over time, billiards gradually introduced and developed in many countries around the world. In 1643, billiards began to be known in New York. Not long after, billiards were available throughout North and South America among the nobility. In Europe, from the early years of the 17th century, people in Germany - Austria began to play billiards. In the Nordic region, billiards was introduced to Denmark in 1766, then flourished in Sweden, Norway, and Finland.
                            </p>

                            <div class="bor16 p-l-29 p-b-9 m-t-22">
                                <p class="stext-114 cl6 p-r-40 p-b-11">
                                    Over the course of historical development, billiards was "improved" by switching to playing ball into the hole and replacing the curved sticks into straight, small-headed clubs – the cues later. . With this popularity and change, the game is not only encapsulated in the nobility, but has grown widely and popularized among the playing class. At this time billiard clubs began to form. At the same time, different forms of beer playing were gradually formed and developed until now.
                                </p>

                                <span class="stext-111 cl8">
                                    Until this day, billiards spread all over the world. It is known to be a popular sport, being put into sports competition with many different tournaments.
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
                        <div class="how-bor2">
                            <div class="hov-img0">
                                <img src="${pageContext.request.contextPath}/view/images/hientaibia.jpg" alt="IMG">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>	



        <jsp:include page="footer.jsp"/>

        
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/view/js/main.js"></script>

    </body>
</html>