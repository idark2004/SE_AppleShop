/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.ProductDAO;
import dtos.ProductDTO;
import dtos.ProductErrorDTO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import utils.DBSupport;

/**
 *
 * @author ADMIN
 */
public class ProductController extends HttpServlet {
  private static final String UPLOAD_DIR = "images";
    private static final String ERROR = "error.jsp";
    private static final String VIEW = "productList.jsp";
    private static final String DETAIL = "product_details.jsp";

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
        String perform = request.getParameter("perform");
        ProductErrorDTO msg = new ProductErrorDTO();
        try {
            switch (perform) {
                case "ViewProduct":
                    ProductDAO dao = new ProductDAO();
                    String categoryID = request.getParameter("categoryID");
                    String status = request.getParameter("status");
                    if (request.getParameter("status") == null) {
                        status = "True";
                    }

                    List<ProductDTO> list = dao.viewProduct(categoryID, status);
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
                    request.setAttribute("pages", pages);
                    request.setAttribute("curPage", page);
                    //end pagination      

                    request.setAttribute("cateID", categoryID);

                    url = VIEW;

                    break;
                case "ViewDetail":
                    String id = request.getParameter("productID").trim();
                    String colorChoosen = request.getParameter("color");
                    String specChosen = request.getParameter("specID");

                    ProductDAO pDAO = new ProductDAO();

                    ProductDTO product = pDAO.getProduct(id);
                    List<ProductDTO> color = pDAO.getAllColor(id);
                    if (colorChoosen != null) {
                        ProductDTO spec = pDAO.getPriceAndQuantity(id, colorChoosen, specChosen);
                        List<ProductDTO> hardware = pDAO.getAllHardwareWithColor(id, colorChoosen);
                        request.setAttribute("colorChosen", colorChoosen);
                        request.setAttribute("hardware", hardware);
                        request.setAttribute("spec", spec);
                        request.setAttribute("specID", specChosen);
                    }
                    request.setAttribute("product", product);
                    request.setAttribute("color", color);

                    url = DETAIL;
                    break;
                case "addProduct":
                    DBSupport dbs = new DBSupport();
                    System.out.println("start Addproduct");
                    String pname = request.getParameter("pname");
                    String cateID = request.getParameter("cateID");
                    String quantity = request.getParameter("quantity");
                    String des = request.getParameter("des");
//                    String img = request.getParameter("img");
                    //String newSpecID = request.getParameter("newSpecID");
                    String newColor = request.getParameter("newColor");
                    String newRam = request.getParameter("newRam");
                    String newStorage = request.getParameter("newStorage");
                    double newPrice = Double.parseDouble(request.getParameter("newPrice"));
                    int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));
                    ProductDTO newProductSpec=new ProductDTO();
                    String imgUrl = UPLOAD_DIR+"\\"+uploadFile(request);
                    int a = dbs.getNumbRows("productID","tblProducts");
                    //newProductSpec.setSpecID(newSpecID);
                    pDAO = new ProductDAO();
                    pDAO.addProduct(pname, cateID, des, imgUrl);
                    newProductSpec.setProductID(cateID+"-"+a);
                    newProductSpec.setColor(newColor);
                    newProductSpec.setRam(newRam);
                    newProductSpec.setStorage(newStorage);
                    newProductSpec.setPrice(newPrice);
                    newProductSpec.setSpecQuantity(newQuantity); 
                    pDAO = new ProductDAO();
                    System.out.println("productID="+cateID+"-"+a);    
                    if (pDAO.CreateSpec1(newProductSpec) || pDAO.addProduct(pname, cateID, des, imgUrl)){
                        url="MainController?action=ProductController&perform=ViewDetail&productID="+cateID+"-"+a;
                        System.out.println("Add thanh cong va productID="+cateID+"-"+a); 
                        System.out.println("success");
                    }
                    
                    break;
                    
                
            }
        } catch (Exception e) {
            if (e.toString().contains("NullPointerException")) {
                msg.setMsg("Sorry our shop currently doesn't have these products in stock !!");
                request.setAttribute("EMPTY_LIST", msg);
                request.setAttribute(e.toString(), "ERROR");
                url = VIEW;
            } else {
                request.setAttribute("Error at ProductController", e.toString());
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
        
    }
  
    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart("img");
            fileName = (String) getFileName(filePart);
 
            String applicationPath = request.getServletContext().getRealPath("");
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
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
