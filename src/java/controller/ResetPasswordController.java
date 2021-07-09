/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
import dtos.UserDTO;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.EmailUtility;

/**
 *
 * @author ADMIN
 */
public class ResetPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;
 
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
    
    static String AlphaNumericString(int n)
    {
  
        // chose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz";
  
        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(n);
  
        for (int i = 0; i < n; i++) {
  
            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                = (int)(AlphaNumericString.length()
                        * Math.random());
  
            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                          .charAt(index));
        }
  
        return sb.toString();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String recipient = request.getParameter("email");
        String subject = "Your Password has been reset";
 
        String message = "";
 
        try {
            UserDAO uDAO = new UserDAO();
            UserDTO user = new UserDTO();
            user = uDAO.findByEmail(recipient);
            if(user!=null){
            String newPassword = AlphaNumericString(10);

            user.setPassword(newPassword);
            uDAO.UpdateUserPassword(user);

            String content = "Hi, this is your new password: " + newPassword;
            content += "\nNote: for security reason, "
                    + "you must change your password after logging in.";            
         
         
           
            EmailUtility.sendEmail(host, port, email, name, pass, recipient, subject, content);
            message = "Your password has been reset. Please check your e-mail.";
            }else{message = "Email:"+recipient+" is not exist";}
        } catch (Exception ex) {
            ex.printStackTrace();
            message = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("message", message);
            request.getRequestDispatcher("forgetPass.jsp").forward(request, response);
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
