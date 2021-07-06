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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class SignupController extends HttpServlet {

    public static final String SUCCESS="loginForm.jsp";
    public static final String ERROR = "signup.jsp";
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
       String url = ERROR;
        ErrorDTO error = new ErrorDTO();
        try {
            String emaill= request.getParameter("email");
            String password= request.getParameter("password");
            String confirm= request.getParameter("confirm");
            String name= request.getParameter("name");
            String address= request.getParameter("address");
            String phoneNumber= request.getParameter("pnum");
            if(confirm.equals(password)){
                UserDTO user = new UserDTO(emaill, name, password, address, phoneNumber, "US");
                UserDAO dao = new UserDAO();
                dao.insert(user);
                request.setAttribute("signup","SignUp Succesful");
                url = SUCCESS;
           } else{
                error.setPasswordError("Passwords don't match");
                request.setAttribute("SIGNUP_ERROR", error);
            }
        } catch (Exception e) {
            log("Error at SignUpController " + e.toString());
            if(e.toString().contains("duplicate")){
                error.setEmailError("E-mail has already been used");
                request.setAttribute("SIGNUP_ERROR", error);                
            }
        }
        finally{
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
