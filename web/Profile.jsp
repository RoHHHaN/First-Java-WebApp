<%@page import="com.website.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="Error.jsp" %>
<%
//    User user = (User) session.getAttribute("currentUser");
//    if (user == null) {
//        response.sendRedirect("Login.jsp");
//    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AR Software | Profile</title>

        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

        <!-- CSS only -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

        <!--jQuery CDN-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <!--Font Awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!--Google Fonts-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--CSS Style Sheet-->
        <link href="CSS/Style.css" rel="stylesheet"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 85%, 66% 100%, 34% 85%, 0 100%, 0 0);

            }
        </style>

    </head>
    <body>
        <%@include file="ProfileHeader.jsp" %>
        <div class="container-fluid m-0 p-0 xx">

            <div class="bg-primary text-white p-5 pb-10 banner-background">
                <div class="container">
                    <span><image src="Image/spice-money.png" class="card-img-top rounded-circle rounded float-end" style="margin-top:0px; height: 20%; width: 20%;"/></span>     
                    <h1>Welcome to A. R. Software</h1> 
                    <p><b><i>Abdur Rahaman</i></b></p>
                    <p>
                    <h4>Photo Copies & Xerox</h4>
                    <h4>Lamination</h4>
                    <h4>Mobile Recharge</h4>
                    </p>

                </div>
            </div>  
        </div>
    </body>
</html>
