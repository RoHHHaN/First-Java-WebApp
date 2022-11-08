<%-- 
    Document   : PayBill
    Created on : 03-Nov-2022, 5:19:02 pm
    Author     : mysterio
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.website.helper.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AR Software | Pay Bill</title>

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
        <main class="d-flex align-items-center bg-primary" style="height: 60vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header text-center">
                                <span class="fa fa-paypal"></span>
                                <br>
                                <p>Enter Billing Details</p>
                            </div>
                            <div class="pe-2 ps-2">
                                <form action="BillPay" method="post" id="bill-pay-form">
                                    <div class="mb-3">
                                        <table class="container-fluid ">
                                            <tr class="text-center ">
                                                <td>
                                                    <label for="exampleInputEmail1" class="form-label">Consumer ID</label><br>
                                                    <input name="custid" required type="text" class="form-control" id="exampleInputEmail1 bill-box" aria-describedby="emailHelp">
                                                </td>
                                                <td>
                                                    <label for="exampleInputEmail1" class="form-label">Amount</label><br>
                                                    <input name="amnt" required type="text" class="form-control" id="exampleInputEmail1 bill-box" aria-describedby="emailHelp">
                                                </td>
                                            </tr>

                                            <tr class="text-center">
                                                <td>
                                                    <span>From Month</span>
                                                    <select name="from" style="background: #279a2b;" class=" form-select text-center" aria-label="Default select example">
                                                        <option Value="X">X</option>
                                                        <option value="Januany">January</option>
                                                        <option value="February">February</option>
                                                        <option value="March">March</option>
                                                        <option value="April">April</option>
                                                        <option value="May">May</option>
                                                        <option value="June">June</option>
                                                        <option value="July">July</option>
                                                        <option value="August">August</option>
                                                        <option value="September">September</option>
                                                        <option value="October">October</option>
                                                        <option value="November">November</option>
                                                        <option value="December">December</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <span>To Month</span>
                                                    <select name="to" style="background: #86bd3f;" class="form-select text-center" aria-label="Default select example">
                                                        <option Value="X">X</option>
                                                        <option value="Januany">January</option>
                                                        <option value="February">February</option>
                                                        <option value="March">March</option>
                                                        <option value="April">April</option>
                                                        <option value="May">May</option>
                                                        <option value="June">June</option>
                                                        <option value="July">July</option>
                                                        <option value="August">August</option>
                                                        <option value="September">September</option>
                                                        <option value="October">October</option>
                                                        <option value="November">November</option>
                                                        <option value="December">December</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr class="text-center">
                                                <td>
                                                    <label  for="exampleInputEmail1" class="">Transaction Type</label><br>
                                                    <select name="status-type" style="background: #d28a8a;" class="form-select text-center" aria-label="Default select example">
                                                        <option value="Paid">Paid</option>
                                                        <option value="Pending">Pending</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <label  for="exampleInputEmail1" class="">Phone Number</label><br>
                                                    <input name="phone" value="9933414729" required type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="container text-center mb-2">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </main>
        <br>
        <%            
            int i = 0;
            Date dt = new Date();
            SimpleDateFormat sd2 = new SimpleDateFormat("dd/MM/yyyy");
            sd2.setTimeZone(TimeZone.getTimeZone("IST"));
            String date = sd2.format(dt);

            Connection con = ConnectionProvider.getConnection();
            Statement stmt = con.createStatement();
            ResultSet st = stmt.executeQuery("select slno, date, time, phone, type, status, months, uuid, cid, amnt from bill where slno>0 and date='" + date + "' order by slno desc;");
        %>
        <div class="container-fluid">
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
                <% while (st.next()) {
                        i++;
                %>
                <tr >
                    <td class="text-center"> <%= i%> </td>
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
        <div id="paid-pop" class="alert alert-success position-absolute top-0 start-50 translate-middle-x" role="alert">

        </div>
        <script>
            $("#paid-pop").hide();
            $(document).ready(function () {
                $("#bill-pay-form").on('submit', function (event) {
                    event.preventDefault();

                    var f = $(this).serialize();

                    console.log(f);

                    $.ajax({
                        url: "BillPay",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("Success");
                            $("#paid-pop").html("Bill Paid Successfully");
                            $("#paid-pop").show().delay(1000).fadeOut();
                            $("#bill-box").val("");
                            $("#bill-box").val("");
                            location.reload(true);
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
