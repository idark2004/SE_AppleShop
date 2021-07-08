/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
import dtos.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class LoginController extends HttpServlet {

//    private static final String SUCCESS = "MainController";
//    private static final String ERROR = "MainController?action=LoginForm";
    private static final String USER = "index.jsp";
    private static final String ERROR = "loginForm.jsp";
    private static final String MAD = "dashBoard.jsp";

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
        HttpSession session = request.getSession();
        System.err.println("Run Through LoginController");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String uname = request.getParameter("uname");
            String psw = request.getParameter("psw");

            boolean IsAUser = false; //xac thuc co hay khong
            UserDAO ud = new UserDAO();

            UserDTO u = ud.checkLogin(uname, psw);
            if (u != null) {
                IsAUser = true;
            }

            if (IsAUser) {//neu co trong db
                session.setAttribute("user", u);
                if (u.getRoleID().contains("AD") || u.getRoleID().contains("MN")) {
                    url = MAD;
                } else {
                    url = USER;
                }
                request.setAttribute("success", "true");
                request.setAttribute("username", u.getName());
                request.setAttribute("userid", u.getUserID());
            } else {//khong co
                System.out.println("WRONG");
                request.setAttribute("ERROR", "Invalid username or password");
            }
        } catch (Exception e) {
            log("ERROR at LoginController: " + e.getMessage());
        } finally {
            System.out.println("This is the user: " + session.getAttribute("user"));
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
