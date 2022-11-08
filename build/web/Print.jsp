<%-- 
    Document   : Print
    Created on : 03-Nov-2022, 11:29:51 pm
    Author     : mysterio
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.website.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AR Software | Printing Bills</title>

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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/PrintArea/2.4.1/jquery.PrintArea.js" integrity="sha512-GhQdBWSddrd8ijiuwA0LZ7ppPcPrJOZAtGMOmgO/371vPNUNm/mKdNc13T/2UWLp5vLIcaDvh/9NwCRZAdxgFw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>
    <body >
        <%            String slno = request.getParameter("sl");
            String phone = "", type = "", status = "SUCCESS", date = "", time = "", uuid = "", cid = "", amount = "";

            Connection con = ConnectionProvider.getConnection();
            Statement stmt = con.createStatement();
            ResultSet st = stmt.executeQuery("select date, time, phone, type, uuid, cid, amnt from bill where slno='" + slno + "'");
            if (st.next()) {
                phone = st.getString("phone");
                type = st.getString("type");
                date = st.getString("date");
                time = st.getString("time");
                uuid = st.getString("uuid");
                cid = st.getString("cid");
                amount = st.getString("amnt");
            }
        %>
        <div style="background: white; height: 450px; width: 258px;" class="r-print">
            <div>

                <table style="width: 240px" >
                    <img style="height: 100px; width: 100px;margin-left: 60px; " src="Image/spice-money.png"/>
                    <tr>
                        <td colspan="2"><label for="exampleInputEmail1" class="form-label" style="font-weight: bold;">Customer Information :</label></td>
                    </tr>
                    <tr>
                        <td><label for="exampleInputEmail1" class="form-label" >Mobile No :</label></td>
                        <td><label for="exampleInputEmail1" class="form-label" ><%= phone%></label></td>
                    </tr>
                    <tr>
                        <td colspan="2"><label for="exampleInputEmail1" class="form-label" style="font-weight: bold;">Transaction Info :</label></td>
                    </tr>
                    <tr>
                        <td><label for="exampleInputEmail1" class="form-label" >Transaction Type :</label></td>
                        <td><label for="exampleInputEmail1" class="form-label"><%= type%></label></td>
                    </tr>
                    <tr>
                        <td><label for="exampleInputEmail1" class="form-label" >Transaction Status :</label></td>
                        <td><label for="exampleInputEmail1" class="form-label"><%= status%></label></td>
                    </tr>
                </table>
                <table style="border: solid 1px black;  margin-bottom: 10px; width: 235px">
                    <tr style="">
                        <td style="border: solid 1px black; padding: 5px;">Date : </td>
                        <td style="border: solid 1px black; padding: 5px;"><%= date%></td>
                    </tr>
                    <tr>
                        <td style="border: solid 1px black; padding: 5px;">Time : </td>
                        <td style="border: solid 1px black; padding: 5px;"><%= time%></td>
                    </tr>
                    <tr>
                        <td style="border: solid 1px black; padding: 5px;">UUID : </td>
                        <td style="border: solid 1px black; padding: 5px;"><%= uuid%></td>
                    </tr>
                    <tr>
                        <td style="border: solid 1px black; padding: 5px;">Consumer ID : </td>
                        <td style="border: solid 1px black; padding: 5px;"> <%= cid%></td>
                    </tr>
                    <tr>
                        <td style="border: solid 1px black; padding: 5px;">Total : </td>
                        <td style="border: solid 1px black; padding: 5px;"><%= amount%></td>
                    </tr>
                </table>

            </div>
        </div>
        <script>
            $(document).ready(function () {
                var mode = 'iframe';
                var close = mode == "popup";
                var options = {mode: mode, popClose: close};
                $("div.r-print").printArea(options);

            });
        </script>
    </body>
</html>
