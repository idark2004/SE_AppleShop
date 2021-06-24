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
import javax.servlet.http.HttpSession;

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
    private static final String LOGIN = "LoginController";
    private static final String SIGNUP = "SignupController";
    private static final String USERDETAIL = "UserDetailController";
    private static final String UPDATEUSER = "UpdateUserController";
    private static final String PRODUCTDETAIL = "ProductDetailController";
    private static final String ADDCART = "AddToCartController";
    private static final String BUYITEM = "BuyItemController";
    private static final String REMOVECART = "RemoveCartItemController";
    private static final String VIEWCART = "ViewCartController";
    private static final String COMPLETEORDER="CompleteOrderController";
    private static final String PRODUCTLISTMANAGEMENT="ProductListManagementController";
    private static final String PRODUCTMANAGEMENT="ProductDetailManagementController";
    private static final String UPDATEPRODUCT="UpdateProductController";
    private static final String CREATESPEC="CreateSpecController";
    private static final String SUBMITCOMMENT="AddCommentController";
    private static final String CHANGEPASS="ChangePasswordController";
    private static final String GOOGLE="GoogleSignInController";
    private static final String SALECODE="SaleCodeController";
    private static final String ORDERLIST="OrderListController";
    private static final String USERLIST="ViewUserListController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        System.out.println("Run through MainController");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String action = request.getParameter("action");
        System.out.println(action);
        //System.out.println(session.getAttribute("username"));
        try {
            if (action==null){
                url="Homepage.jsp";
            }
            switch (action){
                case "LoginForm":
                    url="loginForm.jsp";
                    break;
                case "Login":
                    url=LOGIN;
                    break;
                case "Sign Up":
                    url=SIGNUP;
                    break;
                case "UserDetail":
                    url=USERDETAIL;
                    break;
                case "UpdateProfile":
                    url=UPDATEUSER;
                    break;
                case "ProductDetail":
                    url=PRODUCTDETAIL;
                    break;
                case "AddItem":
                    url=ADDCART;
                    break;
                case "Add to cart":
                    url=ADDCART;
                    break;
                case "Buy Now":
                    url=BUYITEM;
                    break;
                case "RemoveCart":
                    url=REMOVECART;
                    break;
                case "ViewCart":
                    url=VIEWCART;
                    break;
                case "Finish Checkout":
                    url=COMPLETEORDER;
                    break;
                case "ProductListManagement":
                    url=PRODUCTLISTMANAGEMENT;
                    break;
                case "UpdateProductManagement":
                    url=PRODUCTMANAGEMENT;
                    break;
                case "ProductDetailManagement":
                    url=PRODUCTMANAGEMENT;
                    break;
                case "Update Product Detail":
                    url=UPDATEPRODUCT;
                    break;
                case "Create new option":
                    url=CREATESPEC;
                    break;
                case "Submit comment":
                    url = SUBMITCOMMENT;
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
                case "OrderList":
                    url = ORDERLIST;
                    break;
                case "UserList":
                    url = USERLIST;
                    break;
                default:
                    url="Homepage.jsp";
                    break;
            }
        } catch (Exception e) {
            log ("ERROR at MainController: " + e.getMessage());
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
