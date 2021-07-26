///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controllers_backup;
//
//import daos.ProductDAO;
//import dtos.CartItemDTO;
//import dtos.OrderDTO;
//import dtos.UserDTO;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.text.NumberFormat;
//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;
//import java.util.Currency;
//import java.util.List;
//import java.util.Locale;
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import utils.EmailUtility;
//
///**
// *
// * @author phath
// */
//public class CompleteOrderController extends HttpServlet {
//
//    public static final String ERROR = "cartForm.jsp";
//    public static final String SUCCESS = "orderCompletion.jsp";
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//      private static final long serialVersionUID = 1L;
// 
//    private String host;
//    private String port;
//    private String emailSender;
//    private String nameSender;
//    private String pass;
// 
//    @Override
//    public void init() {
//        // reads SMTP server setting from web.xml file
//        ServletContext context = getServletContext();
//        host = context.getInitParameter("host");
//        port = context.getInitParameter("port");
//        emailSender = context.getInitParameter("email");
//        nameSender = context.getInitParameter("name");
//        pass = context.getInitParameter("pass");
//    }
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        HttpSession session = request.getSession();
//        String url = ERROR;
//       
//        String MailMessage ="";
//        try {
//            
//            UserDTO user = (UserDTO) session.getAttribute("user");
//            String userID;
//            List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
//            if (user != null) {
//                userID = user.getUserID();
//            } else {
//                userID = null; 
//            }
//            String codeID ="";
//            double price = Double.parseDouble(request.getParameter("price"));
//            String name = request.getParameter("name");
//            String email = request.getParameter("email");
//            String phone = request.getParameter("phone");
//            String address = request.getParameter("address").concat(" " + request.getParameter("city"));
//            String method = request.getParameter("method");                  
//            ProductDAO dao = new ProductDAO();
//            
// 
//            if (cart != null) {
//              
//                MailMessage = "Your billing was sent to Email."+email;
//                OrderDTO neworder;
//                neworder =dao.completeOrder(cart, address, name, email, phone, userID, codeID, method, price);
//                dao.addOrderDetail(cart,neworder.getOrderID());
//                request.setAttribute("msg", "Thank you.Your order was recieved");
//                request.setAttribute("mailMsg",MailMessage);
//                request.setAttribute("newOrder",neworder);
//                session.removeAttribute("cart");
//                //send Mail
//                 String subject = "Your billing at SE15AppleShop";
//                  String content = "<table width='100%' border='1' align='center'>"
//                + "<tr align='center'>"
//                + "<td><b>OrderID<b></td>"
//                + "<td><b>CustomerName<b></td>"
//                + "<td><b>Address<b></td>"
//                + "<td><b>Email<b></td>"
//                + "<td><b>Order time<b></td>"
//                + "<td><b>Expected Day<b></td>"          
//                + "<td><b>Total<b></td>"     
//                + "<td><b>Method<b></td>"           
//                + "</tr>"
//                + "<tr align='center'>"
//                + "<td><b>"+neworder.getOrderID()+"<b></td>"
//                + "<td><b>"+neworder.getCusName()+"<b></td>"
//                + "<td><b>"+neworder.getAddress()+"<b></td>"
//                + "<td><b>"+neworder.getEmail()+"<b></td>"
//                + "<td><b>"+neworder.getOrderCreateDate()+"<b></td>"
//                + "<td><b>"+neworder.getOrderExpectDate()+"<b></td>"
//                + "<td><b>"+formatPrice(neworder.getPrice())+"<b></td>"     
//                + "<td><b>"+neworder.getPayMethod()+"<b></td>"           
//                + "</tr>";           
//                  
//
//            EmailUtility.sendEmail_1(host, port, emailSender, nameSender, pass, email, subject, content);
//                //end send Mail
//                url = SUCCESS;
//            }
//        } catch (Exception e) {
//            request.setAttribute("error", e);
//            e.printStackTrace();
//        } finally {
//            
//            request.getRequestDispatcher(url).forward(request, response);
//        }
//    }
//    public String formatPrice(double price){
//        
//        // Create a new Locale
//        Locale VietNam = new Locale("nv", "VN");
//        // Create a Currency instance for the Locale
//        Currency vietnamDong = Currency.getInstance(VietNam);
//        // Create a formatter given the Locale
//        NumberFormat vndFormat = NumberFormat.getCurrencyInstance(VietNam);
//        return vndFormat.format(price);
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
