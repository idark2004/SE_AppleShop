/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.OrderDAO;
import daos.ProductDAO;
import daos.SaleCodeDAO;
import dtos.CartItemDTO;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import dtos.ProductDTO;
import dtos.SaleCodeDTO;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Currency;
import java.util.List;
import java.util.Locale;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.EmailUtility;
/**
 *
 * @author phath
 */
public class CartController extends HttpServlet {

    public static final String ERROR = "error.jsp";
    public static final String ORDERED = "orderCompletion.jsp";
    private static String host;
    private static String port;
    private static String emailSender;
    private static String nameSender;
    private static String pass;
 
    @Override
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        emailSender = context.getInitParameter("email");
        nameSender = context.getInitParameter("name");
        pass = context.getInitParameter("pass");
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = ERROR;
        ProductDAO dao = new ProductDAO();
        SaleCodeDAO sDAO = new SaleCodeDAO();
        OrderDTO newOrder = new OrderDTO();
        OrderDAO oDAO= new OrderDAO();
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
        String perform = request.getParameter("perform");
        try {
            switch (perform) {
                case "Order Complete":
                    String cusName = request.getParameter("cusName");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String payMethod = request.getParameter("payMethod");
                    String codeSale = request.getParameter("saleCode");
                    if (codeSale.length() == 0){
                        codeSale = null;
                    }
                    double total = Double.parseDouble(request.getParameter("total"));
                    String userID = null;
                    if (cart != null) System.out.println("cart <> null");
                    else System.out.println("cart null");
                    if (cart != null) {
                        newOrder = dao.completeOrder(cart, address, cusName, email, phone, userID, codeSale, payMethod, total);
                        System.out.println("Go");
                        String orderID = newOrder.getOrderID();
                        boolean check = dao.addOrderDetail(cart, orderID);
                       
                        System.out.println("Thru");
                        request.setAttribute("newOrder",newOrder);
                        ArrayList<OrderDetailDTO> orderDetail = oDAO.getAllOrderDetail(orderID);
                        sendEmail(orderDetail,newOrder, email);
                        request.setAttribute("detail", orderDetail);
                        if (check) {
                            session.removeAttribute("cart");
                            url = ORDERED;
                        }
                    }
                    break;
                case "AddItem":
                    ProductDAO prDAO=new ProductDAO();
                    String productID= request.getParameter("productID").trim();
                    String color= request.getParameter("color").trim();
                    String specID= request.getParameter("hardware").trim();
                    int qty = Integer.parseInt(request.getParameter("Quantity"));
                    
                    ProductDTO product=prDAO.GetSpec(specID);
                    if(prDAO.GetSpec(specID)==null) System.err.println("null spec");
                    else System.err.println("not null");
                    if (product!=null){
                        for(int i=0; i<qty; i++){
                            if(session.getAttribute("cart")==null){
                                cart = new ArrayList<CartItemDTO>();
                                cart.add(new CartItemDTO(prDAO.GetSpec( 
                                        specID), 1));
                                session.setAttribute("cart", cart);
                                url="MainController?action=Product&perform=ViewDetail&productID="+productID+"&color="+color+"&specID="+specID;
                            }
                            else {
                                int index = isExisting( 
                                        specID, cart);
                                if (index == -1){
                                    cart.add(new CartItemDTO(prDAO.GetSpec(
                                        specID), 1));
                                }
                                else {
                                    int quantity = cart.get(index).getQuantity() + 1;
                                    cart.get(index).setQuantity(quantity);
                                }
                                session.setAttribute("cart", cart);
                                url="MainController?action=Product&perform=ViewDetail&productID="+productID+"&color="+color+"&specID="+specID;
                            }
                        }
                    } else {
                        request.setAttribute("error", "the item isnt exist");
                    }
                    break;
                case "RemoveItem":
                    int index = isExisting(request.getParameter("specID")
                            , cart);
                    cart.remove(index);

                    if (cart.isEmpty())
                        cart=null;

                    System.out.println("REMOVE SUCCESS!!!");

                    session.setAttribute("cart", cart);
                    url="cartDetail.jsp";
                    if(request.getParameter("page")!=null){
                        url=request.getParameter("page");
                    }
                    break;
                case "AddOneItem":
                    int AddIndex = isExisting(request.getParameter("specID")
                            , cart);
                    int AddQuantity = cart.get(AddIndex).getQuantity() + 1;
                    cart.get(AddIndex).setQuantity(AddQuantity);

                    if (cart.isEmpty())
                        cart=null;

                    System.out.println("REMOVE SUCCESS!!!");

                    session.setAttribute("cart", cart);
                    url="cartDetail.jsp";
                    if(request.getParameter("page")!=null){
                        url=request.getParameter("page");
                    }
                    break;
                case "RemoveOneItem":
                    int RemovedIndex = isExisting(request.getParameter("specID")
                            , cart);
                    int RemovedQuantity = cart.get(RemovedIndex).getQuantity() - 1;
                    cart.get(RemovedIndex).setQuantity(RemovedQuantity);

                    if (cart.isEmpty())
                        cart=null;

                    System.out.println("REMOVE SUCCESS!!!");

                    session.setAttribute("cart", cart);
                    url="cartDetail.jsp";
                    if(request.getParameter("page")!=null){
                        url=request.getParameter("page");
                    }
                    break;
                case "addSaleCode":
                    String saleCode = request.getParameter("saleCode");
                    SaleCodeDTO sale=sDAO.ApplyCode(saleCode);
                    System.out.println(sale.getCodeID()+" "+sale.getPercentage());
                    if (sale!=null){
                        request.setAttribute("sale", sale);
                        url="cartDetail.jsp";
                    }
                    else {
                        request.setAttribute("message", "The code does not exist or expired");
                        url="cartDetail.jsp";
                    }
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    
    private int isExisting(String specID, List<CartItemDTO> cart){
        System.out.println("isExisting do work");
        for (int i = 0; i < cart.size(); i++){
            if( cart.get(i).getProduct().getSpecID().trim().equalsIgnoreCase(specID)){
                System.out.println("the index is: " + i);
                int quantity = cart.get(i).getQuantity() + 1;
                System.out.println("with this quantity:" + quantity);
                return i;
            }
        }
        System.out.println("can`t find one!");
        return -1;
    }
    private static  void sendEmail(ArrayList<OrderDetailDTO> orderDetail,OrderDTO newOrder,String email) throws MessagingException, IOException{
                //send Mail
                double total=0;
                String MailMessage = "Your billing was sent to Email."+email;
                 String subject = "Your billing at SE15AppleShop";
                  String content = "<h2>Bill Infor</h2>"
                +"<table width='100%' border='1' align='center'>"
                + "<tr align='center'>"
                + "<td><b>OrderID<b></td>"
                + "<td><b>CustomerName<b></td>"
                + "<td><b>Address<b></td>"
                + "<td><b>Email<b></td>"
                + "<td><b>Order time<b></td>"
                + "<td><b>Expected Day<b></td>"          
                + "<td><b>Total<b></td>"     
                + "<td><b>Method<b></td>"           
                + "</tr>"
                + "<tr align='center'>"
                + "<td><b>"+newOrder.getOrderID()+"<b></td>"
                + "<td><b>"+newOrder.getCusName()+"<b></td>"
                + "<td><b>"+newOrder.getAddress()+"<b></td>"
                + "<td><b>"+newOrder.getEmail()+"<b></td>"
                + "<td><b>"+newOrder.getOrderCreateDate()+"<b></td>"
                + "<td><b>"+newOrder.getOrderExpectDate()+"<b></td>"
                + "<td><b>"+formatPrice(newOrder.getPrice())+"<b></td>"     
                + "<td><b>"+newOrder.getPayMethod()+"<b></td>"           
                + "</tr>"   
                +"</table>"         
                +"<br/>" ;
                 
                content+="<h2>Bill Detail</h2>"          
                +"<table width='100%' border='1' align='center'>"
                + "<tr align='center'>"          
                + "<td><b>ProductName<b></td>"
                + "<td><b>Description<b></td>"
                + "<td><b>Quantity<b></td>"
                + "<td><b>Price Per Product<b></td>"
                + "<td><b>Discount<b></td>"
                + "<td><b>Row Total<b></td>"
                + "</tr>" ;      
                for (OrderDetailDTO orderDetailDTO : orderDetail) {
                   
                content+= "<tr align='center'>"
                + "<td><b>"+orderDetailDTO.getProduct().getName()+"<b></td>"
                + "<td><b>"+"Color: "+orderDetailDTO.getProduct().getColor()
                    +"<br/>Ram: "+orderDetailDTO.getProduct().getRam()
                    +"<br/>Storage: "+orderDetailDTO.getProduct().getStorage()+"<b></td>"
                + "<td><b>"+orderDetailDTO.getQuantity()+"<b></td>"
                + "<td><b>"+formatPrice(orderDetailDTO.getProduct().getPrice())+"<b></td>"
                + "<td><b>"+""+"<b></td>"
                + "<td><b>"+formatPrice(orderDetailDTO.getProduct().getPrice()*orderDetailDTO.getQuantity())+"<b></td>"
                + "</tr>"; 
                
                total += orderDetailDTO.getProduct().getPrice()*orderDetailDTO.getQuantity(); 
                }
               content+="<td colspan=\"6\" style=\"text-align:right\"><strong>TOTAL "+formatPrice(total)+" </strong></td>\n" 
               +"</table>";
            EmailUtility.sendEmail_1(host, port, emailSender, nameSender, pass, email, subject, content);
                //end send Mail
                
    }
    public static String formatPrice(double price){
        
        // Create a new Locale
        Locale VietNam = new Locale("nv", "VN");
        // Create a Currency instance for the Locale
        Currency vietnamDong = Currency.getInstance(VietNam);
        // Create a formatter given the Locale
        NumberFormat vndFormat = NumberFormat.getCurrencyInstance(VietNam);
        return vndFormat.format(price);
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
