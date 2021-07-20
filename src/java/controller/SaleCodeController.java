/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.SaleCodeDAO;
import dtos.SaleCodeDTO;
import java.io.IOException;
import java.util.Calendar;
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
    private static final String LIST = "ManagerSaleCodeList.jsp";
    private static final String VIEW = "ManagerSaleCodeDetail.jsp";
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
        String codeStatus = request.getParameter("codeStatus");
        if (codeStatus==null){
            codeStatus="true";
        }
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

                    request.setAttribute("CODE_LIST", list);
                    url = LIST;
                } else {
                    request.setAttribute("ERROR", "list null");
                }
            } else {
                boolean check = false;
                switch (perform) {
                    case "List":
                        List<SaleCodeDTO> list = dao.getSaleCodeList(codeStatus);
                        if (list != null) {
                            request.setAttribute("ERROR", "list not null");

                            request.setAttribute("CODE_LIST", list);
                            url = LIST;
                        } else {
                            request.setAttribute("ERROR", "list null");
                            url = LIST;
                        }
                        break;
                    case "View":
                        code = dao.getCode(codeID);
                        request.setAttribute("CODE_DETAIL", code);
                        request.setAttribute("purpose", "View");
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
                            url="MainController?action=SaleCode&perform=View&codeID="+codeID;
                        }
                        break;
                    case "DeActive":
                        check = dao.deactiveSaleCode(codeID);
                        if (check) {
                            list = dao.getSaleCodeList(codeStatus);
                            if (list != null) {
                                request.setAttribute("ERROR", "list not null");

                                session.setAttribute("CODE_LIST", list);
                                url = LIST;
                            } else {
                                request.setAttribute("ERROR", "list null");
                            }
                        }
                        break;
                    case "addCode":
                        request.setAttribute("purpose", "addCode");
                        url = VIEW;
                        break;
                    case "Add":
                        String newCodeId = request.getParameter("newCodeID");
                        String newCodeName = request.getParameter("codeName");
                        String newPercentage = request.getParameter("percentage");
                        String newExpDate = request.getParameter("expDate");
                        String newCreateDate = request.getParameter("createDate");
                        
//                        Calendar cal = Calendar.getInstance();
//                        cal.add(Calendar.DATE, 0);
//                        String createDate=(cal.getTime().getMonth()+1)+"/"+cal.getTime().getDate()+"/"+(cal.getTime().getYear()+1900);
                        
                        code = new SaleCodeDTO(newCodeId, newCodeName, newPercentage, newCreateDate, newExpDate, true);
                        
                        dao.createSaleCode(code);
                        url="MainController?action=SaleCode&perform=List";
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
