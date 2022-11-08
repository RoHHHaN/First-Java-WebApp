<%-- 
    Document   : Contact
    Created on : 04-Nov-2022, 9:54:00 am
    Author     : mysterio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.website.entities.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team β | Contacts</title>

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
            .fa-facebook-official{
                color: #3b5998;
            }
            .fa-telegram{
                color:  #0088cc;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary ">
            <form class="container-fluid justify-content-start">
                <a href="Profile.jsp" class="btn btn-success me-2" type="button">Home</a>
                <a href="Login.jsp" class="btn btn-sm btn-secondary" type="button">Login</a>
            </form>
        </nav>
        <div class="container" style="margin-top: 50px; margin-bottom: 50px;">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="card h-100">
                        <img src="Image/runu.jpg" class="card-img-top" alt="Rabchik runu Image" style="width:200px;margin-left:77px;margin-top:15px;">
                        <div class="card-body">
                            <h5 class="card-title">Rohan Debnath</h5>
                            <p class="card-text">Hello,this is Rohan Debnath a back-end developer who help to create this project.@Team-βeta</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Back-end Developer</li>
                            <li class="list-group-item">To Contact Us :</li>
                        </ul>
                        <div class="card-body" style="margin-left: 30%;">
                            <a href="https://t.me/RoHaNDN" class="card-link"><span class="fa fa-3x fa-telegram"></span></a>
                            <a href="https://www.facebook.com/profile.php?id=100053925556515" class="card-link"><span class="fa fa-3x fa-facebook-official"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="Image/suman.jpg" class="card-img-top" alt="Baba suuman semicolon Image" style="width:150px;margin-left:102px; margin-top:15px;">
                        <div class="card-body">
                            <h5 class="card-title">Suman Mondal</h5>
                            <p class="card-text">Hello,this is suman a full-stack developer who help to create this project.@Team-βeta</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Full-Stack Developer</li>
                            <li class="list-group-item">To Contact Us :</li>
                        </ul>
                        <div class="card-body" style="margin-left: 30%;">
                            <a href="https://t.me/Suman1259" class="card-link"><span class="fa fa-3x fa-telegram"></span></a>
                            <a href="https://www.facebook.com/profile.php?id=100009879698046" class="card-link"><span class="fa fa-3x fa-facebook-official"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="Image/zhuntu.jpg" class="card-img-top" alt="Zhakas zhuntu Image" style="width:100px;margin-left:130px;margin-top:15px;">
                        <div class="card-body">
                            <h5 class="card-title">Zunaid Ahammed</h5>
                            <p class="card-text">Hello,this is Zunaid Ahammed a font-end developer who help to create this project.@Team-βeta</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Font-End Developer</li>
                            <li class="list-group-item">To Contact Us :</li>
                        </ul>
                        <div class="card-body" style="margin-left: 30%;">
                            <a href="https://t.me/ZasBabySHADOWHUNTERa10" class="card-link"><span class="fa fa-3x fa-telegram"></span></a>
                            <a href="https://www.facebook.com/profligate.parched" class="card-link"><span class="fa fa-3x fa-facebook-official"></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <span class="navbar-text" style="margin-left: 30%;"> 
                        Email : arahaman729@gmail.com &nbsp; 
                        Git hub Password : a9933414729 &nbsp;
                        user id : Rahaman8392
                    </span>
                </div>
            </nav>
        </div>
    </body>
</html>
