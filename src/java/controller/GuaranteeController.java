/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.GuaranteeDAO;
import daos.OrderDAO;
import dtos.GuaranteeDTO;
import dtos.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Pagination;

/**
 *
 * @author phath
 */
@WebServlet(name = "GuaranteeController", urlPatterns = {"/GuaranteeController"})
public class GuaranteeController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ADDED = "MainController?action=Guarantee&perform=Get";
    private static final String LIST = "guaranteeList.jsp";
    private static final String ACTION = "MainController?action=Guarantee&perform=Get";    
    private static final String FORM = "managerGuarantee.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean check = false;
        String guarantID, status ;                   
        GuaranteeDAO dao = new GuaranteeDAO();
        GuaranteeDTO guarant = new GuaranteeDTO();
        String perform = request.getParameter("perform");
        String url = ERROR;
        try {
            switch(perform){
                case "Submit":
                    String ownerName = request.getParameter("name");
                    String contactNumber = request.getParameter("contact");
                    String orderID = request.getParameter("orderID");
                    String receiveDate = request.getParameter("receiveDate");
                    String expectedDate = request.getParameter("expectedDate");
                    String guarantDescription = request.getParameter("description");
                    String guarantFee = request.getParameter("fee");
                    String guarantStatus = "Pending";
                    guarant = new GuaranteeDTO(orderID, receiveDate, expectedDate, guarantDescription, ownerName, contactNumber, guarantFee, guarantStatus);
                    check = dao.submit(guarant);
                    if(check){
                        url = ADDED;
                    }
                    break;
                    
                case "Form":
                    OrderDAO oDAO= new OrderDAO();
                    List<OrderDTO> orders = oDAO.getAllOrderID();
                    if(orders!=null){
                        request.setAttribute("Orders", orders);
                        url=FORM;
                    }
                    else{
                        request.setAttribute("EMPTY", "There's no order");
                        url = LIST;
                    }
                    break;
                    
                case "Get":
                    List<GuaranteeDTO> list = dao.getAll();
                    Pagination pagi = new Pagination();
                    String requestPage = request.getParameter("pageNum");
                    int currentPage=1;
                    if(request.getParameter("pageNum") !=null){
                        currentPage = Integer.parseInt(requestPage);
                    }
                    int pageSize = 20;
                    List<GuaranteeDTO> subList= pagi.PaginatedList(currentPage, list, pageSize);
                    if(list!=null){
                        request.setAttribute("GUARANTEE_LIST", subList);
                        request.setAttribute("pages", pagi.getNumOfPage());
                        request.setAttribute("curPage", pagi.getCurrentPage());
                        url=LIST;
                    }
                    else{
                        request.setAttribute("EMPTY", "There's no guarantee order");
                        url = LIST;
                    }
                    break;
                case "Cancel":
                    guarantID = request.getParameter("guarantID");
                    status = "Cancel";
                    check =dao.statusAction(guarantID, status);
                    if(check){
                       url = ACTION;
                    }
                    break;
                case "Complete":
                    guarantID = request.getParameter("guarantID");
                    status = "Complete";
                    check =dao.statusAction(guarantID, status);
                    if(check){
                       url = ACTION;
                    }
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", e.toString());
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
