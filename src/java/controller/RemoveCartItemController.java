/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dtos.CartItemDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class RemoveCartItemController extends HttpServlet {

    private static final String SUCCESS ="MainController?action=ViewCart";
    private static final String ERROR = "error.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.err.println("Run Through RemoveCartItemController");
        response.setContentType("text/html;charset=UTF-8");    
        String url=request.getParameter("page");
        
        try{
            
            List<CartItemDTO> cart =(List<CartItemDTO>) session.getAttribute("cart");
            int index = isExisting(request.getParameter("productID"), 
                            request.getParameter("color"), request.getParameter("ram"), 
                            request.getParameter("storage"), cart);
            cart.remove(index);
            
            if (cart.isEmpty())
                cart=null;

            System.out.println("REMOVE SUCCESS!!!");
            
            session.setAttribute("cart", cart);
            url=SUCCESS;
            if(request.getParameter("page")!=null){
                url=request.getParameter("page");
            }
        } catch (Exception e) {
            log ("ERROR at RemoveCartItemController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            //response.sendRedirect(url);
        }
    }
    
    private int isExisting(String productID, String color, String ram, String storage, List<CartItemDTO> cart){
        System.out.println("isExisting do work");
        for (int i = 0; i < cart.size(); i++){
            if(cart.get(i).getProduct().getProductID().trim().equalsIgnoreCase(productID) 
                    && cart.get(i).getProduct().getColor().trim().equalsIgnoreCase(color)
                    && cart.get(i).getProduct().getRam().trim().equalsIgnoreCase(ram) 
                    && cart.get(i).getProduct().getStorage().trim().equalsIgnoreCase(storage)){
                System.out.println("the index is: " + i);
                return i;
            }
        }
        System.out.println("can`t find one!");
        return -1;
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
