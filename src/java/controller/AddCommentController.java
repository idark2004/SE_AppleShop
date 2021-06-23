/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.CommentDAO;
import dtos.CommentDTO;
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
public class AddCommentController extends HttpServlet {

    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("go through?");
        String url = ERROR;
        try {
            String aaaaaaaaaaaaaaaaaaa;
            String productId = request.getParameter("productID");
            String ownerName = request.getParameter("reviewer-name");
            String description = request.getParameter("pComment");
            CommentDTO newComment = new CommentDTO();
            CommentDAO dao = new CommentDAO();
            UserDTO user;
            newComment.setProductID(productId);
            newComment.setOwnerName(ownerName);
            newComment.setDescription(description);
            if (session.getAttribute("user") != null) {
                user = (UserDTO) session.getAttribute("user");
                newComment.setUserID(user.getUserID());
            } else {
                newComment.setUserID(null);
            }            
            if (dao.CreateComment(newComment)) {
                url = "MainController?action=ProductDetail&productID=" + productId;
                System.out.println("comment success");
            }

        } catch (Exception e) {
            log("ERROR at CreateSpecController: " + e.getMessage());
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
