/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.SaleCodeDAO;
import dtos.SaleCodeDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phath
 */
public class SaleCodeController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LIST = "saleCodeList.jsp";
    private static final String VIEW = "saleCodeDetail.jsp";
    private static final String SUCCESS = "SaleCodeController";

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String url = ERROR;
        String perform = request.getParameter("perform");
        boolean codeStatus = Boolean.parseBoolean(request.getParameter("codeStatus"));
        String codeID = request.getParameter("codeID");

        try {
            SaleCodeDAO dao = new SaleCodeDAO();
            SaleCodeDTO code = new SaleCodeDTO();
            HttpSession session = request.getSession();
            System.out.println(perform);

            if (perform == null) {

                List<SaleCodeDTO> list = dao.getSaleCodeList(codeStatus);
                if (list != null) {
                    request.setAttribute("ERROR", "list not null");

                    session.setAttribute("CODE_LIST", list);
                    url = LIST;
                } else {
                    request.setAttribute("ERROR", "list null");
                }
            } else {
                boolean check = false;
                switch (perform) {
                    case "View":
                        code = dao.getCode(codeID);
                        request.setAttribute("CODE_DETAIL", code);
                        url = VIEW;
                        break;
                    case "Update":
                        String newCodeID = request.getParameter("newCodeID");
                        String codeName = request.getParameter("codeName");
                        String percentage = request.getParameter("percentage");
                        String expDate = request.getParameter("expDate");
                        code = new SaleCodeDTO(codeID, codeName, percentage, expDate);
                        check = dao.updateSaleCode(code, newCodeID);
                        if (check) {
                            url = VIEW;
                        }
                        break;
                    case "DeActive":
                        check = dao.deactiveSaleCode(codeID);
                        if (check) {
                            List<SaleCodeDTO> list = dao.getSaleCodeList(codeStatus);
                            if (list != null) {
                                request.setAttribute("ERROR", "list not null");

                                session.setAttribute("CODE_LIST", list);
                                url = LIST;
                            } else {
                                request.setAttribute("ERROR", "list null");
                            }
                        }
                        break;
                }
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", e.toString());
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
