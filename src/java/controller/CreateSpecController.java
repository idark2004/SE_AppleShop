/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.ProductDAO;
import dtos.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class CreateSpecController extends HttpServlet {

    
    private static final String ERROR = "error.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("go through?");
        String url=ERROR;
        String id = request.getParameter("productID");
        String newSpecID = request.getParameter("newSpecID");
        String newColor = request.getParameter("newColor");
        String newRam = request.getParameter("newRam");
        String newStorage = request.getParameter("newStorage");
        double newPrice = Double.parseDouble(request.getParameter("newPrice"));
        int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));
        try {
            ProductDTO newProductSpec=new ProductDTO();
            newProductSpec.setProductID(id);
            newProductSpec.setSpecID(newSpecID);
            newProductSpec.setColor(newColor);
            newProductSpec.setRam(newRam);
            newProductSpec.setStorage(newStorage);
            newProductSpec.setPrice(newPrice);
            newProductSpec.setTotalQuantity(newQuantity);
            
            ProductDAO pDAO = new ProductDAO();
            if (pDAO.CreateSpec(newProductSpec)){
                url="MainController?action=UpdateProductManagement&productID="+id;
                System.out.println("success");
            }
            
        } catch (Exception e) {
            log ("ERROR at CreateSpecController: " + e.getMessage());
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
