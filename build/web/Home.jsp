<%-- 
    Document   : Home
    Created on : 31-Oct-2022, 4:35:28 pm
    Author     : mysterio
--%>

<%@page import="com.website.entities.Message"%>
<%@page import="com.website.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AR Software | Home</title>

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
        <%--<%@include file="Header.jsp" %>--%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary ">
            <div class="container-fluid ">
                <a class="navbar-brand" href="Home.jsp"><b>A. R. Software</b></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-5 ">
                        <li class="nav-item ms-2">
                            <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-home">&nbsp;</span>Home</a>
                        </li>
                        <li class="nav-item ms-2">
                            <a class="nav-link check" href="#"><span class="fa fa-handshake-o">&nbsp;</span>Pay Bill</a>
                        </li>
                        <li class="nav-item ms-2">
                            <a class="nav-link check" href="#"><span class="fa fa-book">&nbsp;</span>Old Bill</a>
                        </li>
                        <li class="nav-item ms-2">
                            <a class="nav-link check" href="#"><span class="fa fa-credit-card">&nbsp;</span>Aadhaar</a>
                        </li>
                        <li class="nav-item ms-2">
                            <a class="nav-link" target="_blank" href="Contact.jsp"><span class="fa fa-phone">&nbsp;</span>Contact Us</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="Login.jsp" class="btn btn-success ms-5"><span class="fa fa-user-circle fa-spin"></span>&nbsp;Login</a> 
                        </li>

                    </ul>
                </div>
            </div>
        </nav>    

        <div class="container-fluid m-0 p-0 xx">

            <div class="bg-primary text-white p-5 pb-10 banner-background">
                <div class="container">
                    <span><image src="Image/Logo.png" class="card-img-top float-end" style="margin-top:0px; height: 20%; width: 20%;"/></span>     
                    <h1>Welcome to A. R. Software</h1> 
                    <p><b><i>Abdur Rahaman</i></b></p>
                    <p>
                    <h4>Photo Copies & Xerox</h4>
                    <h4>Lamination</h4>
                    <h4>Mobile Recharge</h4></p>
                </div>
            </div>  
        </div>

        <div id="login-alert" class="alert alert-danger position-absolute top-0 start-50 translate-middle-x" role="alert">
            Please Login First
        </div>
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div id="logout-pop" class="alert <%= m.getCssClass()%> position-absolute top-0 start-50 translate-middle-x" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>
        <script src="JS/MyJS.js"></script>
        <script>
            $("#login-alert").hide();
            $(document).ready(function () {
                console.log("Page Ready!");
                $(".check").click(function(){
                    $("#login-alert").show().delay(1000).fadeOut();
                }); 
                $("#logout-pop").show().delay(2000).fadeOut();
                ;

            });
        </script>
    </body>
</html>
