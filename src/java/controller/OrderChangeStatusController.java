/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.DBSupport;

/**
 *
 * @author anime
 */
public class OrderChangeStatusController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static final String ERROR = "error.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("orderID").trim();
        String status = request.getParameter("orderStatus");
        OrderDAO oDAO=new OrderDAO();
        String url=ERROR;
        boolean check=false;
        try {            
            if (status.equals("Completed")){
                Calendar cal = Calendar.getInstance();
                cal.add(Calendar.DATE, 0);
                String createDate=(cal.getTime().getMonth()+1)+"/"+cal.getTime().getDate()+"/"+(cal.getTime().getYear()+1900);
                DBSupport db = new DBSupport();
                db.increaseCount("orderCount", id);
                check = oDAO.CompleteStatus(id, status, createDate);
            }
            else {
                check = oDAO.ChangeStatus(id, status);
                oDAO.returnQuantity(id);
            }
            if (check) {
                url="MainController?action=OrderDetail&orderID="+id;
            }
        }catch(Exception ex){
            request.setAttribute("message", ex.toString());
            request.setAttribute("ERROR", ex.toString());
        }finally{
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
