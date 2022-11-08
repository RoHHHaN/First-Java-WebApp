<%@page import="com.website.entities.Message"%>
<%@page import="com.website.entities.User"%>
<%@page errorPage="Error.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary ">
    <div class="container-fluid ">
        <a class="navbar-brand" href="Profile.jsp"><b>A. R. Software</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-5 ">
                <li class="nav-item ms-2">
                    <a class="nav-link active" aria-current="page" href="Profile.jsp"><span class="fa fa-home">&nbsp;</span>Home</a>
                </li>
                <li class="nav-item ms-2">
                    <a class="nav-link" href="PayBill.jsp"><span class="fa fa-handshake-o">&nbsp;</span>Pay Bill</a>
                </li>
                <li class="nav-item ms-2">
                    <a class="nav-link" href="OldBill.jsp"><span class="fa fa-book">&nbsp;</span>Old Bill</a>
                </li>
                <li class="nav-item ms-2">
                    <a class="nav-link" id="check-buttn" href="#"><span class="fa fa-address-card-o">&nbsp;</span>Aadhaar Entry</a>
                </li>
                <li class="nav-item ms-2">
                    <a class="nav-link" href="Aadhaar.jsp"><span class="fa fa-credit-card">&nbsp;</span>Aadhaar Check</a>
                </li>
                <li class="nav-item ms-2">
                    <a class="nav-link" target="_blank" href="Contact.jsp"><span class="fa fa-phone">&nbsp;</span>Contact Us</a>
                </li>


            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#" class="nav-link active ms-5"><b><span class="fa fa-user-o"></span>&nbsp;<%= user.getName()%></b></a> 
                </li>
                <li id="lg-btn">
                    <a href="LogoutServlet" class="btn btn-success ms-5" ><span class="fa fa-power-off fa-spin"></span>&nbsp;Logout</a> 
                </li>
            </ul>
        </div>
    </div>
</nav>

<div id="entry-div" class="container-fluid" style=" height: 160px; background: linear-gradient(90deg, rgba(8,97,9,1) 0%, rgba(160,164,102,1) 100%);">
    <form action="Entry" method="post" id="entry-form">
        <div class="row">
            <div class="col mt-4">
                <input class="input-aadhaar " style="width: 400px; margin-left: 15px;" type="text" placeholder="Aadhaar Number" name="number"/>
            </div>
            <div class="col mt-4">
                <input class="input-aadhaar" style="width: 400px; margin-left: 15px;" type="text" placeholder="Name" name="name"/>
            </div>
            <div class="col mt-4">
                <input class="input-aadhaar" style="width: 400px; margin-left: 15px;" type="text" placeholder="Phone Number" name="phone"/>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col offset-5 ">


                <button type="submit" class="btn btn-primary ms-5" ><span class="fa fa-at"></span>&nbsp;Submit</button> 
                <br>
                <div class="spinner-border ldr" style="margin-left: 75px; margin-top: 5px; display: none;" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>

            </div>
        </div>
    </form>

</div>

<div id="update-pop" class="alert alert-success position-absolute top-0 start-50 translate-middle-x" role="alert">
    
</div>

<script type="text/javascript" src="JS/MyJS.js">

</script>