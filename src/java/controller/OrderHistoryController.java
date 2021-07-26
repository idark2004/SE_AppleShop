/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.OrderDAO;
import daos.UserDAO;
import dtos.OrderDTO;
import dtos.UserDTO;
import dtos.ProductErrorDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class OrderHistoryController extends HttpServlet {

    public static final String ERROR="error.jsp";
    public static final String SUCCESS="orderHistory.jsp";
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
        ProductErrorDTO msg = new ProductErrorDTO();
        try {
            UserDAO uDao = new UserDAO();
            UserDTO user = uDao.getUserProfile(request.getParameter("userid"));
            System.out.println(user.getUserID());
            OrderDAO dao = new OrderDAO();
            ArrayList<OrderDTO> list = dao.getAllUserOrder(user.getUserID().trim());
            System.out.println(list);
            //pagination
            String pageNum = request.getParameter("pageNum");
            int page = 0;
            if (pageNum != null) {
                page = Integer.parseInt(pageNum);
            } else {
                page = 1;
            } 
            int product_per_page = 20;// set product per page here
            int pNum = list.size();
            System.out.println(pNum);
            int pages = 0;
            if (pNum % product_per_page == 0) {
                pages = pNum / product_per_page;
            } else {
                pages = (pNum / product_per_page) + 1;
            }
            //end pagination
            if(list != null){
                  if (request.getParameter("pageNum") != null) {
                    if (pNum >= (page * product_per_page)) {
                        List<OrderDTO> subList = list.subList(((page - 1) * product_per_page), (page * product_per_page));
                        request.setAttribute("ORDER_LIST", subList);
                    } else {
                        List<OrderDTO> subList = list.subList(((page - 1) * product_per_page), pNum);
                        request.setAttribute("ORDER_LIST", subList);
                    }
                } else {
                    if (pNum < product_per_page) {
                        request.setAttribute("ORDER_LIST", list);
                    } else {
                        List<OrderDTO> subList = list.subList(0, product_per_page);
                        request.setAttribute("ORDER_LIST", subList);
                    }
                }
                request.setAttribute("pages", pages);
                request.setAttribute("curPage", page);
                request.setAttribute("user", user);
                if (list.isEmpty()){
                    request.setAttribute("EMPTY_LIST", "this user has not made an order yet !!");
                    System.out.println(msg.getMsg());
                }
            } else{
                msg.setMsg("this user has not made an order yet !!");
                request.setAttribute("EMPTY_LIST", "this user has not made an order yet !!");
                System.out.println(msg.getMsg());
            }
            url = SUCCESS;
        } catch (Exception e) {
            log ("ERROR at OrderHistoryController: " + e.getMessage());
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
