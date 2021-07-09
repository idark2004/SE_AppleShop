/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers_backup;

import daos.ProductDAO;
import dtos.CartItemDTO;
import dtos.ProductDTO;
import java.io.IOException;
import java.util.ArrayList;
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
public class AddToCartController extends HttpServlet {

//    cart.add(new CartItemDTO(prDAO.findSpec(request.getParameter("productID"), 
//                        request.getParameter("color"), request.getParameter("ram"), 
//                        request.getParameter("storage")), 1));
    private static final String SUCCESS ="MainController?action=Product&perform=ViewDetail";
    private static final String ERROR = "error.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.err.println("Run Through AddToCartController");
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try{
            ProductDAO prDAO=new ProductDAO();
            String productID= request.getParameter("productID").trim();
            String color= request.getParameter("color").trim();
            String specID= request.getParameter("hardware").trim();
            int qty = Integer.parseInt(request.getParameter("Quantity"));
//            String ram=specID.split("-")[0].trim();
//            String storage=specID.split("-")[1].trim();
            
            ProductDTO product=prDAO.GetSpec(specID);
            if(prDAO.GetSpec(specID)==null) System.err.println("null spec");
            else System.err.println("not null");
            if (product!=null){
                for(int i=0; i<qty; i++){
                    if(session.getAttribute("cart")==null){
                        List<CartItemDTO> cart = new ArrayList<CartItemDTO>();
                        cart.add(new CartItemDTO(prDAO.GetSpec( 
                                specID), 1));
                        session.setAttribute("cart", cart);
                        url=SUCCESS +"&productID="+productID+"&color="+color+"&specID="+specID;
                    }
                    else {
                        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
                        int index = isExisting( 
                                specID, cart);
                        if (index == -1){
                            cart.add(new CartItemDTO(prDAO.GetSpec(
                                specID), 1));
                        }
                        else {
                            int quantity = cart.get(index).getQuantity() + 1;
                            cart.get(index).setQuantity(quantity);
                        }
                        session.setAttribute("cart", cart);
                        url=SUCCESS+"&productID="+productID+"&color="+color+"&specID="+specID;
                    }
                }
            } else {
                request.setAttribute("error", "the item isnt exist");
            }
        } catch (Exception e) {
            log ("ERROR at AddToCartController: " + e.getMessage());
        } finally {
            //List<CartItemDTO> SesCart = (List<CartItemDTO>) session.getAttribute("cart");
            //System.out.println("in cart have: " + SesCart.get(0).getProduct().getColor() + " " + SesCart.get(0).getProduct().getPrice() + " With quantity: " + SesCart.get(0).getQuantity() + " and the image: " + SesCart.get(0).getProduct().getImage());
            //response.sendRedirect(url);
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    
    private int isExisting(String specID, List<CartItemDTO> cart){
        System.out.println("isExisting do work");
        for (int i = 0; i < cart.size(); i++){
            if( cart.get(i).getProduct().getSpecID().trim().equalsIgnoreCase(specID)){
                System.out.println("the index is: " + i);
                int quantity = cart.get(i).getQuantity() + 1;
                System.out.println("with this quantity:" + quantity);
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
