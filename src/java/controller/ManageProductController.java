/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.ProductDAO;
import dtos.ProductDTO;
import dtos.ProductErrorDTO;
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
 * @author phath
 */
public class ManageProductController extends HttpServlet {

    private static final String ALL = "managerProductList.jsp";
    private static final String DETAIL = "managerProductDetail.jsp";
    private static final String UPDATE_FAIL="updateProduct.jsp";
    private static final String ERROR = "error.jsp";

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
        ProductDAO dao = new ProductDAO();
        ProductErrorDTO error = new ProductErrorDTO();
        HttpSession session = request.getSession();
        String productID = request.getParameter("productID");
        String categoryID = request.getParameter("categoryID");
        String perform = request.getParameter("perform");
        try {
            switch (perform) {
                case "Get":
                    List<ProductDTO> list = dao.viewAllProduct(categoryID);
                    //Pagination
                    String pageNum = request.getParameter("pageNum");
                    int page = 0;
                    if (pageNum != null) {
                        page = Integer.parseInt(pageNum);
                    } else {
                        page = 1;
                    }
                    int product_per_page = 20;// set product per page here
                    int pNum = list.size();
                    int pages = 0;
                    if (pNum % product_per_page == 0) {
                        pages = pNum / product_per_page;
                    } else {
                        pages = (pNum / product_per_page) + 1;
                    }

                    if (request.getParameter("pageNum") != null) {
                        if (pNum >= (page * product_per_page)) {
                            List<ProductDTO> subList = list.subList(((page - 1) * product_per_page), (page * product_per_page));
                            request.setAttribute("PRODUCT_LIST", subList);
                        } else {
                            List<ProductDTO> subList = list.subList(((page - 1) * product_per_page), pNum);
                            request.setAttribute("PRODUCT_LIST", subList);
                        }
                    } else {
                        if (pNum < product_per_page) {
                            request.setAttribute("PRODUCT_LIST", list);
                        } else {
                            List<ProductDTO> subList = list.subList(0, product_per_page);
                            request.setAttribute("PRODUCT_LIST", subList);
                        }
                    }
                    url = ALL;
                    break;
                    
                case "Manage Detail":
                    List<ProductDTO> specList = dao.getAllSpec(productID);
                    ProductDTO pro = dao.getBasicDetail(productID);
                    if (specList == null) {
                        error.setMsg("NO SPEC FOUND");
                        request.setAttribute("ERROR", error);
                    } else {
                        session.setAttribute("SPEC_LIST", specList);
                        session.setAttribute("BASIC", pro);
                        url = DETAIL;
                    }
                    break;
                    
                case "Update Spec":
                    String specID = request.getParameter("specID");
                    String color = request.getParameter("color");
                    String ram = request.getParameter("ram");
                    String storage = request.getParameter("storage");
                    int specQuantity = Integer.parseInt(request.getParameter("specQuantity"));
                    double price = Double.parseDouble(request.getParameter("specPrice"));
                    boolean status = Boolean.parseBoolean(request.getParameter("specStatus"));
                    pro = new ProductDTO(price, status, ram, storage, color, specID, specQuantity);
                    if(dao.updateSpec(pro)){
                        request.setAttribute("UPDATED", specID);
                        url = "ManageProductController?perform=Manage+Detail&productID="+productID;
                    }else{
                        request.setAttribute("FAILED", specID);
                        url=UPDATE_FAIL;
                    }
                    break;
                    
                case "Update Basic":
                    String productName = request.getParameter("productName");
                    String description = request.getParameter("description");
                    String image = request.getParameter("image");
                    break;
            }
        } catch (Exception e) {
            if (e.toString().contains("NullPointerException")) {
                error.setMsg("Sorry our shop currently doesn't have these products in stock !!");
                request.setAttribute("EMPTY_LIST", error);
                url = ALL;
            } else {
                error.setMsg("Error at ManageProductController: " + e.toString());
                request.setAttribute("ERROR", error);
            }
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
