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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author anime
 */
@WebServlet(name = "SearchProductController", urlPatterns = {"/SearchProductController"})
public class SearchProductController extends HttpServlet {
     private static final String ERROR = "error.jsp";
    private static final String VIEW = "productList.jsp";
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
        String keyWord = request.getParameter("keyWord").toLowerCase();
        String url = ERROR;
        try {
            ProductErrorDTO msg = new ProductErrorDTO();
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> list = dao.viewProduct("","True");
            for(int i=list.size()-1;i>=0;i--) {
                if(!list.get(i).getName().toLowerCase().contains(keyWord.toLowerCase())){
                    System.out.println(list.get(i).getName().trim());
                list.remove(list.get(i));
                }
            }
            request.setAttribute("keyWord",keyWord);
            System.out.println(keyWord);
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
                    System.out.println(pNum);
                    System.out.println(page);
            if(list != null){
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
                    request.setAttribute("pages", pages);
                    request.setAttribute("curPage", page);
                    //end pagination
            url = VIEW;
            }
            else{
            msg.setMsg("We currently do not have the product that you want to search.");
            request.setAttribute("EMPTY_LIST", msg);
            }
        }catch(Exception ex){
            request.setAttribute("ERROR", ex.toString());
        }
        finally {
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
