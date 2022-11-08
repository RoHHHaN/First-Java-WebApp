<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.website.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AR Software | Aadhaar Check</title>

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
    </head>
    <body>
        <%@include file="ProfileHeader.jsp" %>

        <%            Connection con = ConnectionProvider.getConnection();
            Statement stmt = con.createStatement();
            ResultSet st = stmt.executeQuery("select * from aadhaar");
        %>
        <%
            String x = (String) request.getParameter("keyword");
            String search = "";
            if (x != null) {
                search = x.toUpperCase();
            }
            Connection con2 = ConnectionProvider.getConnection();
            Statement stmt2 = con2.createStatement();
            ResultSet srch = stmt2.executeQuery("select anumber, aname, aphno from aadhaar where anumber='" + search + "' or aname='" + search + "' or aphno='" + search + "'");

        %>

        <main class="d-flex align-items-center bg-primary" style="height: 70vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                            <div class="card-header text-center">
                                <span class="fa fa-address-card fa-3x"></span>
                                <br>
                                <p>Search Aadhaar Information</p>
                            </div>
                            <div class="card-body">
                                <form action="Aadhaar.jsp" method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label ">Enter Details</label>
                                        <input placeholder="Enter Aadhaar Number or Name or Phone Number here" name="keyword" required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary"><span class="fa fa-search"></span>&nbsp; Search</button>
                                    </div>
                                    <br>
                                    <div class="mb-3">
                                        <table class="table table-danger">
                                            <tr>
                                                <th class="text-center">Aadhar Number</th>
                                                <th class="text-center">Name</th>
                                                <th class="text-center">Phone Number</th>
                                            </tr>
                                            <% while (srch.next()) {%>
                                            <tr >
                                                <td class="text-center"> <%= srch.getString(1)%> </td>
                                                <td class="text-center"> <%= srch.getString(2)%> </td>
                                                <td class="text-center"> <%= srch.getString(3)%> </td>
                                            </tr>
                                            <% }%>

                                        </table>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </main>
        <br>
        <div class="container-fluid">
            <table class="table table-success">
                <tr>
                    <th class="text-center">Aadhar Number</th>
                    <th class="text-center">Name</th>
                    <th class="text-center">Phone Number</th>
                </tr>
                <% while (st.next()) {%>
                <tr >
                    <td class="text-center"> <%= st.getString(1)%> </td>
                    <td class="text-center"> <%= st.getString(2)%> </td>
                    <td class="text-center"> <%= st.getString(3)%> </td>
                </tr>
                <% }%>

            </table>
        </div>
    </body>
</html>
