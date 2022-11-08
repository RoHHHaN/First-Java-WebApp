
import com.website.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Bill extends HttpServlet {
    
    String uuid="SD-",date="",time="",phone="9933414729",type="WBSEDCLQOB";
        
    public String uuidGen() {
        StringBuffer buffer = new StringBuffer();
        Random random = new Random();
        char[] chars = new char[]{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
            'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
            'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F',
            'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
            'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4',
            '5', '6', '7', '8', '9', '0'};
        for (int i = 0; i < 11; i++) {
            buffer.append(chars[random.nextInt(chars.length)]);
        }
        return buffer.toString();
    }
    public void dateTime(){
    	DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
    	time = dateFormat.format(new Date()).toString();
    	DateFormat dateFormat2 = new SimpleDateFormat("dd/MM/yyyy");
    	date = dateFormat2.format(new Date()).toString();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String x = uuidGen();
            uuid+=x;
            dateTime();
            try {
                String ConsId = request.getParameter("custid");
                String Fmonth = request.getParameter("from");
                String Tmonth = request.getParameter("to");
                String Amount = request.getParameter("amnt");
                String Month = Fmonth + "--" + Tmonth;
                String Status = request.getParameter("status-type");
                
                Connection con = ConnectionProvider.getConnection();
                String Query = "insert into bill(date, time, phone, type, status, months, cid, amnt, uuid) values(?,?,?,?,?,?,?,?,?)";

                PreparedStatement st = con.prepareStatement(Query);
                st.setString(1, date);
                st.setString(2, time);
                st.setString(3, phone);
                st.setString(3, type);
                st.setString(3, Status);
                st.setString(3, Month);
                st.setString(3, ConsId);
                st.setString(3, Amount);
                st.setString(3, uuid);
                st.executeUpdate();
            } catch (Exception e) {
                out.println("<h1>" + e.getMessage() + "</h1>");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
