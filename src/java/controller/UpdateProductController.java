/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.ProductDAO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ADMIN
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class UpdateProductController extends HttpServlet {
    
    private static final String UPLOAD_DIR = "images";
    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart("Photo");
            fileName = (String) getFileName(filePart);
 
            String applicationPath = request.getServletContext().getRealPath("");
            
            String basePath = applicationPath + UPLOAD_DIR + File.separator;
            System.out.println(basePath);
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }
 
        } catch (Exception e) {
            e.printStackTrace();
            fileName = "";
        }
        return fileName;
    }
    
    private String getFileName(Part part) {       
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
 
        return null;
    }

    private static final String ERROR = "error.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("productID");
        String colorChoosen = request.getParameter("color");
        String specID = request.getParameter("specID");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        
        try{
            String imgUrl=uploadFile(request);
            imgUrl="images/"+imgUrl;
            System.out.println(imgUrl.length());
            //String photo=request.getParameter("photo");
            String name = request.getParameter("name");
            int totalQuantity = Integer.parseInt(request.getParameter("totalQuantity"));
            ProductDAO pDAO = new ProductDAO();
            System.out.println("go through?");
            if (imgUrl.length()<=7){
                if(pDAO.UpdateProduct(id, name, totalQuantity)){
                    double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    if (pDAO.UpdateProductSpec(specID, price, quantity)){
                        url="MainController?action=UpdateProductManagement&productID="+id.trim()+"&color="+colorChoosen.trim()+"&specID="+specID.trim();
                        request.setAttribute("UpSuccess","Update successfully");
                        System.out.println("Update success");
                    }
                }
            } else {
                System.out.println("go");
                //String imgUrl=uploadFile(request);
                System.out.println("through?");
                if(pDAO.UpdateProductWithImage(id, name, totalQuantity, imgUrl)){
                    double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    if (pDAO.UpdateProductSpec(specID, price, quantity)){
                        url="MainController?action=UpdateProductManagement&productID="+id.trim()+"&color="+colorChoosen.trim()+"&specID="+specID.trim();
                        request.setAttribute("UpSuccess","Update successfully");
                        System.out.println("Update success");
                    }
                }
            }
            request.setAttribute("error","No product found to update");
        } catch (Exception e) {
            log ("ERROR at UpdateUserController: " + e.getMessage());
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
