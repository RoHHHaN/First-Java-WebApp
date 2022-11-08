<%-- 
    Document   : Login
    Created on : 01-Nov-2022, 12:50:23 pm
    Author     : mysterio
--%>

<%@page import="com.website.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AR Software | Login</title>

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
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 66% 100%, 34% 95%, 0 100%, 0 0);

            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary ">
            <div class="container-fluid ">
                <a class="navbar-brand" href="Home.jsp"><b>A. R. Software</b></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-5 ">
                        <li class="nav-item ms-2">
                            <a class="nav-link active" aria-current="page" href="Home.jsp"><span class="fa fa-home">&nbsp;</span>Home</a>
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

        <div id="login-alert" class="alert alert-danger position-absolute top-0 start-50 translate-middle-x" role="alert">
            Please Login First
        </div>

        <main class="d-flex align-items-center bg-primary" style="height: 70vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center">
                                <span class="fa fa-user-circle fa-3x"></span>
                                <br>
                                <p>Login Here</p>
                            </div>
                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Username</label>
                                        <input name="email" required type="text" class="form-control">
                                        
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" required type="password" class="form-control">
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </main>

        <script src="JS/MyJS.js"></script>
        <script>
            $("#login-alert").hide();
            $(document).ready(function () {
                console.log("Page Ready!");
                $(".check").click(function () {
                    $("#login-alert").show().delay(1000).fadeOut();
                });
                $("#logout-pop").show().delay(2000).fadeOut();
                ;

            });
        </script>
    </body>
</html>
