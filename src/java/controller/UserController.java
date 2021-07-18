/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
import dtos.ErrorDTO;
import dtos.UserDTO;
import java.io.IOException;
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
public class UserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";
    private static final String FAIL_SIGNUP = "signupForm.jsp";
    private static final String INDEX = "index.jsp";
    private static final String MND = "DashBoard.jsp";
    private static final String UPDATE_SUCCESS = "userProfile.jsp";
    
    private String host;
    private String port;
    private String email;
    private String name;
    private String pass;
 
    @Override
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        email = context.getInitParameter("email");
        name = context.getInitParameter("name");
        pass = context.getInitParameter("pass");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = ERROR;
        ErrorDTO error = new ErrorDTO();
        String perform = request.getParameter("perform");
        String emaill = request.getParameter("email");
        String password = request.getParameter("password");
        UserDTO user = new UserDTO();
        UserDAO dao = new UserDAO();
        System.out.println("user controller perform"+perform);
        try {
            switch (perform) {
                case "Sign Up":

                    String confirm = request.getParameter("confirm");
                    String name = request.getParameter("name");
                    String address = request.getParameter("address");
                    String phoneNumber = request.getParameter("phone");
                    if (confirm.equals(password)) {
                        user = new UserDTO(emaill, name, password, address, phoneNumber, "US");
                        dao.insert(user);
                        url = INDEX;
                    } else {
                        error.setPasswordError("Passwords don't match");
                        request.setAttribute("SIGNUP_ERROR", error);
                        url = FAIL_SIGNUP;
                    }
                    break;

                case "Log in":
                    boolean IsAUser = false;
                    user = dao.checkLogin(emaill, password);
                    if (user != null) {
                        IsAUser = true;
                    }
                    if (IsAUser) {//neu co trong db
                        session.setAttribute("USER", user);
                        if (user.getRoleID().contains("AD") || user.getRoleID().contains("MN")) {
                            url = MND;
                        } else {
                            url = "MainController?action=Product&perform=Index";
                        }
                        request.setAttribute("success", "true");
                        request.setAttribute("username", user.getName());
                        request.setAttribute("userid", user.getUserID());
                    } else {//khong co
                        System.out.println("WRONG");
                        error.setLoginError("Invalid username or password");
                        request.setAttribute("LOGIN_ERROR", error);
                    }
                    System.out.println("url login "+url);
                    break;
                case "Update Profile":
                    user = (UserDTO) session.getAttribute("USER");
                    user.setAddress(request.getParameter("address"));
                    user.setPhone(request.getParameter("phone"));
                    if (dao.UpdateUserDetail(user)) {
                        url = UPDATE_SUCCESS;
                        request.setAttribute("UPDATE_SUCCESS", "Update successfully");
                    } else{
                    request.setAttribute("ERROR", "No user found to update");
                    }
                    break;
                case "Contact":
                    String userName = request.getParameter("fullname");
                    String userEmail = request.getParameter("email");
                    String subject = request.getParameter("subject");
                    String description = request.getParameter("description");

                    String message = "";
                    
                    String content = "From Customer: " + userName
                        + "\nEmail for Contract: " + userEmail
                        + "\nDescription: " + description;
                    
                    EmailUtility.sendEmail(host, port, email, "Shop Email", pass, email, subject, content);
                    System.out.println(content);
                    url="contact.jsp";
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", e.toString());
        } finally {
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
