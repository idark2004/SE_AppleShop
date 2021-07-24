/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";           
    private static final String PRODUCTMANAGEMENT="ManageProductController";
    private static final String UPDATEPRODUCT="UpdateProductController";
    private static final String CREATESPEC="CreateSpecController";    
    private static final String CHANGEPASS="ChangePasswordController";
    private static final String GOOGLE="GoogleSignInController";
    private static final String SALECODE="SaleCodeController";
    private static final String ORDERLIST="OrderListController";
    private static final String USER = "UserController";
    private static final String PRODUCT= "ProductController";
    private static final String SEARCHPRODUCT= "SearchProductController";
    private static final String CART = "CartController";
    private static final String ORDERCHANGE= "OrderChangeStatusController";
    private static final String ORDERDETAIL= "OrderDetailController";
    private static final String MANAGE_USER="ManageUserController";
    private static final String GUARANTEE="GuaranteeController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        System.out.println("Run through MainController");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String action = request.getParameter("action");
        System.out.println(action);
        //System.out.println(session.getAttribute("username"));
        
        if (action == null){
            url="MainController?action=Product&perform=Index";
        }
        
        try {           
            switch (action){                                
                case "SearchProduct":
                    url= SEARCHPRODUCT;
                    break;                                    
                case "Manage Product":
                    url=PRODUCTMANAGEMENT;
                    break;
                case "Update Product Detail":
                    url=UPDATEPRODUCT;
                    break;
                case "Create new option":
                    url=CREATESPEC;
                    break;                
                case "Change Password":
                    url = CHANGEPASS;
                    break;
                case "Google":
                    url = GOOGLE;
                    break;
                case"SaleCode":
                    url = SALECODE;
                    break;
                case "ChangeStatus":
                    url = ORDERCHANGE;
                    break;    
                case "OrderList":
                    url = ORDERLIST;
                    break;
                case "OrderDetail":
                    url = ORDERDETAIL;
                    break;    
                case "User":
                    url = USER;
                    break;
                case "Product":
                    url = PRODUCT;
                    break;

                case "Cart":
                    url = CART;
                    break;
                    
                case "Manage User":
                    url =MANAGE_USER;
                    break;
                case "Guarantee":
                    url = GUARANTEE;
                    break;
                default:
                    url="MainController?action=Product&perform=Index";
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", e.toString());
        } finally {
            System.out.println(url);
            request.getRequestDispatcher(url).forward(request, response);
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
