<%-- 
    Document   : OldBill
    Created on : 04-Nov-2022, 1:21:23 am
    Author     : mysterio
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="com.website.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AR Software | Old Bill</title>

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
    <body class="bg-primary">
        <%@include file="ProfileHeader.jsp" %>

        <%            
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DATE, -1);

            SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
            dt.setTimeZone(TimeZone.getTimeZone("IST"));
            String oldDate = dt.format(cal.getTime());

            Connection con = ConnectionProvider.getConnection();
            Statement stmt = con.createStatement();
            ResultSet st = stmt.executeQuery("select slno, date, time, phone, type, status, months, uuid, cid, amnt from bill");

            String param = request.getParameter("kw");
            String from = request.getParameter("frm");
            String to = request.getParameter("tdt");

            if (param != null) {
                String Query = "select slno, date, time, phone, type, status, months, uuid, cid, amnt from bill where slno>0 and date='" + oldDate + "' order by slno desc;";
                st = stmt.executeQuery(Query);
                param = "";
            } else if (from != null && to != null) {
                String Query = "select slno, date, time, phone, type, status, months, uuid, cid, amnt from bill where slno>0 and date between '" + from + "' and '" + to + "' order by slno desc;";
                st = stmt.executeQuery(Query);
                from = "";
                to = "";
            }

        %>
        <div class="container" style="margin-top: 10px">
            <form action="OldBill.jsp" method="post" id="ob-form" class="bg-new" style="border-radius: 30px;">
                <center>
                    <table class="text-center">
                        <tr>
                            <td style="padding: 10px;" colspan="2"><a href="OldBill.jsp?kw=yesterday" class="btn btn-secondary">Yesterday</a></td>

                        </tr>

                        <tr>
                            <td style="padding: 10px;"><input style="border-radius: 10px; border: none;" type="text" placeholder="From Date" name="frm"/></td>
                            <td style="padding: 10px;"><input style="border-radius: 10px; border: none;" type="text" placeholder="To Date" name="tdt"/></td>

                        </tr>

                        <tr>
                            <td style="padding: 10px;" colspan="2"><button type="submit" class="btn btn-primary"><span class="fa fa-search"></span>&nbsp;Search</button></td>
                        </tr>
                    </table>
                </center>
            </form>
        </div>
        <div class="container-fluid mt-5">
            <table class="table table-success">
                <tr>
                    <th class="text-center">Sl</th>
                    <th class="text-center">Date</th>
                    <th class="text-center">Time</th>
                    <th class="text-center">Phone</th>
                    <th class="text-center">Transaction Type</th>
                    <th class="text-center">Transaction Status</th>
                    <th class="text-center">Months</th>
                    <th class="text-center">UUID</th>
                    <th class="text-center">Consumer ID</th>
                    <th class="text-center">Amount</th>
                    <th class="text-center">Print Bill</th>
                </tr>
                <% while (st.next()) {%>
                <tr >
                    <td class="text-center"> <%= st.getString(1)%> </td>
                    <td class="text-center"> <%= st.getString(2)%> </td>
                    <td class="text-center"> <%= st.getString(3)%> </td>
                    <td class="text-center"> <%= st.getString(4)%> </td>
                    <td class="text-center"> <%= st.getString(5)%> </td>
                    <td class="text-center"> <%= st.getString(6)%> </td>
                    <td class="text-center"> <%= st.getString(7)%> </td>
                    <td class="text-center"> <%= st.getString(8)%> </td>
                    <td class="text-center"> <%= st.getString(9)%> </td>
                    <td class="text-center"> <%= st.getString(10)%> </td>
                    <td class="text-center"><a target="_blank" href="Print.jsp?sl=<%=st.getString(1)%>"><span class="fa fa-print">&nbsp;</span>Print</a></td>
                </tr>
                <% }%>

            </table>
        </div>
        <script>
            $(document).ready(function () {
                $("#ob-form").on('submit', function (event) {

                    var f = $(this).serialize();

                    console.log(f);

                    $.ajax({
                        url: "OldBill.jsp",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("Success");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("Error!!");
                        }
                    })
                })
            });
        </script>
    </body>
</html>
