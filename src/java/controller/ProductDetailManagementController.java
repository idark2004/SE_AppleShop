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
public class ProductDetailManagementController extends HttpServlet {

    private static final String SUCCESS1 ="updateProductManagement.jsp";
    private static final String SUCCESS2 ="productDetailManagement.jsp";
    private static final String ERROR = "error.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        String id = request.getParameter("productID");
        String colorChoosen = request.getParameter("color");
        String specChosen = request.getParameter("specID");
        String action = request.getParameter("action");
        try {
            ProductDAO pDAO= new ProductDAO();
            
            ProductDTO product= pDAO.getProduct(id);
            List<ProductDTO> color= pDAO.getAllColor(id);
            List<ProductDTO> hardware= pDAO.getAllHardwareWithColor(id, colorChoosen);
            ProductDTO spec=pDAO.getPriceAndQuantity(id, colorChoosen, specChosen);
            
            request.setAttribute("product", product);
            request.setAttribute("color", color);
            request.setAttribute("colorChosen", colorChoosen);
            request.setAttribute("hardware", hardware);
            request.setAttribute("specID", specChosen);
            request.setAttribute("spec", spec);
            System.out.println(action);
            if (action.equals("UpdateProductManagement")){
                url=SUCCESS1;
            } else url= SUCCESS2;
        } catch (Exception e) {
            log ("ERROR at ProductDetailController: " + e.getMessage());
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
