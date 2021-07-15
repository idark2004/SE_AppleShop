/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.OrderDAO;
import daos.UserDAO;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import dtos.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class OrderDetailController extends HttpServlet {

    private static final String SUCCESS ="orderHistoryDetail.jsp";
    private static final String ERROR = "error.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        String id = request.getParameter("orderID").trim();
        try {
            OrderDAO oDAO= new OrderDAO();
            UserDAO uDAO = new UserDAO();
            UserDTO  u = new UserDTO();
            OrderDTO order= oDAO.getOrder(id);
            ArrayList<OrderDetailDTO> orderDetail = oDAO.getAllOrderDetail(id);
            
            u = uDAO.getUserProfile(order.getUserID());
            System.out.println(u.getEmail()+"dd");
            request.setAttribute("order", order);
            if(u!=null){request.setAttribute("userDetail",u);}
            else System.out.println("user null");
            //request.setAttribute("detail", orderDetail);
            if(orderDetail != null){
                request.setAttribute("detail", orderDetail);
            } else{
                request.setAttribute("EMPTY_LIST", "no Order is found");
            }
            url=SUCCESS;
        } catch (Exception e) {
            log ("ERROR at OrderDetailController: " + e.getMessage());
            request.setAttribute("ERROR", e.getMessage());
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
